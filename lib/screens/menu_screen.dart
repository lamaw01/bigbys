import 'package:bigbys/controller/countController.dart';
import 'package:bigbys/screens/basket_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<Map<String, dynamic>>> _future;

  @override
  void initState() {
    super.initState();
    _future = fetch();
  }

  showMyDialogIncrement() async {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Purchase'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Add this item to basket?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Yes.'),
              onPressed: () {
                Get.find<CountController>().increment();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Cancel.'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  showMyDialogDecrement() async {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Remove'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Remove this item from basket?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Yes.'),
              onPressed: () {
                Get.find<CountController>().decrement();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Cancel.'),
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
    http.Response response = await http
        .get('https://bigbys.e2econsultancy.ph/api/apitest/getitems.php');
    if (response.statusCode != 200) return null;
    return List<Map<String, dynamic>>.from(
      json.decode(response.body)['data'],
    );
  }

  var imageUrl = 'https://bigbys.e2econsultancy.ph/api/apitest/menu/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu List'),
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
            return ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                final item = snapshot.data[index];
                return Card(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: ListTile(
                      // tileColor: Colors.red,
                      // dense: true,
                      isThreeLine: true,
                      leading: Container(
                        height: 80,
                        width: 80,
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Image.network(
                            imageUrl + item['menuimg'],
                          ),
                        ),
                      ),
                      title: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          item['menuname'],
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          // style:
                          //     TextStyle(decoration: TextDecoration.lineThrough),
                        ),
                      ),
                      subtitle: Text(
                        item['menudescription'],
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      trailing: Text(
                        item['menuprice'],
                      ),
                      onTap: () {
                        showMyDialogIncrement();
                      },
                      onLongPress: () {
                        showMyDialogDecrement();
                      },
                    ),
                  ),
                );
              },
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
