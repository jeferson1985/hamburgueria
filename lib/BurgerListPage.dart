import 'package:flutter/material.dart';
import 'Detail.dart';

class Burger {
  final String name;
  final String imageUrl;
  final double price;
  final String description;

  Burger({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.description,
  });
}

class BurgerListPage extends StatelessWidget {
  final List<Burger> burgers = [
    Burger(
      name: 'Classic Burger',
      imageUrl: '/images/hamburguer9.png',
      price: 40.00,
      description:
          'Pão, queijo, carne bovina, alface, tomate, cebola roxa, maionese e ketchup ',
    ),
    // Add more burgers here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Hambúrguer'),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: burgers.length * 6,
          itemBuilder: (context, index) {
            final burgerIndex = index % burgers.length;
            final burger = burgers[burgerIndex];

            return ListTile(
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    child: ClipOval(
                      child: Image.asset(
                        burger.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(burger.name),
                        SizedBox(height: 8.0),
                        Text('R\$ ${burger.price.toStringAsFixed(2)}'),
                        SizedBox(height: 8.0),
                        Text(burger.description),
                      ],
                    ),
                  ),
                  SizedBox(width: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      // Lógica para adicionar o produto ao carrinho
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Detail(
                            productName: burger.name,
                            price: burger.price,
                            description: burger.description,
                          ),
                        ),
                      );
                    },
                    child: Text('Comprar'),
                  ),
                  IconButton(
                    onPressed: () {
                      // Lógica para adicionar o produto aos favoritos
                    },
                    icon: Icon(Icons.favorite_border),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'Detail.dart';
// import 'package:meta/meta.dart';


// class Burger {
//   final String name;
//   final String imageUrl;
//   final double price;
//   final String description;

//   Burger({
//     required this.name,
//     required this.imageUrl,
//     required this.price,
//     required this.description,
//   });
// }

// class BurgerListPage extends StatelessWidget {
//   final Future<List<Burger>> burgersFuture;

//   BurgerListPage({required this.burgersFuture});

//   factory BurgerListPage.fromJSON(BuildContext context) {
//     final burgersFuture = DefaultAssetBundle.of(context)
//         .loadString('assets/burgers.json')
//         .then((jsonData) {
//       final jsonList = json.decode(jsonData) as List<dynamic>;

//       final burgers = jsonList.map((json) {
//         return Burger(
//           name: json['name'],
//           imageUrl: json['imageUrl'],
//           price: json['price'].toDouble(),
//           description: json['description'],
//         );
//       }).toList();

//       return burgers;
//     });

//     return BurgerListPage(burgersFuture: burgersFuture);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Burger>>(
//       future: burgersFuture,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           if (snapshot.hasData) {
//             final burgers = snapshot.data!;
//             return Scaffold(
//               appBar: AppBar(
//                 title: Text('Lista de Hambúrguer'),
//               ),
//               body: SingleChildScrollView(
//                 child: ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: burgers.length,
//                   itemBuilder: (context, index) {
//                     final burger = burgers[index];

//                     return ListTile(
//                       title: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Container(
//                             width: 100.0,
//                             height: 100.0,
//                             child: ClipOval(
//                               child: Image.asset(
//                                 burger.imageUrl,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                           SizedBox(width: 16.0),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(burger.name),
//                                 SizedBox(height: 8.0),
//                                 Text('R\$ ${burger.price.toStringAsFixed(2)}'),
//                                 SizedBox(height: 8.0),
//                                 Text(burger.description),
//                               ],
//                             ),
//                           ),
//                           SizedBox(width: 16.0),
//                           ElevatedButton(
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => Detail(
//                                     productName: burger.name,
//                                     price: burger.price,
//                                     description: burger.description,
//                                   ),
//                                 ),
//                               );
//                             },
//                             child: Text('Comprar'),
//                           ),
//                           IconButton(
//                             onPressed: () {
//                               // Lógica para adicionar o produto aos favoritos
//                             },
//                             icon: Icon(Icons.favorite_border),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             );
//           } else {
//             return Center(
//               child: Text('Erro ao carregar os dados dos hambúrgueres'),
//             );
//           }
//         } else {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//       },
//     );
//   }
// }