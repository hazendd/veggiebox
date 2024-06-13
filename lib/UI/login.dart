import 'package:flutter/material.dart';
import 'package:veggie_box/UI/home_page.dart';
import 'package:veggie_box/UI/reusable_widget.dart';
import 'package:veggie_box/UI/sign_up.dart';
// Make sure to import HomePage

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        // color: Colors.black,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.1, 20, 0),
            child: Column(
              children: [
                logoVB("assets/images/logo.png"),
                const SizedBox(height: 130),
                reusableTextField(
                    "Email", Icons.person_outline, false, _emailTextController),
                const SizedBox(height: 10),
                reusableTextField("Password", Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(height: 20),
                signInSignUpButton(context, true, () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                }),
                signUpOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account? ",
            style: TextStyle(color: Colors.black, fontSize: 12)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignUpPage()));
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(
                color: Color(0xff43992D),
                fontWeight: FontWeight.bold,
                fontSize: 12),
          ),
        )
      ],
    );
  }
}
