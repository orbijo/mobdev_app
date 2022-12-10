import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobdev_app/arguments/FormData.dart';
import 'package:mobdev_app/screens/Dashboard.dart';
import 'package:mobdev_app/screens/Signup.dart';
import 'package:mobdev_app/services/AuthService.dart';
import 'package:mobdev_app/widgets/CustomTextField.dart';
import 'package:mobdev_app/widgets/PasswordField.dart';
import 'package:mobdev_app/widgets/PrimaryButton.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "/login";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthService _authService = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String errorText = '';
  bool obscurePassword = true;
  bool invalidAuth = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: width * .9,
              child: Column(
                children: [
                  Image.asset('images/starbs2.png', height: 210, width: 210),
                  Text(
                    "Starbucks\n",
                    style: TextStyle(
                        fontFamily: 'SoDoSans',
                        fontSize: 60,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  CustomTextField(
                      labelText: "Email Address",
                      hintText: "Enter your email address",
                      controller: emailController,
                      textInputType: TextInputType.emailAddress),
                  const SizedBox(
                    height: 20.0,
                  ),
                  PasswordField(
                    obscureText: obscurePassword,
                    onTap: handleObscurePassword,
                    labelText: "Password",
                    hintText: "Enter your password",
                    controller: passwordController,
                  ),
                  Visibility(
                    child: Text(
                      "Invalid Email or Password!",
                      style: TextStyle(color: Colors.red),
                    ),
                    visible: invalidAuth,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  PrimaryButton(
                    text: "Login",
                    iconData: Icons.login,
                    onPress: () {
                      // Navigator.pushReplacementNamed(
                      //     context, Dashboard.routeName,
                      //     arguments: FormData(emailController.text));
                      loginNative();
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  PrimaryButton(
                      text: "Signup",
                      iconData: Icons.person_add,
                      onPress: () {
                        Navigator.pushNamed(context, Signup.routeName);
                      }),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SignInButton(
                    Buttons.Google,
                    onPressed: () {
                      loginWithGoogle();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  handleObscurePassword() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }

  loginNative() async {
    try {
      //loading circle
      showDialog(
          context: context,
          builder: (context) {
            return const Center(
                child: SpinKitFadingCube(
              color: Colors.white,
              size: 25,
            ));
          });
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(
        context,
        Dashboard.routeName,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        setState(() {
          invalidAuth = true;
        });
      }
    }
  }

  loginWithGoogle() async {
    try {
      showDialog(
          context: context,
          builder: (context) {
            return const Center(
                child: SpinKitFadingCube(
              color: Colors.white,
              size: 25,
            ));
          });
      var user = await _authService.signInWithGoogle();
      Navigator.of(context).pop();
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(
        context,
        Dashboard.routeName,
      );
    } catch (e) {}
  }
}
