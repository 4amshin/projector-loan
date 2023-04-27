import 'package:projector_loan/core.dart';

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
      home: const AdmMainNavigationView(),
      // home: StreamBuilder<User?>(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       return const EmailVerificationView();
      //     } else {
      //       return const LoginView();
      //     }
      //   },
      // ),
    );
  }
}
