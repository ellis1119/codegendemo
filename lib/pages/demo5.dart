import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Demo5());

class Demo5 extends StatefulWidget {
  const Demo5({Key? key}) : super(key: key);

  @override
  Demo5State createState() => Demo5State();
}

class Demo5State extends State<Demo5> {
  @override
  Widget build(BuildContext context) {
    return Text('text');
  }
}