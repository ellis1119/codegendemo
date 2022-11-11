import 'package:flutter/material.dart';

class InputConfig extends StatefulWidget {
  final Function(String? table, String? library, String? notes, String? number)?
      onSubmitted;

  const InputConfig({this.onSubmitted, Key? key}) : super(key: key);

  @override
  InputConfigState createState() => InputConfigState();
}

class InputConfigState extends State<InputConfig> {
  late String table, library, notes, number;
  String? tableError, libraryError, notesError, numberError;

  Function(String? table, String? library, String? notes, String? number)?
      get onSubmitted => widget.onSubmitted;

  @override
  void initState() {
    super.initState();
    table = "";
    library = "";
    notes = "";
    number = "";

    tableError = null;
    libraryError = null;
    notesError = null;
    numberError = null;
  }

  void resetErrorText() {
    setState(() {
      tableError = null;
      libraryError = null;
      notesError = null;
      numberError = null;
    });
  }

  bool validate() {
    resetErrorText();

    RegExp numberExp = RegExp(r"^[1-9]\d*|0$");

    bool isValid = true;
    if (number.isEmpty || !numberExp.hasMatch(number)) {
      setState(() {
        numberError = "生成条数应为非负整数";
      });
      isValid = false;
    }

    if (table.isEmpty) {
      setState(() {
        tableError = "表名不能为空";
      });
      isValid = false;
    }

    return isValid;
  }

  void submit() {
    if (validate()) {
      if (onSubmitted != null) {
        onSubmitted!(table, library, notes, number);
      } else {}
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView.builder(
            controller: ScrollController(),
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return Column(children: [
                Column(
                  children: [
                    Row(
                      children: <Widget>[
                        Flexible(
                            child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 6.0),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: screenWidth * 0.005,
                                            vertical: screenHeight * 0.01),
                                        child: ImpButton(
                                          text: "智能导入",
                                          onPressed: submit,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: screenWidth * 0.005,
                                            vertical: screenHeight * 0.01),
                                        child: ImpButton(
                                          text: "导入表",
                                          onPressed: submit,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: screenWidth * 0.005,
                                            vertical: screenHeight * 0.01),
                                        child: ImpButton(
                                          text: "导入配置",
                                          onPressed: submit,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: screenWidth * 0.005,
                                            vertical: screenHeight * 0.01),
                                        child: ImpButton(
                                          text: "导入建表SQL",
                                          onPressed: submit,
                                        ),
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
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 6.0),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: screenWidth * 0.01,
                                            vertical: screenHeight * 0.01),
                                        child: InputField(
                                          onChanged: (value) {
                                            setState(() {
                                              library = value;
                                            });
                                          },
                                          labelText: "库名",
                                          textInputAction: TextInputAction.next,
                                          autoFocus: true,
                                        ),
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
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 6.0),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: screenWidth * 0.01,
                                            vertical: screenHeight * 0.01),
                                        child: InputField(
                                          onChanged: (value) {
                                            setState(() {
                                              table = value;
                                            });
                                          },
                                          labelText: "表名",
                                          errorText: tableError,
                                          textInputAction: TextInputAction.next,
                                          autoFocus: true,
                                        ),
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
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 6.0),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: screenWidth * 0.01,
                                            vertical: screenHeight * 0.01),
                                        child: InputField(
                                          onChanged: (value) {
                                            setState(() {
                                              notes = value;
                                            });
                                          },
                                          labelText: "表注释",
                                          textInputAction: TextInputAction.next,
                                          autoFocus: true,
                                        ),
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
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 6.0),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: screenWidth * 0.01,
                                            vertical: screenHeight * 0.01),
                                        child: InputField(
                                          onChanged: (value) {
                                            setState(() {
                                              number = value;
                                            });
                                          },
                                          labelText: "生成条数",
                                          errorText: numberError,
                                          textInputAction: TextInputAction.next,
                                          autoFocus: true,
                                        ),
                                      ),
                                    ),
                                  ],
                                ))),
                      ],
                    ),
                    /*   FormButton(
                      text: "注册",
                      onPressed: submit,
                    ),*/
                  ],
                )
              ]);
            }));
  }
}

class ImpButton extends StatelessWidget {
  final String text;
  final Function? onPressed;

  const ImpButton({this.text = "", this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(66, 66, 74, 1.0),
            Color.fromRGBO(41, 50, 60, 1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        // Round the DecoratedBox to match ElevatedButton
        borderRadius: BorderRadius.circular(5),
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
