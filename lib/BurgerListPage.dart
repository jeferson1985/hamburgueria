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

class BurgerListPage extends StatefulWidget {
  @override
  _BurgerListPageState createState() => _BurgerListPageState();
}

class _BurgerListPageState extends State<BurgerListPage> {
  List<Burger> burgers = [
    Burger(
      name: 'Classic Burger',
      imageUrl: '/images/hamburguer9.png',
      price: 40.00,
      description:
          'Pão, queijo, carne bovina, alface, tomate, cebola roxa, maionese e ketchup ',
    ),
    Burger(
      name: 'Fish Burger',
      imageUrl: '/images/bug1.png',
      price: 35.00,
      description:
          'Pão, queijo, peixe, alface, tomate, cebola roxa, maionese e ketchup ',
    ),
    Burger(
      name: 'Mushroom Burger',
      imageUrl: '/images/bug2.png',
      price: 45.00,
      description:
          'Pão, queijo, Mushroom, alface, tomate, cebola roxa, maionese e ketchup ',
    ),
    Burger(
      name: 'Bacon Burger',
      imageUrl: '/images/bug3.png',
      price: 37.00,
      description:
          'Pão, queijo, carne bovina, bacon, alface, tomate, cebola roxa, maionese e ketchup ',
    ),
    Burger(
      name: 'Spicy Burger',
      imageUrl: '/images/bug4.png',
      price: 45.00,
      description:
          'Pão, queijo, frango, alface, tomate, cebola roxa, maionese e ketchup ',
    ),
    Burger(
      name: 'Chicken Burger',
      imageUrl: '/images/bug5.png',
      price: 45.00,
      description:
          'Pão, queijo, frango, alface, tomate, cebola roxa, maionese e ketchup, batata palha ',
    ),
    Burger(
      name: 'Veggie Burger',
      imageUrl: '/images/bug6.png',
      price: 45.00,
      description:
          'Pão, queijo, proteina de soja, tomate, cebola roxa, maionese e ketchup ',
    ),
    // Add more burgers here
  ];

  List<String> favoriteItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Hambúrguer'),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: burgers.length,
          itemBuilder: (context, index) {
            final burger = burgers[index];

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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Detail(
                            productName: burger.name,
                            price: burger.price,
                            description: burger.description,
                            imageUrl: burger.imageUrl,
                          ),
                        ),
                      );
                    },
                    child: Text('Comprar'),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (favoriteItems.contains(burger)) {
                          favoriteItems.remove(burger);
                        } else {
                          favoriteItems.add(burger.name);
                        }
                      });
                      print(favoriteItems);
                    },
                    icon: Icon(
                      favoriteItems.contains(burger.name)
                          ? Icons.favorite
                          : Icons.favorite_border,
                    ),
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