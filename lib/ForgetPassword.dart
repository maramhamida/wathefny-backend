import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forget Password'),
        backgroundColor: Color(0xFF73946B),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter your email to reset password',
              style: TextStyle(
                fontFamily: 'Adamina',
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: "Email",
                hintStyle: TextStyle(
                  fontFamily: 'Adamina',
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.5),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 20,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(
                    color: Colors.black.withOpacity(0.5),
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(
                    color: Colors.black.withOpacity(0.8),
                    width: 1,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 42,
              child: ElevatedButton(
                onPressed: () {
                  // هنا تضيفي الكود لإرسال رابط إعادة تعيين كلمة المرور
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Password reset link sent!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF73946B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                child: Text(
                  "Send Reset Link",
                  style: TextStyle(
                    fontFamily: 'Adamina',
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
