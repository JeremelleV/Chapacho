import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';
import 'dart:typed_data';
import '../generated/protocol.dart';

import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class LectureEndpoint extends Endpoint {
  
  // 1. GET ALL (For the Home Screen)
  Future<List<Lecture>> getMyLectures(Session session) async {
    final userId = await session.authenticated?.userId;
    if (userId == null) return [];

    return await Lecture.db.find(
      session,
      where: (t) => t.userId.equals(userId),
      orderBy: (t) => t.date,
      orderDescending: true,
    );
  }

  // 2. SAVE LECTURE (The missing piece)
  Future<bool> saveLecture(Session session, Lecture lecture) async {
    final userId = await session.authenticated?.userId;
    if (userId == null) return false;

    // Force the userId to match the sender (Security)
    lecture.userId = userId;
    lecture.date = DateTime.now();

    await Lecture.db.insertRow(session, lecture);
    return true;
  }
}