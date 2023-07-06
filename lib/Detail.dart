import 'package:flutter/material.dart';

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

class Detail extends StatelessWidget {
  final Burger burger;

  Detail({required this.burger});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(burger.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 16.0),
            Container(
              width: 200.0,
              height: 200.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(burger.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              burger.name,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'R\$ ${burger.price.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              burger.description,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Lógica para adicionar a quantidade de produtos
              },
              child: Text('Adicionar Quantidade'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Lógica para finalizar a compra
              },
              child: Text('Finalizar Compra'),
            ),
          ],
        ),
      ),
    );
  }
}