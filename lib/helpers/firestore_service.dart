import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/evaluation_model.dart';

class FirestoreService {
  static final FirestoreService _instance = FirestoreService._internal();
  factory FirestoreService() => _instance;
  FirestoreService._internal();

  final CollectionReference _evaluationsCollection =
      FirebaseFirestore.instance.collection('evaluations');

  // Helper to get user's specific favorite path
  CollectionReference? _getFavoritesCollection() {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return null;
    return FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('favorites');
  }

  // ------------------------------------------------------------------
  // 1. INSERT OPERATION (Restored for creating new records)
  // ------------------------------------------------------------------
  Future<String> insertEvaluation(Evaluation evaluation) async {
    try {
      DocumentReference docRef = await _evaluationsCollection.add(
        evaluation.toMap(),
      );
      print("SUCCESS: Evaluation written with ID: ${docRef.id}");
      return docRef.id;
    } on FirebaseException catch (e) {
      print("!!! FIRESTORE INSERT FAILED !!! Error: ${e.message}");
      rethrow;
    }
  }

  // ------------------------------------------------------------------
  // 2. DELETE OPERATION (Cascading delete from global and favorites)
  // ------------------------------------------------------------------
  Future<void> deleteEvaluation(String id) async {
    try {
      // Delete from global list
      await _evaluationsCollection.doc(id).delete();
      
      // Also remove from favorites if it exists there
      final favs = _getFavoritesCollection();
      if (favs != null) {
        await favs.doc(id).delete();
      }
      print("Deleted successfully from all collections");
    } on FirebaseException catch (e) {
      print("Delete failed: ${e.message}");
      rethrow;
    }
  }

  // ------------------------------------------------------------------
  // 3. STREAMS FOR REAL-TIME UI
  // ------------------------------------------------------------------

  // Main list stream
  Stream<List<Evaluation>> getEvaluationsStream() {
    return _evaluationsCollection
        .orderBy('date', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Evaluation.fromFirestore(doc);
      }).toList();
    });
  }

  // Favorites list stream
  Stream<List<Evaluation>> getFavoritesStream() {
    final favs = _getFavoritesCollection();
    if (favs == null) return Stream.value([]);

    return favs.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Evaluation.fromFirestore(doc);
      }).toList();
    });
  }

  // Check if a specific ID is favorited
  Stream<bool> isFavoriteStream(String evaluationId) {
    final favs = _getFavoritesCollection();
    if (favs == null) return Stream.value(false);
    return favs.doc(evaluationId).snapshots().map((doc) => doc.exists);
  }

  // ------------------------------------------------------------------
  // 4. FAVORITES TOGGLE
  // ------------------------------------------------------------------
  Future<void> toggleFavorite(Evaluation evaluation, bool isAdding) async {
    final favs = _getFavoritesCollection();
    if (favs == null) throw Exception("User not authenticated");

    try {
      if (isAdding) {
        // We use the same ID as the original doc for easy tracking
        await favs.doc(evaluation.id).set(evaluation.toMap());
      } else {
        await favs.doc(evaluation.id).delete();
      }
    } catch (e) {
      print("Toggle favorite failed: $e");
      rethrow;
    }
  }
   // ------------------------------------------------------------------
// 5. UPDATE OPERATION (Traditional Edit/Update)
// ------------------------------------------------------------------
Future<void> updateEvaluation(Evaluation evaluation) async {
  if (evaluation.id == null) return; // Cannot update without an ID

  try {
    // .doc(id) locates the record; .update() modifies the fields
    await _evaluationsCollection.doc(evaluation.id).update(evaluation.toMap());
    print("SUCCESS: Evaluation updated in Firebase console");
  } on FirebaseException catch (e) {
    print("Update failed: ${e.message}");
    rethrow;
  }
}



}