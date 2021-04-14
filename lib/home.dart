import 'package:flutter/material.dart';
import 'package:phone_auth_project/login.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _controller = TextEditingController();
  String val;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false);
            },
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 60),
            child: Center(
              child: Text(
                'Search Society',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 40, right: 10, left: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Society Name',
                prefix: Padding(
                  padding: EdgeInsets.all(4),
                ),
              ),
              maxLength: 20,
              controller: _controller,
              onChanged: (val) {
                val = _controller.text.toString();
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                newscreen(val);
              },
              child: Text(
                'Search',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}

Future<String> newscreen(val) async {
  String url =
      'https://llokality-intech-xald7lspga-el.a.run.app/api/v1.0/society/';
  var response = await get(Uri.encodeFull(url + val),
      headers: {"Accept": "application/json"});
  return (response.body);
}
