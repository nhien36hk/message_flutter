import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:message/pages/home_page.dart';
import 'package:message/pages/login_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Kiểm tra xem kết nối đã sẵn sàng chưa và trạng thái auth có thay đổi hay không
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            return const HomePage(); // Nếu đã đăng nhập thì chuyển đến HomePage
          } else {
            return const LoginPage(); // Nếu chưa đăng nhập thì quay lại trang đăng nhập
          }
        }

        // Nếu trạng thái kết nối vẫn chưa xong, cho người dùng thấy màn hình loading
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
