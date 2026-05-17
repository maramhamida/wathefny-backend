import 'package:flutter/material.dart';
import 'package:wathefny/signup_screen.dart';
import 'Home_Screen.dart';
import 'ForgetPassword.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool rememberMe = false;
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // ======= Logo =======
                Container(
                  height: deviceHeight * 0.30,
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('assets/images/logo.png'),
                    radius: 120,
                  ),
                ),

                // ======= Form =======
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Title
                      Text(
                        'LogIn',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontFamily: 'Adamina',
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      SizedBox(height: 30),

                      // ================= EMAIL =================
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Email',
                          style: TextStyle(fontSize: 16, fontFamily: 'Adamina'),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: "Enter your email",
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 18,
                            horizontal: 20,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide(color: Colors.black54),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide(color: Color(0xFF800D04)),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide(color: Color(0xFF800D04)),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return "Email is required";
                          if (!RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$',
                          ).hasMatch(value)) {
                            return "Invalid email format";
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 25),

                      // ================= PASSWORD =================
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Password',
                          style: TextStyle(fontSize: 16, fontFamily: 'Adamina'),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter your password",
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 18,
                            horizontal: 20,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide(color: Colors.black54),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide(color: Color(0xFF800D04)),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide(color: Color(0xFF800D04)),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return "Password is required";
                          if (value.length < 8)
                            return "Password must be at least 8 characters";
                          return null;
                        },
                      ),

                      SizedBox(height: 20),

                      // ================= REMEMBER + FORGET =================
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: rememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    rememberMe = value!;
                                  });
                                },
                              ),
                              Text(
                                "Remember me",
                                style: TextStyle(
                                  fontFamily: 'Adamina',
                                  fontSize: 12,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgetPasswordScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "Forget Password?",
                              style: TextStyle(
                                fontFamily: 'Adamina',
                                fontSize: 16,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 30),

                      // ================= LOGIN BUTTON =================
                      SizedBox(
                        width: 249,
                        height: 42,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF73946B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontFamily: 'Adamina',
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 20),

                      // ================= CREATE ACCOUNT =================
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(
                              fontFamily: 'Adamina',
                              fontSize: 14,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUpScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "Create Account",
                              style: TextStyle(
                                fontFamily: 'Adamina',
                                fontSize: 14,
                                color: Color(0xFF73946B),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
