import 'package:flutter/material.dart';
import 'DetailHotDog.dart';

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


class HotDogListPage extends StatefulWidget {
  @override
  _HotDogListPageState createState() => _HotDogListPageState();
}

class _HotDogListPageState extends State<HotDogListPage> {
  List<HotDog> hotDogs = [
    HotDog(
      name: 'Classic Hot Dog',
      imageUrl: '/images/cao1.png',
      price: 21.00,
      description: 'Pão, salsicha, molho, tomate, milho, ervilha, cebola, ketchup e maionese',
    ),
    HotDog(
      name: 'Especial Hot Dog',
      imageUrl: '/images/cao2.png',
      price: 30.00,
      description: 'Pão, salsicha, molho, tomate, milho, ervilha, cebola, ketchup e maionese',
    ),
    HotDog(
      name: 'Da Casa Hot Dog',
      imageUrl: '/images/cao3.png',
      price: 45.00,
      description: 'Pão, salsicha, molho, tomate, milho, ervilha, cebola, ketchup e maionese',
    ),
    HotDog(
      name: 'Inverno Hot Dog',
      imageUrl: '/images/cao4.png',
      price: 28.00,
      description: 'Pão, salsicha, molho, tomate, milho, ervilha, cebola, ketchup e maionese',
    ),
    HotDog(
      name: 'Hot Dog do Piru',
      imageUrl: '/images/cao5.png',
      price: 32.00,
      description: 'Pão, salsicha, molho, tomate, milho, ervilha, cebola, ketchup e maionese',
    ),
    HotDog(
      name: 'Hot Dog Caramelo',
      imageUrl: '/images/cao6.png',
      price: 25.00,
      description: 'Pão, salsicha, molho, tomate, milho, ervilha, cebola, ketchup e maionese',
    ),
  ];

  List<String> favoriteItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de cachorro quente'),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: hotDogs.length,
          itemBuilder: (context, index) {
            final hotDogIndex = index % hotDogs.length;
            final hotDog = hotDogs[hotDogIndex];

            return ListTile(
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    child: ClipOval(
                      child: Image.asset(
                        hotDog.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(hotDog.name),
                        SizedBox(height: 8.0),
                        Text('R\$ ${hotDog.price.toStringAsFixed(2)}'),
                        SizedBox(height: 8.0),
                        Text(hotDog.description),
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
                          builder: (context) => DetailHotDog(
                            productName: hotDog.name,
                            price: hotDog.price,
                            description: hotDog.description,
                            imageUrl: hotDog.imageUrl,
                          ),
                        ),
                      );
                    },
                    child: Text('Comprar'),
                  ),
                  IconButton(
                    onPressed: () {
                      // Lógica para adicionar o produto aos favoritos
                      setState(() {
                        if (favoriteItems.contains(hotDog.name)) {
                          favoriteItems.remove(hotDog.name);
                        } else {
                          favoriteItems.add(hotDog.name);
                        }
                      });
                      print(favoriteItems);
                    },
                    icon: Icon(
                      favoriteItems.contains(hotDog.name)
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