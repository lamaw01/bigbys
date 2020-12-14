import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

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

  Future<List<Map<String, dynamic>>> fetch() async {
    http.Response response = await http
        .get('https://bigbys.e2econsultancy.ph/api/apitest/getitems.php');
    if (response.statusCode != 200) return null;
    return List<Map<String, dynamic>>.from(
      json.decode(response.body)['data'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
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
                  constraints: BoxConstraints.expand(),
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
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                final item = snapshot.data[index];
                return ListTile(
                  title: Text(item['menuid']),
                  subtitle: Text(item['menuname']),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
