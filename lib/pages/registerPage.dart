import 'dart:async';
import 'package:flutter/material.dart';
import 'package:slider_captcha/slider_capchar.dart';
import 'loginPage.dart';

void main() => runApp(const LoginPage());

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Card(
                elevation: 1,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                semanticContainer: false,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 20.0),
                  child: ListTile(
                      title: const Text(
                        "codegensystem",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Center(
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10.0),
                          child: const Register(),
                        ),
                      )),
                )),
          ),
          Expanded(
              flex: 1,
              child: ConstrainedBox(
                constraints: const BoxConstraints.expand(),
                child: Image.asset(
                  'images/bg.jpg',
                  fit: BoxFit.fill,
                ),
              ))
        ],
      ),
    );
  }
}

class Register extends StatefulWidget {
  final Function(String? email, String? username, String? password)?
      onSubmitted;

  const Register({this.onSubmitted, Key? key}) : super(key: key);

  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends State<Register> {
  late String email, password, confirmPassword, username;
  String? emailError, passwordError, usernameError;

  Function(String? email, String? username, String? password)?
      get onSubmitted => widget.onSubmitted;

  @override
  void initState() {
    super.initState();
    username = "";
    email = "";
    password = "";
    confirmPassword = "";

    emailError = null;
    passwordError = null;
    usernameError = null;
  }

  void resetErrorText() {
    setState(() {
      emailError = null;
      passwordError = null;
      usernameError = null;
    });
  }

  bool validate() {
    resetErrorText();

    RegExp emailExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    bool isValid = true;
    if (email.isEmpty || !emailExp.hasMatch(email)) {
      setState(() {
        emailError = "邮箱格式错误";
      });
      isValid = false;
    }

    if (password.isEmpty || confirmPassword.isEmpty) {
      setState(() {
        passwordError = "密码不能为空";
      });
      isValid = false;
    }
    if (password != confirmPassword) {
      setState(() {
        passwordError = "两次密码输入不一致";
      });
      isValid = false;
    }
    if (username.isEmpty) {
      setState(() {
        usernameError = "用户名不能为空";
      });
      isValid = false;
    }

    return isValid;
  }

  void showCaptcha(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            insetPadding: const EdgeInsets.symmetric(vertical: 2.0),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SliderCaptcha(
                  image: Image.asset(
                    'images/captcha.jpg',
                    fit: BoxFit.fill,
                  ),
                  onConfirm: (bool value) {
                    if (value == true) {
                      const time = Duration(milliseconds: 1110);
                      showMyDialog(context);
                      Timer(time, () {
                        Navigator.pushReplacementNamed(context, '/login');
                      });
                    }
                  },
                ),
              ],
            ),
          );
        });
  }

  void showMyDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Icon(
              Icons.check_circle_outline,
              color: Colors.green,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('验证成功！'),
              ],
            ),
          );
        });
  }

  void submit() {
    if (validate()) {
      if (onSubmitted != null) {
        onSubmitted!(email, username, password);
      } else {
        showCaptcha(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Container(
        width: 450,
        margin: EdgeInsets.symmetric(vertical: screenHeight * 0.08),
        child: ListView(
          children: [
            SizedBox(height: screenHeight * .06),
            const Text(
              "您好,",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent),
            ),
            SizedBox(height: screenHeight * .008),
            Text(
              "欢迎注册XXXXXXXX！",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black.withOpacity(.6),
              ),
            ),
            SizedBox(height: screenHeight * .06),
            InputField(
              onChanged: (value) {
                setState(() {
                  username = value;
                });
              },
              labelText: "用户名",
              errorText: usernameError,
              textInputAction: TextInputAction.next,
              autoFocus: true,
            ),
            SizedBox(height: screenHeight * .025),
            InputField(
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              labelText: "密码",
              errorText: passwordError,
              obscureText: true,
              textInputAction: TextInputAction.next,
            ),
            SizedBox(height: screenHeight * .025),
            InputField(
              onChanged: (value) {
                setState(() {
                  confirmPassword = value;
                });
              },
              onSubmitted: (value) => submit(),
              labelText: "再次输入密码",
              errorText: passwordError,
              obscureText: true,
              textInputAction: TextInputAction.done,
            ),
            SizedBox(height: screenHeight * .025),
            InputField(
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
              labelText: "邮箱",
              errorText: emailError,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              autoFocus: true,
            ),
            SizedBox(
              height: screenHeight * .05,
            ),
            FormButton(
              text: "注册",
              onPressed: submit,
            ),
            SizedBox(
              height: screenHeight * .045,
            ),
            TextButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginPage())),
              child: RichText(
                text: const TextSpan(
                  text: "我已有账号， ",
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: "去登录",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

class FormButton extends StatelessWidget {
  final String text;
  final Function? onPressed;

  const FormButton({this.text = "", this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed as void Function()?,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: Colors.lightBlue,
        padding: const EdgeInsets.symmetric(vertical: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 15, color: Colors.white),
      ),
    );
  }
}

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
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
