import 'package:flutter/material.dart';
import 'package:chapacho_client/chapacho_client.dart'; // For LectureNote class
import '../main.dart'; // For 'client' and 'sessionManager'
import 'recording_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Variable to hold the list of notes
  List<LectureNote>? _lectures;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadLectures();
  }

  // Fetch data from the Server
  Future<void> _loadLectures() async {
    setState(() => _isLoading = true);
    try {
      final lectures = await client.lecture.getMyLectures();
      setState(() {
        _lectures = lectures;
        _isLoading = false;
      });
    } catch (e) {
      print("Error loading lectures: $e");
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Lectures"),
        actions: [
          // LOGOUT BUTTON
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              sessionManager.signOutDevice();
            },
          ),
        ],
      ),
      // FLOATING ACTION BUTTON -> Go to Recording Screen
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          // Wait for the user to come back, then reload the list
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RecordingScreen()),
          );
          _loadLectures();
        },
        label: const Text("Record New"),
        icon: const Icon(Icons.mic),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _lectures == null || _lectures!.isEmpty
              ? _buildEmptyState()
              : _buildList(),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.note_alt_outlined, size: 80, color: Colors.grey),
          const SizedBox(height: 16),
          const Text("No lectures yet!", style: TextStyle(fontSize: 18, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildList() {
    return ListView.builder(
      itemCount: _lectures!.length,
      itemBuilder: (context, index) {
        final note = _lectures![index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.deepPurple,
              child: Icon(Icons.graphic_eq, color: Colors.white),
            ),
            title: Text(note.title),
            subtitle: Text(
              "Created: ${note.createdAt.toString().split('.')[0]}",
              style: const TextStyle(fontSize: 12),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // TODO: Open the "Full Doc" viewer here
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Opening ${note.title}..."))
              );
            },
          ),
        );
      },
    );
  }
}