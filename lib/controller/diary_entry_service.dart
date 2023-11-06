import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/diary_entry_model.dart';

class DiaryEntryService {
  final _auth = FirebaseAuth.instance.currentUser;
  final CollectionReference _diaryCollection;

  DiaryEntryService():
        _diaryCollection = FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('diaryEntries');

  Future<DocumentReference<Object?>> addDiaryEntry(DiaryEntry entry) async {
    return await _diaryCollection.add(entry.toMap());
  }

  Stream<List<DiaryEntry>> getDiaryEntries() {
    return _diaryCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => DiaryEntry.fromMap(doc.data() as Map<String, dynamic>)).toList();
    });
  }

  Future<void> updateDiaryEntry(DiaryEntry entry) async {
    return await _diaryCollection.doc(entry.date as String?).update(entry.toMap());
  }

  Future<void> deleteDiaryEntry(DateTime date) async {
    await _diaryCollection.doc(date.toString()).delete();
  }
}
