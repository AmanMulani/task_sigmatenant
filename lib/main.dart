import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/fetch_data.dart';
import 'package:task/screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<FetchData>(
        create: (context){
          return FetchData();
        },
        builder: (context, fetchData) {
          return Screen();
        },
      ),
    );
  }
}



