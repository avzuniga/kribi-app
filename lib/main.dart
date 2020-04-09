import 'dart:convert';
import 'login.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KRIBI',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: LoginPage(),
      routes: {
        '/home': (context) => MyHomePage(),
        '/login': (context) => LoginPage(),
      },
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  Future<void>
  getinfo(String letra) async {
    final response = await http.get(
    'https://dicapi.kribi.com.co/buscar/lista_palabras?letra='+letra,
    headers: {'x-authorization-server':'Basic 5cf2e66408166968da3b30b4', },
  );
  final responseJson =response.body;
  print(response.body);
  return responseJson;
  }
  _versignificado(String palabra) async {
      return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text(palabra),
              backgroundColor: Colors.brown,
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text("significado")
                  ],
                ),
              ),
             );
        });
  }
  
  _buildExpandableContent(String info) {
    List<Widget> columnContent = [];
    List<String> palabras = getinfo(info).toString().split(",");
    for (String content in palabras)
      columnContent.add(
        new ListTile(
            title: new Text(
              content,
              style: new TextStyle(fontSize: 18.0, color: Colors.black),
            ),
            onTap: () {
              _versignificado(content);
            }),
      );

    return columnContent;
  }
  List palabras;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Diccionario Kribí"),
      ),
      drawer: new Drawer(
        child: ListView(
          padding: EdgeInsets.all(0.0),
          children: <Widget>[
            new Container(
              child: new DrawerHeader(
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                        left: 16.0,
                        child: Align(
                            alignment: Alignment.center,
                            //child: new CircleAvatar(
                               // backgroundColor: Colors.white,
                                //radius: 50,
                                //)
                              child: new Image.asset('assets/logo.png'),
                            )
                         ),
                        //new Text("Nombre usuario")
                  ])
      
                  ),
            color: Colors.brown[100],
            ),
            new ListTile(
              title: new Text("Diccionario",style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
            ),
            new ListTile(
              title: new Text("Actividades",style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
            ),
            new ListTile(
              title: new Text("Blog",style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
            ),
            new ListTile(
              title: new Text("Tienda",style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
            ),
            new Container(padding: EdgeInsets.all(130.0)),
            new ListTile(
              title: new Text("Cerrar Sesión",style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
              onTap: () {
                Navigator.pushReplacementNamed(context, "/login");
              },
            ),
          ],
        ),
      ),
      body: new ListView.builder(
        itemCount: letras.length,
        itemBuilder: (BuildContext context, int i) {
          return Container(
            color: Colors.brown[100],
            child: new ExpansionTile(
            title: new Text(letras[i].letra, style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
            children: <Widget>[
              _buildExpandableContent(letras[i].letra)
            ],
            )
            );
            },
      )
        
      );
  }
  }

class Letra {
  Letra(this.letra);
  final String letra;

}

class Palabra {
  Palabra(this.palabra, this.significado);
  final String significado;
  final String palabra;
}
Future <String>getinfo(String letra) async {
    final response = await http.get(
    'https://dicapi.kribi.com.co/buscar/lista_palabras?letra='+letra,
    headers: {'x-authorization-server':'Basic 5cf2e66408166968da3b30b4', },
  );
  final responseJson =json.decode(response.body)['response'];
  return responseJson;
  }

List<Letra> letras = [
  new Letra(
    'A',
    
  ),
  new Letra(
    'B',

  ),
  new Letra(
    'CH',
  ),
  new Letra(
    'D',

  ),
  new Letra(
    'E',
  ),
  new Letra(
    'F',

  ),
  new Letra(
    'G',

  ),
  new Letra(
    'I',

  ),
  new Letra(
    'J',

  ),
  new Letra(
    'K',

  ),
  new Letra(
    'L',

  ),
  new Letra(
    'M',

  ),
  new Letra(
    'N',

  ),
  new Letra(
    'Ñ',

  ),
  new Letra(
    'O',

  ),
  new Letra(
    'P',

  ),
  new Letra(
    'R',

  ),
  new Letra(
    'S',

  ),
  new Letra(
    'T',
  ),
  new Letra(
    'U',

  ),

];