import 'package:flutter/material.dart';
import 'package:rekmed/view/pages/register_page.dart';
import 'package:rekmed/view/pages/login_page.dart';
import 'package:rekmed/view/pages/home_page.dart';
import 'package:rekmed/view/screens/Onboarding.dart';
import 'package:rekmed/view/screens/InfoCustService.dart';
import 'package:rekmed/view/pages/main_page.dart';
import 'package:rekmed/view/screens/chat/Assistant.dart';


class NavigationService{
  late GlobalKey<NavigatorState>_navigatorKey;

  final Map<String , Widget Function(BuildContext)> _routes ={
    "/login":(context)=> LoginPage(),
    "/Register":(context)=> RegisterPage(),
    "/home":(context)=> Homepage(),
    "/onboarding":(context)=> OnboardingPage(setLocale: (locale) {},),
    "/infocustservice":(context)=> InfoCustService(),
    "/mainpage":(context)=> const MainPage(),
    "/assistant":(context)=> const Assistant(),
  };

  GlobalKey<NavigatorState>? get navigatorKey{
    return _navigatorKey;
  }

  Map<String , Widget Function(BuildContext)> get routes {
    return _routes;
  }

  NavigationService(){
    _navigatorKey = GlobalKey<NavigatorState>();
  }
  void push(MaterialPageRoute route){
    _navigatorKey.currentState?.push(route);
  }

  void pushNamed(String routeName){
    _navigatorKey.currentState?.pushNamed(routeName);
  }

  void pushReplacementNamed(String routeName){
    _navigatorKey.currentState?.pushReplacementNamed(routeName);
  }

  void goBack(){
    _navigatorKey.currentState?.pop();
  }
}
