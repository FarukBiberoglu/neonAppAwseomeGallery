import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled58/ProivderModel.dart';

class Favoritepage extends StatelessWidget {
  const Favoritepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FAVORITE PAGE',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.purple),
        ),
        centerTitle: true,
      ),
      body: Consumer<FavoriteModel>(
        builder: (context, providers, child) {
          if (providers.favoriteImages.isEmpty) {
            return const Center(
              child: Text(
                "No Favorites Yet!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            );
          }

          return GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: providers.favoriteImages.length,
            itemBuilder: (context, index) {
              return FavoriteItem(imagePath: providers.favoriteImages[index]);
            },
          );
        },
      ),
    );
  }
}

class FavoriteItem extends StatelessWidget {
  final String imagePath;

  const FavoriteItem({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        'assets/$imagePath',
        fit: BoxFit.cover,
      ),
    );
  }
}
