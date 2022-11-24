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

  final List _fieldArr = [];
  final List _fieldStatus = [];

  void add() {
    setState(() {
      _fieldArr.add('');
      _fieldStatus.add(0);
    });
  }

  void remove(int i) {
    setState(() {
      _fieldArr.removeAt(i);
      _fieldStatus.removeAt(i);
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
    return Column(children: [
      Column(
        children: [
          if (_fieldArr.isNotEmpty)
            Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                        padding: const EdgeInsets.only(top: 2.0, bottom: 12.0),
                        child: SizedBox(
                            height: 450.0,
                            child: ListView.builder(
                                controller: ScrollController(),
                                scrollDirection: Axis.vertical,
                                itemCount: _fieldArr.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
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
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        10,
                                                                    vertical:
                                                                        5),
                                                            child: Column(
                                                                children: <
                                                                    Widget>[
                                                                  if (_fieldStatus[
                                                                          index] ==
                                                                      0)
                                                                    InputField(
                                                                      onChanged:
                                                                          (value) {
                                                                        field =
                                                                            value;
                                                                        setState(
                                                                            () {
                                                                          _fieldArr.setRange(
                                                                              index,
                                                                              index + 1,
                                                                              [
                                                                                field
                                                                              ]);
                                                                        });
                                                                      },
                                                                      labelText:
                                                                          "字段名",
                                                                      errorText:
                                                                          fieldError,
                                                                      textInputAction:
                                                                          TextInputAction
                                                                              .next,
                                                                      autoFocus:
                                                                          true,
                                                                    ),
                                                                  if (_fieldStatus[
                                                                          index] ==
                                                                      1)
                                                                    Container(
                                                                      margin: const EdgeInsets
                                                                              .only(
                                                                          top:
                                                                              20.0,
                                                                          left:
                                                                              10.0),
                                                                      child:
                                                                          Text(
                                                                        '字段名：${_fieldArr[index]}',
                                                                        style: const TextStyle(
                                                                            fontSize:
                                                                                15.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            letterSpacing: 1.8),
                                                                      ),
                                                                    )
                                                                ])),
                                                      ),
                                                      Expanded(
                                                          flex: 1,
                                                          child: Container(
                                                            margin:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        10.0),
                                                            child: DecoratedBox(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                              ),
                                                              child:
                                                                  ElevatedButton(
                                                                onPressed:
                                                                    _fieldStatus[index] ==
                                                                            0
                                                                        ? () =>
                                                                            {
                                                                              setState(() {
                                                                                _fieldStatus.setRange(index, index + 1, [
                                                                                  1
                                                                                ]);
                                                                              })
                                                                            }
                                                                        : () =>
                                                                            {},
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                  elevation: 0,
                                                                  primary: _fieldStatus[
                                                                              index] ==
                                                                          0
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .black54,
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      vertical:
                                                                          16.0,
                                                                      horizontal:
                                                                          5.0),
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                ),
                                                                child: Text(
                                                                  "保存",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          13,
                                                                      color: _fieldStatus[index] == 0
                                                                          ? Colors
                                                                              .black87
                                                                          : Colors
                                                                              .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ),
                                                            ),
                                                          )),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Container(
                                                          margin:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10.0),
                                                          child: DecoratedBox(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                            ),
                                                            child:
                                                                ElevatedButton(
                                                              onPressed:
                                                                  _fieldStatus[
                                                                              index] ==
                                                                          1
                                                                      ? () => {
                                                                            setState(() {
                                                                              remove(index);
                                                                            })
                                                                            //   remove(index)
                                                                          }
                                                                      : () =>
                                                                          {},
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                elevation: 0,
                                                                primary: _fieldStatus[
                                                                            index] ==
                                                                        1
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black54,
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        16.0,
                                                                    horizontal:
                                                                        5.0),
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                ),
                                                              ),
                                                              child: Text(
                                                                "删除",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    color: _fieldStatus[index] ==
                                                                            1
                                                                        ? Colors
                                                                            .black87
                                                                        : Colors
                                                                            .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ),
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
                                  );
                                }))))
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
                            child: IncButton(
                              text: "新增字段",
                              onPressed: add,
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

class IncButton extends StatelessWidget {
  final String text;
  final Function? onPressed;

  const IncButton({this.text = "", this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed as void Function()?,
      style: ElevatedButton.styleFrom(
        side: const BorderSide(
            width: 0.6, color: Colors.grey, style: BorderStyle.solid),
        elevation: 0,
        primary: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 13, color: Colors.black87, fontWeight: FontWeight.bold),
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
