import 'package:cloud_firestore/cloud_firestore.dart';

class DiaryEntry {
  DateTime date;
  String description;
  int rating;

  DiaryEntry({required this.date, required this.description, required this.rating}) {
    if (description.length > 140) {
      throw Exception('Description can only be 140 characters long.');
    }
    if (rating < 1 || rating > 5) {
      throw Exception('Rating must be between 1 and 5.');
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'date': Timestamp.fromDate(date),
      'description': description,
      'rating': rating,
    };
  }

  factory DiaryEntry.fromMap(Map<String, dynamic> map) {
    return DiaryEntry(
      date: (map['date'] as Timestamp).toDate(),
      description: map['description'],
      rating: map['rating'],
    );
  }
}
