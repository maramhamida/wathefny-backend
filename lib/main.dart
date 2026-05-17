import 'package:flutter/material.dart';
import 'routes.dart'; // تأكدي المسار صحيح حسب مجلدك

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'وظفني', // اسم التطبيق
      debugShowCheckedModeBanner: false, // إزالة الشعار التجريبي
      initialRoute: Routes.login, // أول شاشة تظهر (Splash)
      routes: Routes.getRoutes(), // ربط كل المسارات بالصفحات/
    );
  }
}
