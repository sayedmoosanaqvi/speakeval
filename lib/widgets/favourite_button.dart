import 'package:flutter/material.dart';
import '../models/evaluation_model.dart';
import '../helpers/firestore_service.dart';

class FavoriteButton extends StatelessWidget {
  final Evaluation evaluation; // Pass the whole model instead of just the ID

  const FavoriteButton({super.key, required this.evaluation});

  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();

    return StreamBuilder<bool>(
      // Use the stream we created in FirestoreService to check if this ID exists
      stream: firestoreService.isFavoriteStream(evaluation.id!),
      builder: (context, snapshot) {
        final isFavorite = snapshot.data ?? false;

        return IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : Colors.grey,
          ),
          onPressed: () async {
            try {
              // Toggle logic: If currently favorite, we remove it (false). If not, we add it (true).
              await firestoreService.toggleFavorite(evaluation, !isFavorite);
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Auth required to favorite items")),
              );
            }
          },
        );
      },
    );
  }
}