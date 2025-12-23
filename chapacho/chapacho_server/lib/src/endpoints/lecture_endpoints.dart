import 'package:serverpod/serverpod.dart';
import 'dart:typed_data'; // Needed for ByteData
import '../generated/protocol.dart';

class LectureEndpoint extends Endpoint {
  
  /// 1. Upload the File directly (Simpler method)
  Future<bool> uploadLecture(Session session, String fileName, ByteData fileData) async {
    try {
      // Save directly to the 'public' folder
      await session.storage.storeFile(
        storageId: 'public',
        path: fileName,
        byteData: fileData,
      );
      return true;
    } catch (e) {
      print("Upload Failed: $e");
      return false;
    }
  }

  /// 2. Save the Database Entry
  Future<bool> saveLectureNote(Session session, String fileName, List<NoteTag> tags) async {
    
    // Construct the public URL manually
    final String publicUrl = "http://localhost:8082/public/$fileName";
    
    var note = LectureNote(
      title: "Lecture ${DateTime.now().toLocal().toString().split(' ')[0]}",
      audioPath: publicUrl,
      createdAt: DateTime.now(),
      tags: tags,
      transcript: "Waiting for processing...", 
      formattedContent: "Analysis pending...", 
    );

    await LectureNote.db.insertRow(session, note);
    return true;
  }
}