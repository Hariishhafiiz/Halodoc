import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/models/user/user_profile.dart';
import 'package:my_app/services/alert_service.dart';
import 'package:my_app/services/auth_service.dart';
import 'package:my_app/services/database_service.dart';
import 'package:my_app/services/media_service.dart';
import 'package:my_app/services/navigation_service.dart';
import 'package:my_app/services/storage_service.dart';
import 'package:my_app/view/widget/login/const.dart';
import 'package:my_app/view/widget/login/custom_form.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State <RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State <RegisterPage> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey();
  final GetIt _getIt = GetIt.instance;
  late MediaService _mediaService;
  late NavigationService _navigationService;
  late AuthService _authService;
  late StorageService _storageService;
  late DatabaseService _databaseService;
  late AlertService _alertService;

  String? email,password,Name;
  File ? selectedImage;
  bool isLoading = false;

  @override
  void initState(){
    super.initState();
    _mediaService = _getIt.get<MediaService>();
    _navigationService=_getIt.get<NavigationService>();
    _authService=_getIt.get<AuthService>();
    _storageService=_getIt.get<StorageService>();
    _databaseService=_getIt.get<DatabaseService>();
    _alertService=_getIt.get<AlertService>();
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
            if(!isLoading)_registerForm(),
            if(!isLoading)_loginAccountLink(),
            if(isLoading)
              const Expanded(
                child: Center(
                  child : CircularProgressIndicator(),
                ),
              )
          ],
        ),
      ),
    );
  }

  Widget _headerText() {
    return const SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Halo",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            "Silahkan registrasi",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
Widget _registerForm() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.60,
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.05,
      ),
      child: Form(
        key:_registerFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _pfpselectionfiled(),
            CustomFormField(
            hintText:"Name",
            height: MediaQuery.sizeOf(context).height*0.1, 
            validationRegEx: NAME_VALIDATION_REGEX, 
            onSaved: (value){
              setState(() {
                Name = value;
              },
             );
            },
           ),
           CustomFormField(
            hintText:"Email",
            height: MediaQuery.sizeOf(context).height*0.1, 
            validationRegEx: EMAIL_VALIDATION_REGEX, 
            onSaved: (value){
              setState(() {
                email = value;
              },
             );
            },
           ),
           CustomFormField(
            hintText:"password",
            height: MediaQuery.sizeOf(context).height*0.1, 
            validationRegEx: PASSWORD_VALIDATION_REGEX,
            obscureText: true, 
            onSaved: (value){
              setState(() {
                password = value;
              },
             );
            },
           ),
           _registerButton(),
          ],
        ),
      ),
    );
}

Widget _pfpselectionfiled(){
  return GestureDetector(
    onTap: ()async {
      File? file = await _mediaService.getImageFromGallery();
      if (file != null){
        setState(() {
          selectedImage = file;
        });
      }
    } ,
    child: CircleAvatar(
      radius: MediaQuery.of(context).size.width * 0.15,
      backgroundImage: selectedImage!=null 
        ?FileImage(selectedImage!)
        :const NetworkImage(PLACEHOLDER_PFP)as ImageProvider,
      ),
  );
  }
Widget _registerButton() {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    child: MaterialButton(
      color: Theme.of(context).colorScheme.primary,
      onPressed: () async {
        setState(() {
          isLoading = true;
        });
        try {
          if (_registerFormKey.currentState?.validate() ?? false) {
            _registerFormKey.currentState?.save();
            bool result = await _authService.signup(email!, password!);
            if (result) {
              String? pfpURL;
              if (selectedImage != null) {
                pfpURL = await _storageService.uploadUserPfp(
                  file: selectedImage!,
                  uid: _authService.user!.uid,
                );
              } else {
                pfpURL = 'https://thumbs.dreamstime.com/b/default-avatar-profile-icon-vector-social-media-user-portrait-176256935.jpg'; // URL gambar profil default
              }
              await _databaseService.createUserProfile(
                userProfile: UserProfile(
                  uid: _authService.user!.uid,
                  name: Name,
                  pfpURL: pfpURL,
                ),
              );
              _alertService.showToast(
                text: "User registered successfully",
                icon: Icons.check,
              );
              _navigationService.goBack();
              _navigationService.pushReplacementNamed("/home");
            } else {
              _alertService.showToast(
                text: "Failed to register user",
                icon: Icons.error,
              );
            }
            print(result);
          }
        } catch (e) {
          print(e);
          _alertService.showToast(
            text: "An error occurred: $e",
            icon: Icons.error,
          );
        }
        setState(() {
          isLoading = false;
        });
      },
      child: const Text(
        "Register",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
  );
}
//2:23


Widget _loginAccountLink() {
  return Expanded(
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text("Already Have an account? "),
        GestureDetector(
          onTap: () {
            _navigationService.goBack();
          },
          child: const Text(
            "Login",
            style: TextStyle(
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    ),
  );
}
}
