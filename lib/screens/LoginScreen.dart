import 'package:flutter/material.dart';
import 'package:mobdev_app/arguments/FormData.dart';
import 'package:mobdev_app/screens/Dashboard.dart';
import 'package:mobdev_app/screens/Signup.dart';
import 'package:mobdev_app/widgets/CustomTextField.dart';
import 'package:mobdev_app/widgets/PasswordField.dart';
import 'package:mobdev_app/widgets/PrimaryButton.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "/login";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscurePassword = true;
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
                  Image.asset('images/starbs1.jpg'),
                  Text(
                    "Login\n",
                    style: Theme.of(context).textTheme.displaySmall,
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
                      controller: passwordController),
                  const SizedBox(
                    height: 20.0,
                  ),
                  PrimaryButton(
                    text: "Login",
                    iconData: Icons.login,
                    onPress: () {
                      Navigator.pushReplacementNamed(
                          context, Dashboard.routeName,
                          arguments: FormData(emailController.text));
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
                      })
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
}
