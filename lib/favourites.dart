import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the current user's ID from Firebase Auth
    final String? userId = FirebaseAuth.instance.currentUser?.uid;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Evaluations"),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: userId == null
          ? const Center(child: Text("Please login to see favorites"))
          : StreamBuilder<QuerySnapshot>(
              // Listen to the 'favorites' subcollection for this specific user
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(userId)
                  .collection('favorites')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text("No favorites yet"));
                }

                final favoriteDocs = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: favoriteDocs.length,
                  itemBuilder: (context, index) {
                    final eval = favoriteDocs[index].data() as Map<String, dynamic>;
                    
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      child: ListTile(
                        leading: const Icon(Icons.star, color: Colors.amber),
                        title: Text(eval['title'] ?? "Untitled"),
                        subtitle: Text(
                            "${eval['type'] ?? 'N/A'} • ${eval['date'] ?? 'No Date'}"),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete_outline, color: Colors.red),
                          onPressed: () {
                            // Logic to remove from Firestore
                            favoriteDocs[index].reference.delete();
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}