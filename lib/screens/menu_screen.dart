import 'package:bigbys/colors.dart';
import 'package:bigbys/controller/countController.dart';
import 'package:bigbys/screens/basket_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  Future<List<Map<String, dynamic>>> _future;

  @override
  void initState() {
    super.initState();
    _future = fetch();
  }

  showMyDialogIncrement(menuItemParam) async {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Purchase',
            style: TextStyle(
              color: titleColor,
              fontFamily: 'Poppins',
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Add ' + menuItemParam + ' to basket',
                  style: TextStyle(
                    color: titleColor,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Yes.',
                style: TextStyle(
                  fontFamily: 'Poppins',
                ),
              ),
              onPressed: () {
                Get.find<CountController>().increment();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'Cancel.',
                style: TextStyle(
                  fontFamily: 'Poppins',
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  showMyDialogDecrement(menuItemParam) async {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Remove',
            style: TextStyle(
              color: titleColor,
              fontFamily: 'Poppins',
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Remove ' + menuItemParam + ' from basket?',
                  style: TextStyle(
                    color: titleColor,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Yes.',
                style: TextStyle(
                  fontFamily: 'Poppins',
                ),
              ),
              onPressed: () {
                Get.find<CountController>().decrement();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'Cancel.',
                style: TextStyle(
                  fontFamily: 'Poppins',
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<List<Map<String, dynamic>>> fetch() async {
    try {
      http.Response response = await http
          .get('https://bigbys.e2econsultancy.ph/api/apitest/getitems.php');
      if (response.statusCode != 200) return null;
      // try {
      //   Map<String, dynamic> map = json.decode(response.body);
      //   List<dynamic> data = map["data"];
      //   for (int i = 0; i < data.length; i++) {
      //     print(data[i]['menuname']);
      //   }
      //   data.forEach((element) {
      //     Map obj = element;
      //     String menuname = obj['menuname'];
      //     print(menuname);
      //   });
      //   print(data[0]["menuname"]);
      //   map.forEach((list, menu) {
      //     print(menu);
      //   });
      //   print(map['data'][0]['menuname']);
      // } catch (e) {
      //   print(e.toString());
      // }
      return List<Map<String, dynamic>>.from(
        json.decode(response.body)['data'],
      );
    } catch (e) {
      return null;
    }
  }

  var imageUrl = 'https://bigbys.e2econsultancy.ph/api/apitest/menu/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: titleColor, //change your color here
        ),
        backgroundColor: canvasColor,
        title: Text(
          'Menu List',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: titleColor,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _future = fetch();
          setState(() {});
          return _future;
        },
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Container(
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Text(snapshot.error.toString()),
                  ),
                ),
              );
            }
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container(
              color: canvasColor,
              child: ListView.builder(
                padding: EdgeInsets.all(8.0),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = snapshot.data[index];
                  return Card(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
                      child: Theme(
                        data: ThemeData(
                          splashColor: buttonColor,
                        ),
                        child: ListTile(
                          leading: ConstrainedBox(
                            constraints: BoxConstraints(
                              minWidth: 70,
                              minHeight: 70,
                              maxWidth: 70,
                              maxHeight: 70,
                            ),
                            child: Image.network(
                              imageUrl + item['menuimg'],
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(
                            item['menuname'],
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                            // style:
                            //     TextStyle(decoration: TextDecoration.lineThrough),
                          ),
                          subtitle: Text(
                            item['menudescription'],
                            style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          trailing: Text(
                            item['menuprice'],
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          onTap: () {
                            showMyDialogIncrement(item['menuname']);
                          },
                          onLongPress: () {
                            showMyDialogDecrement(item['menuname']);
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Basket(),
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.shopping_basket),
              GetBuilder<CountController>(
                init: CountController(),
                builder: (_) {
                  return Text(
                    "${_.count}",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  );
                },
              ),
            ],
          ),
          backgroundColor: Colors.red),
    );
  }
}
