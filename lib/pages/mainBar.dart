import 'package:codegensystem/pages/demo2.dart';
import 'package:codegensystem/pages/demo3.dart';
import 'package:codegensystem/pages/demo4.dart';
import 'package:codegensystem/pages/demo5.dart';
import 'package:codegensystem/utils/bar.dart';
import 'package:codegensystem/utils/smallBar.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MainBar());
}

class MainBar extends StatefulWidget {
  const MainBar({Key? key}) : super(key: key);

  @override
  MainBarState createState() => MainBarState();
}

class MainBarState extends State<MainBar> {
  var _currentIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const Demo3(),
    const Demo2(),
    const Demo4(),
    const Demo5(),
    const Demo5(),
    const Demo5(),
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: const Color.fromRGBO(247, 249, 252, 1),
        body: Row(children: <Widget>[
          if (width > 1000)
            Container(
              width: 250,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomCenter,
                      stops: [
                    0.0,
                    1.0
                  ],
                      colors: [
                    Color.fromRGBO(66, 66, 74, 1.0),
                    Color.fromRGBO(25, 25, 25, 1.0)
                  ])),
              child: ListView(
                // padding: const EdgeInsets.all(8),
                children: <Widget>[
                  Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      child: Column(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              myInfor[0]['photo'],
                              height: 110,
                              width: 110,
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      )),
                  Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: const Text(
                                '?????????',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17.0),
                              )),
                          Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Text(
                                myInfor[0]['name'],
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 17.0),
                              ))
                        ],
                      )),
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () => {Navigator.pushReplacementNamed(context, '/login')},
                            style: ElevatedButton.styleFrom(
                                primary: Colors.lightBlue,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 48.0, vertical: 16.0)),
                            child: const Text(
                              '??????',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Corben',
                                  fontSize: 14.0),
                            ),
                          ),
                        ],
                      )),
                  const Divider(
                    // height: 20,
                    thickness: 0.3,
                    indent: 20,
                    endIndent: 20,
                    color: Color.fromRGBO(245, 245, 245, 1),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 10.0),
                    child: const Text(
                      '?????????',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 250, 250, 1),
                      ),
                    ),
                  ),
                  Bar(
                    currentIndex: _currentIndex,
                    onTap: (i) => setState(() => _currentIndex = i),
                    items: [
                      BarItem(
                        icon: const Icon(Icons.data_thresholding),
                        title: const Text("??????"),
                      ),
                      BarItem(
                        icon: const Icon(Icons.table_view),
                        title: const Text("?????????"),
                      ),
                      BarItem(
                        icon: const Icon(Icons.local_library),
                        title: const Text("?????????"),
                      ),
                      BarItem(
                        icon: const Icon(Icons.public),
                        title: const Text("?????????"),
                      ),
                      BarItem(
                        icon: const Icon(Icons.public),
                        title: const Text("?????????"),
                      ),
                      BarItem(
                        icon: const Icon(Icons.public),
                        title: const Text("?????????"),
                      ),
                    ],
                  ),
                ],
              ),
            ),

          if (width <= 1000)
            Container(
              width: 55,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomCenter,
                      stops: [
                    0.0,
                    1.0
                  ],
                      colors: [
                    Color.fromRGBO(66, 66, 74, 1.0),
                    Color.fromRGBO(25, 25, 25, 1.0)
                  ])),
              child: ListView(
                // padding: const EdgeInsets.all(8),
                children: <Widget>[
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Text(
                                myInfor[0]['name'],
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 17.0),
                              ))
                        ],
                      )),
                  SmallBar(
                    currentIndex: _currentIndex,
                    onTap: (i) => setState(() => _currentIndex = i),
                    items: [
                      SmallBarItem(
                        icon: const Icon(Icons.message),
                      ),
                      SmallBarItem(
                        icon: const Icon(Icons.people),
                      ),
                      SmallBarItem(
                        icon: const Icon(Icons.local_library),
                      ),
                      SmallBarItem(
                        icon: const Icon(Icons.public),
                      ),
                      SmallBarItem(
                        icon: const Icon(Icons.local_library),
                      ),
                      SmallBarItem(
                        icon: const Icon(Icons.public),
                      ),
                    ],
                  ),
                ],
              ),
            ),

          Flexible(
              child: Container(
            child: _widgetOptions.elementAt(_currentIndex),
          )) //????????????
        ]));
  }
}

List myInfor = [
  {'name': 'Ellis', 'photo': 'images/ava5.png', 'date': '234'}
];
