import 'package:flutter/material.dart';

class HotDog {
  final String name;
  final String imageUrl;
  final double price;
  final String description;

  HotDog({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.description,
  });
}


class HotDogListPage extends StatelessWidget {
  final List<HotDog> burgers = [
     HotDog(
      name: 'Classic Hot Dog',
      imageUrl: '/images/cachorro.png',
      price: 25.00,
      description: 'Pão, salsicha, molho, tomate, milho, ervilha, cebola, ketchup e maionese',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de cachorro quente'),
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