import 'package:flutter/material.dart';
import 'package:flutter_background/flutter_background.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:my_app/utils/theme.dart';
// import 'package:my_app/view/screens/Onboarding.dart';
// import 'firebase_options.dart';
// import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/services/auth_service.dart';
import 'package:my_app/services/navigation_service.dart';
import 'package:my_app/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

void main() async {
  await setup();
  runApp(const MyApp());
}

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupFirebase();
  await registerService();

  const androidConfig = FlutterBackgroundAndroidConfig(
    notificationTitle: "flutter_background example app",
    notificationText:
        "Background notification for keeping the example app running in the background",
    notificationImportance: AndroidNotificationImportance.Default,
    notificationIcon: AndroidResource(
      name: 'background_icon',
      defType: 'drawable',
    ), // Default is ic_launcher from folder mipmap
  );

  await FlutterBackground.initialize(androidConfig: androidConfig);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GetIt _getIt = GetIt.instance;
  Locale _locale = const Locale('id'); // Default locale

  late NavigationService _navigationService;
  late AuthService _authService;

  _MyAppState() {
    _navigationService = _getIt.get<NavigationService>();
    _authService = _getIt.get<AuthService>();
  }

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: _navigationService.navigatorKey,
      title: 'Chat',
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: _locale,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      initialRoute: _authService.user != null ? "/mainpage" : "/onboarding",
      routes: _navigationService.routes,
    );
  }
}
