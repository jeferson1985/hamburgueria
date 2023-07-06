import 'package:flutter/material.dart';
import 'BurgerListPage.dart';
import 'HotDogListPage.dart';

class HomePage extends StatelessWidget {
  final String enteredName;

  HomePage({required this.enteredName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.orange,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Pesquisar...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                IconButton(
                  icon: Icon(Icons.search),
                  color: Colors.white,
                  onPressed: () {
                    // Implementar ação de pesquisa
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 200.0, // Defina a altura desejada para o card
                  child: Image.asset(
                    'images/promocao.png',
                    fit: BoxFit.cover,
                  ),
                ),
                ListTile(
                  title: Text('Promoção'),
                  subtitle: Text('Todos Hamburguers com 50% de desconto'),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                ListTile(
                  title: Text('Categorias'),
                ),
                ListTile(
                  leading: Image.asset(
                      'images/hamburguer9.png',
                      width: 56.0,
                      height: 56.0,
                    ),
                  title: Text('Hamburguer'),
                  onTap: () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BurgerListPage(),
                      ),
                    );
                    // Implementar ação de clicar na categoria 1
                  },
                ),
                ListTile(
                  leading: Image.asset(
                      'images/cachorro.png',
                      width: 56.0,
                      height: 56.0,
                    ),
                  title: Text('Cachorro quente'),
                  onTap: () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HotDogListPage(),
                      ),
                    );
                    // Implementar ação de clicar na categoria 2
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}