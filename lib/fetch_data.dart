import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FetchData with ChangeNotifier{

  static final url = 'https://sigmatenant.com/mobile/tags';
  List<dynamic> dataList;

  getInformation() async{

    http.Response response = await http.get(url);
    String data = response.body.toString();
    var dataDecode = jsonDecode(data);
    print(dataDecode['tags']);
    dataList = dataDecode['tags'];
    notifyListeners();
    return dataDecode['tags'];
  }
}