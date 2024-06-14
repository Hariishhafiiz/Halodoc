import 'package:flutter/material.dart';
import 'package:my_app/services/alert_service.dart';
import 'package:my_app/services/auth_service.dart';
import 'package:my_app/services/navigation_service.dart';
import 'package:my_app/view/widget/login/const.dart';
import 'package:my_app/view/widget/login/custom_form.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/globals.dart' as globals;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GetIt _getIt=GetIt.instance;

  final GlobalKey<FormState>_loginFormKey = GlobalKey();
  late AuthService _authService;
  late NavigationService _navigationService;
  late AlertService _alertService;


  String ? email,password;
  @override

  void initState(){
    super.initState();
    _authService=_getIt.get<AuthService>();
    _navigationService=_getIt.get<NavigationService>();
    _alertService = _getIt.get<AlertService>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildUI(context),
    );
  }

  Widget _buildUI(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 20.0,
        ),
        child: Column(
          children: [
            _headerText(),
            _loginForm(context) 
          ],
        ),
      ),
    );
  }

  Widget _headerText() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Login",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            globals.lang == 'en' ? "Login to your account" : "Masuk ke akun anda",
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.40,
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.05,
      ),
      child: Form(
        key:_loginFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomFormField(
              height: MediaQuery.of(context).size.height * 0.1,
              hintText: "Email",
              validationRegEx: EMAIL_VALIDATION_REGEX,
              onSaved: (value){
                email=value;
              },
            ),
            CustomFormField(
              height: MediaQuery.of(context).size.height * 0.1,
              hintText: "Password",
              validationRegEx: PASSWORD_VALIDATION_REGEX,
              obscureText: true,
              onSaved: (value){
                password=value;
              } ,
            ),
            _loginButton(context),
            _createAnAccountLink()
          ],
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: MaterialButton(
        onPressed: () async{
          if (_loginFormKey.currentState?.validate() ?? false) {
            _loginFormKey.currentState?.save();
            bool result = await _authService.login(email!,password!);
            print(result);
            
            if(result){
              _navigationService.pushReplacementNamed("/mainpage");

            }else{
              _alertService.showToast(
                text: "Failed to login ,Please try again",
                icon:Icons.error,
                );
              }
          }
        },
        color: Colors.red[700],
        child: const Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _createAnAccountLink() {
  return Expanded(
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(globals.lang == 'en' ? "Don't Have an account? " : "Belum punya akun? "),
        GestureDetector(
          onTap: () {
            _navigationService.pushNamed("/Register");
          },
          child: Text(
            globals.lang == 'en' ? "Sign Up" : "Daftar",
            style: const TextStyle(
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    ),
  );
}

}
