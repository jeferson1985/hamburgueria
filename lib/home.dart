import 'package:flutter/material.dart';
import 'BurgerListPage.dart';
import 'HotDogListPage.dart';
import 'FavoritePage .dart';

class HomePage extends StatefulWidget {
  final String enteredName;

  HomePage({required this.enteredName});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchText = '';
  final TextEditingController _searchController = TextEditingController();

  void onSearch(String searchText) {
    if (searchText.toLowerCase() == 'hamburguer') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BurgerListPage(),
        ),
      );
    } else if (searchText.toLowerCase() == 'hot dog') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HotDogListPage(),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Nenhum item encontrado'),
            content: Text('Nenhum item corresponde à sua pesquisa.'),
            actions: [
              TextButton(
                child: Text('Fechar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

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
                    controller: _searchController,
                    onChanged: (value) {
                      setState(() {
                        searchText = value;
                      });
                    },
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
                    onSearch(searchText);
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
                  height: 200.0,
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
                                'images/bug8.png',
                                width: 200.0,
                                height: 250,
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
                                'images/cao5.png',
                                width: 200.0,
                                height: 250,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => FavoritePage(favoriteItems: favoriteItems),
          //   ),
          // );
        },
        child: Icon(Icons.favorite),
      ),
    );
  }
}
