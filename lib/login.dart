import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[200],
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                //Container(padding: EdgeInsets.fromLTRB(100, 20, 100, 80)),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(0),
                    child: Image.asset('assets/logo.png'),/*Text(
                      'Kribi',
                      style: TextStyle(
                          color: Colors.indigo[900],
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )*/),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Usuario',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Contraseña',
                    ),
                  ),
                ),
                Container(padding: EdgeInsets.fromLTRB(100, 20, 100, 20)),
                /*Container(
                  padding: EdgeInsets.fromLTRB(85, 10, 85, 10),
                  child: FlatButton(
                    onPressed: () {
                      //forgot password screen
                    },
                    textColor: Colors.indigo,
                    child: Wrap(children: <Widget>[
                      Text(
                        '¿Olvido la contraseña?',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ]),
                  ),
                ),*/
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(100, 0, 100, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.brown,
                      child: Text(
                        'Iniciar sesión',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      onPressed: () {
                        print(nameController.text);
                        print(passwordController.text);
                        Navigator.pushReplacementNamed(context, "/home");
                      },
                    )),
              ],
            )));
  }
}
