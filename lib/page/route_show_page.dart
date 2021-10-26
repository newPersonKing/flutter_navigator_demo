

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteShowPage extends StatelessWidget {
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
                child: Text("DialogRoute"),
              ),
              onTap: () {
                   Navigator.of(context).push(DialogRoute(context: context,builder: (context){
                     return _createContent("DialogRoute");
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
                child: Text("ios 样式 CupertinoDialogRoute"),
              ),
              onTap: () {
                Navigator.of(context).push(CupertinoDialogRoute(context: context,builder: (context){
                  return _createContent("CupertinoDialogRoute");
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
                child: Text("CupertinoModalPopupRoute 从底部弹出"),
              ),
              onTap: () {
                Navigator.of(context).push(CupertinoModalPopupRoute(builder: (context){
                  return _createContent("CupertinoModalPopupRoute");
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
                child: Text("ios 推入页面"),
              ),
              onTap: () {
                Navigator.of(context).push(CupertinoPageRoute(builder: (context){
                  return _createPage("CupertinoPageRoute");
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
                child: Text("android 推入页面"),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return _createPage("MaterialPageRoute");
                }));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _createContent(String title){
    return Center(
      child: DefaultTextStyle(
        style: TextStyle(decoration: TextDecoration.none),
        child: Container(
          width: 200,
          height: 200,
          color: Colors.green,
          alignment: Alignment.center,
          child: Text(title,style: TextStyle(fontSize: 18),),
        ),
      ),
    );
  }

  Widget _createPage(String title){
    return Scaffold(
      body: Center(
        child: DefaultTextStyle(
          style: TextStyle(decoration: TextDecoration.none),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.green,
            alignment: Alignment.center,
            child: Text(title,style: TextStyle(fontSize: 18),),
          ),
        ),
      ),
    );
  }

}