import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projector_loan/firebase_options.dart';
import 'package:projector_loan/module/admin/adm_main_navigation/view/adm_main_navigation_view.dart';
import 'package:projector_loan/module/auth/email_verification/view/email_verification_view.dart';
import 'package:projector_loan/module/auth/login/view/login_view.dart';
import 'package:projector_loan/state_util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Get.navigatorKey,
      title: 'Projector Loan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        textTheme: GoogleFonts.openSansTextTheme(),
        useMaterial3: true,
      ),
      // home: const AdmMainNavigationView(),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const EmailVerificationView();
          } else {
            return const LoginView();
          }
        },
      ),
    );
  }
}
