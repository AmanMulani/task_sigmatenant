import 'package:flutter/material.dart';

class InfoDisplayWidget extends StatelessWidget {

  final String title;
  final String displayName;
  final String meta;
  final String description;
  final double height;

  InfoDisplayWidget({
    @required this.title,
    @required this.description,
    @required this.displayName,
    @required this.meta,
    @required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    elevation: 3.0,
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        displayName.toString().toUpperCase(),
                        style: TextStyle(
                          color: Color(0xFFA35071),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    meta,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Text(
                  description,
                  style: TextStyle(

                  ),
                ),
                Text(
                  'Spaces',
                  style: TextStyle(
                    color: Color(0xFFA35071),
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
