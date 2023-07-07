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
          Text('Categorias'),
          Expanded(
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      child: GestureDetector(
                        onTap: () {
                          // Lógica a ser executada quando o Card for tocado
                            Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BurgerListPage(),
                        ),
                      );
                        },
                        child: Card(
                          child: Column(
                            children: [
                              Image.asset(
                                'images/burguer4.png',
                                width: 200.0,
                                height: 220.0,
                              ),
                              Text('Hamburguer'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      child: GestureDetector(
                        onTap: () {
                          // Lógica a ser executada quando o Card for tocado
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HotDogListPage(),
                            ),
                          );
                        },
                        child: Card(
                          child: Column(
                            children: [
                              Image.asset(
                                'images/burguer4.png',
                                width: 200.0,
                                height: 220.0,
                              ),
                              Text('Hot Dog'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
