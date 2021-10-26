

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_navigator_demo/page/muti_navigator.dart';
import 'package:flutter_app_navigator_demo/page/route_show_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              child: Container(
                width: 200,
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.amber, borderRadius: BorderRadius.circular(50)),
                child: Text("各种Route效果"),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return RouteShowPage();
                }));
              },
            ),
            SizedBox(height: 5,),
            GestureDetector(
              child: Container(
                width: 200,
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(50)),
                child: Text("MutiNavigator"),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return MutiNavigator();
                }));
              },
            )
          ],
        ),
      ),
    );
  }
}