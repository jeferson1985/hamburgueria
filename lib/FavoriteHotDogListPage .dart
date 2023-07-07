// import 'package:flutter/material.dart';
// import 'Detail.dart';

// class HotDog {
//   final String name;
//   final String imageUrl;
//   final double price;
//   final String description;
//   bool isFavorite; // Nova propriedade

//   HotDog({
//     required this.name,
//     required this.imageUrl,
//     required this.price,
//     required this.description,
//     this.isFavorite = false, // Valor padrão para false
//   });
// }

// class FavoriteHotDogListPage extends StatefulWidget {
//   @override
//   _FavoriteHotDogListPageState createState() => _FavoriteHotDogListPageState();
// }

// class _FavoriteHotDogListPageState extends State<FavoriteHotDogListPage> {
//   List<HotDog> favoriteBurgers = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Lista de Favoritos'),
//       ),
//       body: ListView.builder(
//         itemCount: favoriteBurgers.length,
//         itemBuilder: (context, index) {
//           final burger = favoriteBurgers[index];

//           return ListTile(
//             title: Text(burger.name),
//             subtitle: Text('R\$ ${burger.price.toStringAsFixed(2)}'),
//             trailing: IconButton(
//               icon: Icon(Icons.favorite),
//               onPressed: () {
//                 setState(() {
//                   favoriteBurgers.removeAt(index);
//                 });
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class FavoriteBurgerListPage extends StatelessWidget {
  final List<String> favoriteItems;

  FavoriteBurgerListPage({required this.favoriteItems});

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