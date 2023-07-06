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
      description: 'Pão, queijo, carne bovina, alface, tomate, cebola roxa, maionese e ketchup ',
    ),
    // Add more burgers here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Hambúrgueres'),
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
