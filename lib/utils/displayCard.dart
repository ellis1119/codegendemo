import 'package:flutter/material.dart';

class DisplayCard extends StatelessWidget {
  const DisplayCard({
    Key? key,
    required this.items,
  }) : super(key: key);
  final List<DisplayCardItem> items;

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
                  const EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Container(child: item.icon),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 6.0),
                          child: Text(item.title,
                              style: const TextStyle(
                                  color: Color.fromRGBO(101, 116, 139, 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0)),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 6.0, horizontal: 2.0),
                          child: Text(item.desc,
                              style: const TextStyle(
                                  fontSize: 13.0,
                                  letterSpacing: 1.3,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class DisplayCardItem {
  final String title;
  final String desc;
  final Widget icon;

  DisplayCardItem({
    required this.icon,
    required this.desc,
    required this.title,
  });
}
