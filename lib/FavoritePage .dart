import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  final List<String> favoriteItems;

  FavoritePage({required this.favoriteItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Favoritos'),
      ),
      body: ListView.builder(
        itemCount: favoriteItems.length,
        itemBuilder: (context, index) {
          final itemName = favoriteItems[index];

          return ListTile(
            title: Text(itemName),
            // Adicione outros detalhes do item favorito, se necessário
          );
        },
      ),
    );
  }
}