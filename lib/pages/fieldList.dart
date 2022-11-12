import 'package:codegensystem/utils/sliCard.dart';
import 'package:flutter/material.dart';

class FieldList extends StatefulWidget {
  final Function(String? field)? onSubmitted;

  const FieldList({this.onSubmitted, Key? key}) : super(key: key);

  @override
  FieldListState createState() => FieldListState();
}

class FieldListState extends State<FieldList> {
  late String field;
  String? fieldError;

  Function(String? field)? get onSubmitted => widget.onSubmitted;

  int _counter = 0;

  final List<String> _fieldArr = [];

  void add() {
    setState(() {
      _counter++;
      _fieldArr.add((_counter).toString());
    });
  }

  void remove(String i) {
    setState(() {
      _fieldArr.remove(i);
    });
  }

  @override
  void initState() {
    super.initState();
    field = "";

    fieldError = null;
  }

  void resetErrorText() {
    setState(() {
      fieldError = null;
    });
  }

  bool isValid = true;

  bool validate() {
    resetErrorText();
    if (field.isEmpty) {
      setState(() {
        fieldError = "字段名不能为空";
      });
      isValid = false;
    }

    return isValid;
  }

  void submit() {
    if (validate()) {
      if (onSubmitted != null) {
        onSubmitted!(field);
      } else {}
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(children: [
      Column(
        children: [
          Row(
            children: <Widget>[
              Flexible(
                  child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                for (var i in _fieldArr)
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 8.0),
                                    child: SliCard(
                                      topCardWidget: Row(
                                        children: <Widget>[
                                          Flexible(
                                              child: Container(
                                                  margin:
                                                      const EdgeInsets.all(6.0),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Expanded(
                                                        flex: 5,
                                                        child: Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      screenWidth *
                                                                          0.01,
                                                                  vertical:
                                                                      screenHeight *
                                                                          0.01),
                                                          child: InputField(
                                                            onChanged: (value) {
                                                              setState(() {
                                                                field = value;
                                                              });
                                                            },
                                                            labelText:
                                                                "字段名（还未完善）",
                                                            errorText:
                                                                fieldError,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            autoFocus: true,
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                          flex: 1,
                                                          child: Container(
                                                            margin:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        10.0),
                                                            child: ToolButton(
                                                                text: "保存",
                                                                onPressed: () =>
                                                                    {print(i)}),
                                                          )),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Container(
                                                          margin:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10.0),
                                                          child: ToolButton(
                                                            text: "删除",
                                                            onPressed: () =>
                                                                {remove(i)},
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ))),
                                        ],
                                      ),
                                      bottomCardWidget: const Text(
                                        '输入框还未完善',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ))),
            ],
          ),
          Row(
            children: <Widget>[
              Flexible(
                  child: Container(
                      margin: const EdgeInsets.only(
                          left: 6.0, right: 6.0, bottom: 60.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.01,
                                  vertical: screenHeight * 0.01),
                              child: IncButton(
                                text: "新增字段",
                                onPressed: add,
                              ),
                            ),
                          ),
                        ],
                      ))),
            ],
          ),
        ],
      )
    ]);
  }
}

class ToolButton extends StatelessWidget {
  final String text;
  final Function? onPressed;

  const ToolButton({this.text = "", this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: ElevatedButton(
        onPressed: onPressed as void Function()?,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 5.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 13, color: Colors.black87, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class IncButton extends StatelessWidget {
  final String text;
  final Function? onPressed;

  const IncButton({this.text = "", this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(66, 66, 74, 0.9),
            Color.fromRGBO(41, 50, 60, 0.9),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        onPressed: onPressed as void Function()?,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 13, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

/*
class FormButton extends StatelessWidget {
  final String text;
  final Function? onPressed;

  const FormButton({this.text = "", this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(6, 190, 182, 1),
            Color.fromRGBO(72, 177, 191, 1)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        // Round the DecoratedBox to match ElevatedButton
        borderRadius: BorderRadius.circular(5),
      ),
      child: ElevatedButton(
        onPressed: onPressed as void Function()?,
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: Colors.transparent,
          padding: EdgeInsets.symmetric(vertical: screenHeight * .025),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
*/
class InputField extends StatelessWidget {
  final String? labelText;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final String? errorText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool autoFocus;
  final bool obscureText;

  const InputField(
      {this.labelText,
      this.onChanged,
      this.onSubmitted,
      this.errorText,
      this.keyboardType,
      this.textInputAction,
      this.autoFocus = false,
      this.obscureText = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: autoFocus,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        errorText: errorText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
