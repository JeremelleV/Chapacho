import 'package:flutter/material.dart';
import 'package:chapacho_client/chapacho_client.dart';
import '../models/lecture_block.dart'; // Import your helper

class DocumentScreen extends StatefulWidget {
  final Lecture lecture;

  const DocumentScreen({super.key, required this.lecture});

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  List<LectureBlock> blocks = [];

  @override
  void initState() {
    super.initState();
    // 1. Decode the JSON string back into Objects
    blocks = LectureBlock.decodeList(widget.lecture.contentJson);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.lecture.title)),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: blocks.length,
        itemBuilder: (context, index) {
          final block = blocks[index];

          // 2. Determine Color based on Tag
          Color bgColor = Colors.transparent;
          IconData? icon;
          
          if (block.tag == 'Important') {
            bgColor = Colors.amber.withOpacity(0.2);
            icon = Icons.star;
          } else if (block.tag == 'Funny') {
            bgColor = Colors.orange.withOpacity(0.2);
            icon = Icons.emoji_emotions;
          } else if (block.tag == 'Question') {
            bgColor = Colors.blue.withOpacity(0.2);
            icon = Icons.help;
          } else if (block.tag == 'Review') {
            bgColor = Colors.green.withOpacity(0.2);
            icon = Icons.bookmark;
          }

          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(8),
              border: block.tag != null ? Border.all(color: Colors.grey.shade300) : null,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (icon != null) ...[
                  Icon(icon, size: 20, color: Colors.black54),
                  const SizedBox(width: 8),
                ],
                Expanded(
                  child: Text(
                    block.text,
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),
                ),
                Text(
                  "${block.timestampSeconds}s",
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}