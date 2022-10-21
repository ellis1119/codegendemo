import 'package:flutter/material.dart';

void main() => runApp(const MainList());

class MainList extends StatefulWidget {
  const MainList({Key? key}) : super(key: key);

  @override
  _MainListState createState() => _MainListState();
}

class _MainListState extends State<MainList> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              controller: ScrollController(),
              itemCount: listData.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.02,
                      ),
                      leading: AspectRatio(
                        aspectRatio: 9 / 10,
                        child: Image.asset(listData[index]['head']),
                      ),
                      title:Container(
                        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.006),
                        child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              listData[index]['name'],
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: screenHeight * 0.007),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              listData[index]['body'],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  letterSpacing: .3),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              listData[index]['date'] + '    ',
                              style: const TextStyle(fontSize: 14.0),
                            ),
                          )
                        ],
                      ),
                      )  ),
                  ],
                );
              }),
        )
      ],
    );
  }
}

List listData = [
  {
    "id": 1,
    "name": "John",
    "head": "images/photo.jpg",
    "date": "2022-07-18",
    "body":
        "Little Sam (on phone): My son is having high fever and he won’t be able to come to school today."
  },
  {
    "id": 2,
    "name": "Will",
    "head": "images/photo.jpg",
    "date": "2022-07-18",
    "body":
        "Little Sam (on phone): My son is having high fever and he won’t be able to come to school today."
  },
  {
    "id": 3,
    "name": "Beth",
    "head": "images/photo.jpg",
    "date": "2022-07-18",
    "body":
        "Little Sam (on phone): My son is having high fever and he won’t be able to come to school today."
  },
  {
    "id": 4,
    "name": "Miranda",
    "head": "images/photo.jpg",
    "date": "2022-07-18",
    "body":
        "Little Sam (on phone): My son is having high fever and he won’t be able to come to school today."
  },
  {
    "id": 5,
    "name": "Mike",
    "head": "images/photo.jpg",
    "date": "2022-07-18",
    "body":
        "Little Sam (on phone): My son is having high fever and he won’t be able to come to school today."
  },
  {
    "id": 4,
    "name": "Miranda",
    "head": "images/photo.jpg",
    "date": "2022-07-18",
    "body":
    "Little Sam (on phone): My son is having high fever and he won’t be able to come to school today."
  },
  {
    "id": 5,
    "name": "Mike",
    "head": "images/photo.jpg",
    "date": "2022-07-18",
    "body":
    "Little Sam (on phone): My son is having high fever and he won’t be able to come to school today."
  },
  {
    "id": 4,
    "name": "Miranda",
    "head": "images/photo.jpg",
    "date": "2022-07-18",
    "body":
    "Little Sam (on phone): My son is having high fever and he won’t be able to come to school today."
  },
  {
    "id": 5,
    "name": "Mike",
    "head": "images/photo.jpg",
    "date": "2022-07-18",
    "body":
    "Little Sam (on phone): My son is having high fever and he won’t be able to come to school today."
  },
];
