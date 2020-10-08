import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/fetch_data.dart';

import 'info_display_widget.dart';

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {

  FetchData _fetchData = FetchData();
  double height;
  var _apiDataProvider;
  bool flag = false;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if(flag == false) {
      _apiDataProvider = Provider.of<FetchData>(context);
      _apiDataProvider.getInformation();
      flag = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: OrientationBuilder(
          builder: (context, orientation) {
            if(orientation == Orientation.portrait) {
              height = MediaQuery.of(context).size.height * 0.3;
            }
            else {
              height = MediaQuery.of(context).size.width * 0.3;
            }
            if(_apiDataProvider.dataList == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final List<InfoDisplayWidget> _infoDisplayWidgetList = [];

            for(var data in _apiDataProvider.dataList) {
              _infoDisplayWidgetList.add(
                InfoDisplayWidget(
                  height: height,
                  title: data['title'],
                  meta: data['meta'] == null ? "" : data['meta'],
                  description: data['description'],
                  displayName: data['displayName'],
                ),
              );
            }
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: ListView.builder(
                itemBuilder: (context,index) => _infoDisplayWidgetList[index],
                itemCount: _infoDisplayWidgetList.length,
              ),
            );
          },
        ),
    );
  }
}
