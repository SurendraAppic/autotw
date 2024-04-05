import 'package:autowheelapp/models/jobcardtotaldeta.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class aaaa extends StatefulWidget {
  @override
  _aaaaState createState() => _aaaaState();
}

class _aaaaState extends State<aaaa> {
  List jobCards = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final url =
        'http://lms.muepetro.com/api/UserController1/GetJobCardALLocationwise?locationid=2';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List jsonData = jsonDecode(response.body);
      print(jsonData.length);
      // final List<ModeljobcardAlldeta> fetchedCards = jsonData.map((e) {
      //   return ModeljobcardAlldeta.fromJson(e);
      // }).toList();

      setState(() {
        jobCards = jsonData;
      });
      print(response.body);
    } else {
      print('Failed to load data: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your App'),
      ),
      body: Column(
        children: [
          Text(
            'Number of items: ${jobCards.length}',
          ),
        ],
      ),
    );
  }
}
