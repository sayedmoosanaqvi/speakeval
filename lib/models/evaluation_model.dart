// lib/models/evaluation_model.dart

import 'package:cloud_firestore/cloud_firestore.dart';

class Evaluation {

  final String? id; 
  final String type;
  final String? title;
  final String? remarks;
 
  final DateTime date; 
  final String? audioPath;
  final double? duration;
  final double? score;

  Evaluation({
    this.id,
    required this.type,
    this.title,
    this.remarks,
    required DateTime date, 
    this.audioPath,
    this.duration,
    this.score,
  }) : date = date; 
  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'title': title,
      'remarks': remarks,
      
      'date': date, 
      'audioPath': audioPath,
      'duration': duration,
      'score': score,
    };
  }

  
  factory Evaluation.fromFirestore(DocumentSnapshot doc) {

    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    
    return Evaluation(

      id: doc.id, 
      type: data['type'] as String,
      title: data['title'] as String?,
      remarks: data['remarks'] as String?,
   
      date: (data['date'] as Timestamp).toDate(), 
      audioPath: data['audioPath'] as String?,
      duration: (data['duration'] as num?)?.toDouble(),
      score: (data['score'] as num?)?.toDouble(),
    );
  }
}