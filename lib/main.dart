import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:message/pages/login_page.dart';
import 'package:message/pages/register_page.dart';
import 'package:message/services/auth/auth_gate.dart';
import 'package:message/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyBsY4-8a_zfT4hsnI323e9kJchFZsCrF3Y",
      appId: "1:411707088041:android:ea877e07f59e19a9bf1db8",
      messagingSenderId: "411707088041",
      projectId: "flutter-8350f",
    ),
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthService(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),  // Đảm bảo AuthGate là widget chính đầu tiên
    );
  }
}
