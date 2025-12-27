import 'package:chapacho_flutter/singletons.dart';
import 'package:flutter/material.dart';
import 'package:chapacho_client/chapacho_client.dart'; 
import '../main.dart'; 
import 'recording_screen.dart';
import 'document_screen.dart'; 

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Lecture>? _lectures;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadLectures();
  }

  Future<void> _loadLectures() async {
    setState(() => _isLoading = true);
    try {
      // This matches your new Endpoint function
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
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => sessionManager.signOutDevice(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RecordingScreen()),
          );
          _loadLectures(); // Refresh when back
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
        final lecture = _lectures![index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.deepPurple,
              child: Icon(Icons.graphic_eq, color: Colors.white),
            ),
            title: Text(lecture.title),
            subtitle: Text(
              "Created: ${lecture.date.toString().split('.')[0]}",
              style: const TextStyle(fontSize: 12),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // NAVIGATE TO VIEWER
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DocumentScreen(lecture: lecture),
                ),
              );
            },
          ),
        );
      },
    );
  }
}