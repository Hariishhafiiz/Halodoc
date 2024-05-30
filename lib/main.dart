import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rekmed/utlis/theme.dart';
import 'package:rekmed/view/screens/Onboarding.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      home: OnboardingPage(
        setLocale: (locale) {},
      ),
    );
  }
}
