import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class jobseeker extends StatefulWidget {
  const jobseeker({super.key});

  @override
  State<jobseeker> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<jobseeker> {
  File? _image;
  final picker = ImagePicker();

  String? selectedMajor;
  String? selectedExperience;

  Future pickImage() async {
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _image = File(picked.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 60),

            // --------------- PROFILE IMAGE -----------------
            GestureDetector(
              onTap: pickImage,
              child: Container(
                width: 93,
                height: 93,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                  image: _image != null
                      ? DecorationImage(
                          image: FileImage(_image!),
                          fit: BoxFit.cover,
                        )
                      : const DecorationImage(
                          image: AssetImage("assets/images/logo.png"),
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // -------------------- FULL NAME ----------------------
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Full Name",
                style: TextStyle(
                  fontFamily: "Adamina",
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 5),
            _buildTextField("Enter your full name"),

            const SizedBox(height: 20),

            // ---------------------- MAJOR ------------------------
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Major",
                style: TextStyle(
                  fontFamily: "Adamina",
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              height: 35,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                border: Border.all(color: const Color(0x867F7FF7)),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  hint: const Text(
                    "Enter your major",
                    style: TextStyle(fontSize: 15),
                  ),
                  value: selectedMajor,
                  items:
                      [
                            "Computer Science",
                            "Information Technology",
                            "Software Engineering",
                            "AI & Data",
                          ]
                          .map(
                            (m) => DropdownMenuItem(value: m, child: Text(m)),
                          )
                          .toList(),
                  onChanged: (value) {
                    setState(() => selectedMajor = value);
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ------------------- EXPERIENCE AREA ---------------------
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Experience Area",
                style: TextStyle(
                  fontFamily: "Adamina",
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              height: 35,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                border: Border.all(color: const Color(0x867F7FF7)),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  hint: const Text(
                    "Enter your area",
                    style: TextStyle(fontSize: 15),
                  ),
                  value: selectedExperience,
                  items:
                      [
                            "Mobile Development",
                            "Web Development",
                            "Networking",
                            "Cyber Security",
                          ]
                          .map(
                            (e) => DropdownMenuItem(value: e, child: Text(e)),
                          )
                          .toList(),
                  onChanged: (value) {
                    setState(() => selectedExperience = value);
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            // -------------------- ABOUT ME ------------------------
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "About Me",
                style: TextStyle(
                  fontFamily: "Adamina",
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            _buildTextField("Enter your about"),

            const SizedBox(height: 20),

            // ---------------- UPLOAD CERTIFICATE -------------------
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Upload Certificate",
                style: TextStyle(
                  fontFamily: "Adamina",
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            _buildTextField("Enter your certificate link"),

            const SizedBox(height: 20),

            // -------------------- PASSWORD -------------------------
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Password",
                style: TextStyle(
                  fontFamily: "Adamina",
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            _buildTextField("Enter your password", obscure: true),

            const SizedBox(height: 40),

            // ------------------ SIGN UP BUTTON ----------------------
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "login");
              },
              child: Container(
                width: 178,
                height: 37,
                decoration: BoxDecoration(
                  color: const Color(0xFF73946B),
                  borderRadius: BorderRadius.circular(40),
                ),
                alignment: Alignment.center,
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontFamily: "Adamina",
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, {bool obscure = false}) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: const Color(0x867F7FF7)),
      ),
      child: TextField(
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            fontFamily: "Adamina",
            fontSize: 15,
            color: Colors.black45,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        ),
      ),
    );
  }
}
