import 'package:flutter/material.dart';
import 'package:flutter_hello/utils/routes.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changedButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changedButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changedButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
          child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              new Image.asset(
                "assets/images/login_image.png",
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Welcome $name",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Enter Username", labelText: "Username"),
                      validator: (value) {
                        if (value!.isEmpty) return "Username cannot be null";
                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter Password", labelText: "Password"),
                      validator: (value) {
                        if (value!.isEmpty)
                          return "Password cannot be null";
                        else if (value.length < 6)
                          return "Password should be atleast 6 chars";
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Material(
                      color: Colors.deepPurple,
                      borderRadius:
                          BorderRadius.circular(changedButton ? 50 : 8),
                      child: InkWell(
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: changedButton ? 50 : 150,
                          height: 50,
                          alignment: Alignment.center,
                          child: changedButton
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text("Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                    //   },
                    //   child: Text("Login"),
                    //   style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                    // )
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
