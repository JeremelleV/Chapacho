import 'package:flutter/material.dart';
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'dart:typed_data'; // Needed for file bytes
import 'package:chapacho_client/chapacho_client.dart'; // Needed to talk to server
import '../main.dart'; // Needed to access the global 'client' variable

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
  }

  void _stopRecording() async {
    print("BUTTON PRESSED: Stopping...");
    
    // Stop the recorder
    final path = await recorderController.stop();
    
    setState(() {
      isRecording = false;
    });
    
    final dir = await getApplicationDocumentsDirectory();
    final manualPath = "${dir.path}/chapacho_recording.m4a";
    
    print("SUCCESS: Recording stopped.");
    print("File should be at: $manualPath");
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Saved to: $manualPath")),
    );

    // TODO: Send 'manualPath' to Serverpod
  }

  void _addTag(String type) {
    if (!isRecording) return;
    
    final timestamp = recorderController.elapsedDuration.inSeconds;
    tags.add({'type': type, 'timestamp': timestamp});
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Chapacho noted: $type at ${timestamp}s"), 
        duration: const Duration(milliseconds: 600),
      ),
    );
  }

  @override
  void dispose() {
    recorderController.dispose();
    super.dispose();
  }

  Future<void> _testServerConnection() async {
    print("🔵 TEST: Starting upload check...");
    try {
      final fileName = "test_${DateTime.now().millisecondsSinceEpoch}.txt";
      final fileData = ByteData.sublistView(Uint8List.fromList("Hello Serverpod!".codeUnits));

      final success = await client.lecture.uploadLecture(fileName, fileData);

      if (success) {
        print("UPLOAD SUCCESS!");

        await client.lecture.saveLectureNote(fileName, []);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Success! File uploaded & saved.")),
        );
      } else {
        print("Upload returned false (Check Server Logs)");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Upload failed.")),
        );
      }
    } catch (e) {
      print("ERROR: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
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
          
          // Temporary Test Button
          ElevatedButton(
            onPressed: _testServerConnection, 
            child: const Text("TEST UPLOAD"),
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