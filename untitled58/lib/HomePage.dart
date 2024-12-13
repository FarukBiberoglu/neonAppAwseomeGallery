import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled58/ProivderModel.dart';
import 'FavoritePage.dart';

class Homepage extends StatelessWidget {
  final List<String> images = [

    'images1.jpg',
    'images2.jpg',
    'images3.jpg',
    'iamges4.jpg',
    'images5.jpg',
    'images6.jpg',

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Awesome Gallery',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.purple),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.red),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Favoritepage()),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          mainAxisExtent: 200,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return CustomWidget(imagePath: images[index]);
        },
      ),
    );
  }
}

class CustomWidget extends StatelessWidget {
  final String imagePath;

  const CustomWidget({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteModel>(context);
    final isFavorite = provider.favoriteImages.contains(imagePath);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/$imagePath',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: IconButton(
              onPressed: () {
                if (isFavorite) {
                  provider.removeImages(imagePath);
                } else {
                  provider.addFavorite(imagePath);
                }
              },
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                size: 30,
                color: isFavorite ? Colors.purple : Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
