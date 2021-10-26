import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MutiNavigator extends StatelessWidget {

  final List<MyPage> _pages = <MyPage>[
    MyPage(
        index: 0,
        name: 'MainPage', widget: const TestPage('TestPage'), key: UniqueKey()),
    MyPage(
        index: 1,
        name: 'MainPage', widget: const TestPage('TestPage'), key: UniqueKey())
  ];

  final List<MyPage> _pagesA = <MyPage>[
    MyPage(
        index: 0,
        name: 'MainPage', widget: const TestPage('TestPage'), key: UniqueKey()),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Container(
            color: Colors.yellow,
            child: Navigator(
              pages: _pages.toList(),
              onPopPage: (router,result){
                // 这个回调只有 回退 pages 中的页面的时候 才会回调
                var settting = router.settings as MyPage;
                var index = settting.index;
                // router.didPop(result) 可以直接退出 pages 中配置的page
                // 当index = 0 代表只剩最后一个page
                return index == 0 ? false : router.didPop(result);
              },
            ),
          ),
        ),
        Flexible(
          child: Container(
            color: Colors.blue,
            child: Navigator(
              pages: _pagesA.toList(),
              onPopPage: (router,result){
                // 这个回调只有 回退 pages 中的页面的时候 才会回调
                var settting = router.settings as MyPage;
                var index = settting.index;
                // router.didPop(result) 可以直接退出 pages 中配置的page
                // 当index = 0 代表只剩最后一个page
                return index == 0 ? false : router.didPop(result);
              },
            ),
          ),
        ),
      ],
    );
  }
}

class TestPage extends StatelessWidget {
  const TestPage(this.title);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: Container(
                width: 200,
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(50)),
                child: Text("push"),
              ),
              onTap: () {
                // push 可以推进页面
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return TestPage("TestPage1");
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
                child: Text("pop"),
              ),
              onTap: () {
                // pop 值可以pop 返回 自己推入的页面
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}

class MyPage extends Page<void> {
  const MyPage({
    this.index = 0,
    required LocalKey key,
    required String name,
    required this.widget,
    Object? arguments,
  }) : super(
    key: key,
    name: name,
    arguments: arguments,
  );

  final Widget widget;
  final int index;

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute<void>(
      settings: this, // 这个setting的类型只能是page
      builder: (BuildContext context) => widget,
    );
  }
}