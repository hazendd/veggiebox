import 'package:flutter/material.dart';
import 'package:veggie_box/UI/home_page.dart';
import 'package:veggie_box/UI/login.dart';
import 'package:veggie_box/UI/reusable_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _usernameTextController = TextEditingController();
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
                const SizedBox(height: 56),
                reusableTextField("Username", Icons.person_outline, false,
                    _usernameTextController),
                const SizedBox(height: 10),
                reusableTextField(
                    "Email", Icons.person_outline, false, _emailTextController),
                const SizedBox(height: 10),
                reusableTextField("Password", Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(height: 20),
                signInSignUpButton(context, false, () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                }),
                signInOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signInOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("I have an account? ",
            style: TextStyle(color: Colors.black, fontSize: 12)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Login()));
          },
          child: const Text(
            "Login",
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
