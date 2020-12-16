// import 'dart:convert';

// import 'package:bigbys/screens/menu.dart';
import 'dart:convert';

import 'package:bigbys/colors.dart';
import 'package:bigbys/screens/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future login() async {
    var url = "https://bigbys.e2econsultancy.ph/api/apitest/login.php";
    http.Response response = await http.post(url, body: {
      "username": user.text,
      "password": pass.text,
    });
    // try {
    //   Map<String, dynamic> map = json.decode(response.body);
    //   print(map['status']);
    //   print(map["message"]);
    // } catch (e) {
    //   print(e.toString());
    // }

    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      Toast.show(
        'Status ' + map['status'] + ' Message ' + map['message'],
        context,
        gravity: Toast.BOTTOM,
        duration: 4,
      );
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => Menu(),
      //   ),
      // );
    } else {
      print("login error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 600,
        child: Card(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Text(
                  "BigBy's",
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Poppins',
                    // fontFamily: 'Poppins',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  controller: user,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  controller: pass,
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: MaterialButton(
                          height: 50,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                          color: buttonColor,
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          onPressed: () {
                            if (user.text.isEmpty || pass.text.isEmpty) {
                              Toast.show(
                                "All field is required",
                                context,
                                gravity: Toast.BOTTOM,
                                duration: 2,
                              );
                            } else {
                              login();
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Menu(),
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.arrow_forward),
          ],
        ),
        backgroundColor: buttonColor,
      ),
    );
  }
}
