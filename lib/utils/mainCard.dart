import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    Key? key,
    required this.items,
  }) : super(key: key);
  final List<MainCardItem> items;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      semanticContainer: false,
      child: getCard(),
    );
  }

  getCard() {
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          for (final item in items)
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(item.title,
                              style: const TextStyle(
                                  color: Color.fromRGBO(101, 116, 139, 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0)),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 6.0),
                            child: Text(item.data.toString(),
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 32.0)),
                          )
                        ],
                      ),
                      Container(child: item.icon)
                    ],
                  ),
                  Text(item.desc,
                      style: const TextStyle(
                          color: Color.fromRGBO(101, 116, 139, 1),
                          fontSize: 14.0)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class MainCardItem {
  final String title;
  final num data;
  final String desc;
  final Widget icon;

  MainCardItem({
    required this.icon,
    required this.desc,
    required this.title,
    required this.data,
  });
}
