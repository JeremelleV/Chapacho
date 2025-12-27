import 'package:chapacho_flutter/singletons.dart';
import 'package:flutter/material.dart';
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'dart:typed_data'; // Needed for file bytes
import 'package:chapacho_client/chapacho_client.dart'; // Needed to talk to server
import '../main.dart'; // Needed to access the global 'client' variable
import 'dart:async'; // for Timer
import 'package:chapacho_client/chapacho_client.dart';
import '../models/lecture_block.dart'; // Import your helper

class RecordingScreen extends StatefulWidget {
  const RecordingScreen({super.key});

  @override
  State<RecordingScreen> createState() => _RecordingScreenState();
}

class _RecordingScreenState extends State<RecordingScreen> {
  late final RecorderController recorderController;
  bool isRecording = false;
  List<Map<String, dynamic>> tags = []; 

  @override
  void initState() {
    super.initState();
    recorderController = RecorderController();
  }

  List<LectureBlock> generatedBlocks = [];
  Timer? _simulationTimer;
  int _seconds = 0;

  void _startRecording() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Microphone permission required!")),
      );
      return; 
    }

    final dir = await getApplicationDocumentsDirectory();
    final path = "${dir.path}/chapacho_recording.m4a";

    print("🎙️ Starting recording to: $path");
    await recorderController.record(path: path); 

    setState(() {
      isRecording = true;
    });

    _simulationTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
        _seconds += 3;
        setState(() {
          generatedBlocks.add(LectureBlock(
            text: "The professor is explaining concept #$_seconds... blah blah blah.",
            timestampSeconds: _seconds,
            tag: null, // Default is no tag
          ));
        });
    });
  }

  void _addTag(String type) {
    if (!isRecording) return;
    
    // Convert the LAST block to be tagged
    if (generatedBlocks.isNotEmpty) {
      final lastBlock = generatedBlocks.last;
      
      // Replace the last block with a tagged version
      generatedBlocks[generatedBlocks.length - 1] = LectureBlock(
        text: lastBlock.text + " (Marked as $type!)",
        timestampSeconds: lastBlock.timestampSeconds,
        tag: type,
      );
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Tagged: $type")),
      );
    }
  }

  void _stopRecording() async {
    print("BUTTON PRESSED: Stopping...");

    _simulationTimer?.cancel();
    
    // Stop the recorder
    final path = await recorderController.stop();
    
    setState(() {
      isRecording = false;
    });

    try {
      final jsonString = LectureBlock.encodeList(generatedBlocks);
      
      final newLecture = Lecture(
        title: "Lecture ${DateTime.now().hour}:${DateTime.now().minute}",
        date: DateTime.now(),
        durationSeconds: _seconds,
        userId: 0, // Server ignores this
        contentJson: jsonString, // <--- THE DATA
      );

      final success = await client.lecture.saveLecture(newLecture);
      
      if (success) {
        if (mounted) Navigator.pop(context); // Go back to Home
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to save to Serverpod.")),
        );
      }
    } catch (e) {
      print("Save Error: $e");
    }
  }

  @override
  void dispose() {
    recorderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chapacho is Listening...")),
      body: Column(
        children: [
          // 1. The Mascot Area 
          const Expanded(
            flex: 2,
            child: Center(
              child: Icon(Icons.person_pin, size: 100, color: Colors.grey),
            ),
          ),
                
          // 2. The Voice Spikes
          Container(
            height: 100,
            color: Colors.black12,
            child: AudioWaveforms(
              enableGesture: true,
              size: Size(MediaQuery.of(context).size.width, 100),
              recorderController: recorderController,
              waveStyle: const WaveStyle(
                waveColor: Colors.deepPurple,
                extendWaveform: true,
                showDurationLabel: true, 
                spacing: 8.0,
                showBottom: false,
              ),
            ),
          ),

          // 3. The "Note" Buttons
          Expanded(
            flex: 2,
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              children: [
                _buildTagButton("Important", Colors.amber, Icons.star),
                _buildTagButton("Funny", Colors.orange, Icons.emoji_emotions),
                _buildTagButton("Question", Colors.blue, Icons.help),
                _buildTagButton("Review", Colors.green, Icons.bookmark),
              ],
            ),
          ),

          // 4. Record/Stop Button
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: FloatingActionButton.extended(
              onPressed: isRecording ? _stopRecording : _startRecording,
              label: Text(isRecording ? "Stop Listening" : "Start Lecture"),
              icon: Icon(isRecording ? Icons.stop : Icons.mic),
              backgroundColor: isRecording ? Colors.red : Colors.deepPurple,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTagButton(String label, Color color, IconData icon) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      onPressed: () => _addTag(label),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40),
          const SizedBox(height: 10),
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        ],
      ),
    );
  }
}