import 'package:flutter/material.dart';
import 'package:veggie_box/UI/reusable_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEditing = false;

  final TextEditingController usernameController =
      TextEditingController(text: 'Veggie Box');
  final TextEditingController emailController =
      TextEditingController(text: 'veggiebox@gmail.com');
  final TextEditingController phoneController =
      TextEditingController(text: '0812234953');
  final TextEditingController dobController =
      TextEditingController(text: '9 - 10 - 2001');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff43992D),
        title: const Center(
          child: Text(
            "Edit Profile",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(isEditing ? Icons.save : Icons.edit),
            onPressed: () {
              setState(() {
                isEditing = !isEditing;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            Center(
              child: CircleAvatar(
                  radius: 50,
                  child: Icon(
                    Icons.person_outline,
                    size: 80,
                    color: Colors.grey,
                  )),
            ),
            const SizedBox(height: 20),
            ProfileField(
              label: 'Username',
              controller: usernameController,
              isEditing: isEditing,
            ),
            const SizedBox(height: 10),
            ProfileField(
              label: 'Email',
              controller: emailController,
              isEditing: isEditing,
            ),
            const SizedBox(height: 10),
            ProfileField(
              label: 'No Telephone',
              controller: phoneController,
              isEditing: isEditing,
            ),
            const SizedBox(height: 10),
            ProfileField(
              label: 'Tanggal Lahir',
              controller: dobController,
              isEditing: isEditing,
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final bool isEditing;

  const ProfileField({
    required this.label,
    required this.controller,
    required this.isEditing,
  });

  @override
  _ProfileFieldState createState() => _ProfileFieldState();
}

class _ProfileFieldState extends State<ProfileField> {
  bool isEdited = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      if (widget.controller.text.isNotEmpty && !isEdited) {
        setState(() {
          isEdited = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.label,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          controller: widget.controller,
          readOnly: !widget.isEditing,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: isEdited
                  ? BorderSide.none
                  : const BorderSide(color: Colors.green),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: isEdited
                  ? BorderSide.none
                  : const BorderSide(
                      color: Colors.green,
                      width: 2,
                    ),
            ),
          ),
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
