import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rekmed/utils/theme.dart';
import 'package:rekmed/view/screens/Onboarding.dart';
import 'package:rekmed/view/screens/chat/Assistant.dart';
import 'package:rekmed/view/screens/chat/ChatScreen.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rekmed/service/auth_service.dart';
import 'package:rekmed/service/navigation_service.dart';
import 'package:rekmed/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
// main Hapis

/*Future<void> main() async {
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
      home: const Assistant(),
    );
  }
}*/

//main haikal (belum disatuin ama main hapis)
void main() async{
  await setup();
  runApp(MyApp());
}

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupFirebase();
  await registerService();
}

class MyApp extends StatelessWidget {
  final GetIt _getIt = GetIt.instance;

  late NavigationService _navigationService;
  late AuthService _authService;

  MyApp({super.key}){
    _navigationService = _getIt.get<NavigationService>();
    _authService = _getIt.get<AuthService>();
  }

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigationService.navigatorKey,
      title: 'Chat',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      initialRoute: _authService.user !=null ? "/home": "/login",
      routes: _navigationService.routes,
    );
  }
}
