import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';
import 'dart:typed_data';
import '../generated/protocol.dart';

class LectureEndpoint extends Endpoint {
  
  // 1. Upload (Public)
  Future<bool> uploadLecture(Session session, String fileName, ByteData fileData) async {
    try {
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

  // 2. Save Lecture (SECURE)
  @override
  bool get requireLogin => true;

  Future<bool> saveLectureNote(Session session, String fileName, List<NoteTag> tags) async {
    final authInfo = await session.authenticated;
    final userId = authInfo?.userId;
    
    if (userId == null) {
      throw Exception("User not logged in");
    }

    final String publicUrl = "http://10.0.2.2:8082/public/$fileName"; //"http://localhost:8082/public/$fileName";
    
    var note = LectureNote(
      userId: userId, 
      title: "Lecture ${DateTime.now().toLocal().toString().split(' ')[0]}",
      audioPath: publicUrl,
      createdAt: DateTime.now(),
      tags: tags,
      transcript: "Waiting for Gemini...", 
      formattedContent: "Pending...", 
    );

    await LectureNote.db.insertRow(session, note);
    return true;
  }

  // 3. Get All Lectures (For the Home Screen)
  Future<List<LectureNote>> getMyLectures(Session session) async {
    final authInfo = await session.authenticated;
    final userId = authInfo?.userId;
    
    if (userId == null) return [];

    return await LectureNote.db.find(
      session,
      where: (t) => t.userId.equals(userId),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
    );
  }
}