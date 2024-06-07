import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rekmed/model/user/user_profile.dart';
import 'package:rekmed/view/pages/chat_pages.dart';
import 'package:rekmed/service/alert_service.dart';
import 'package:rekmed/service/auth_service.dart';
import 'package:rekmed/service/database_service.dart';
import 'package:rekmed/service/navigation_service.dart';
import 'package:rekmed/view/widget/chat/chat_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final GetIt _getIt = GetIt.instance;

  late AuthService _authService;
  late NavigationService _navigationService;
  late AlertService _alertService;
  late DatabaseService _databaseService;

  @override
  void initState(){
    super.initState();
    _authService = _getIt.get<AuthService>();
    _navigationService = _getIt.get<NavigationService>();
    _alertService = _getIt.get<AlertService>();
    _databaseService=_getIt.get<DatabaseService>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messages"),
        actions: [
          IconButton(
            onPressed:()async{
              bool result = await _authService.logout();
              if(result){
                _alertService.showToast(
                text: "Succesfully logged out!",
                icon:Icons.check,
                );
                _navigationService.pushReplacementNamed("/login");
              }
            },
            color: Colors.red, 
            icon:const Icon(
              Icons.logout,
            ))],
      ),

      body: _buildUI()    
    );
  }

  Widget _buildUI(){
    return SafeArea(child: Padding(padding:const EdgeInsets.symmetric(
      horizontal: 15.0,
      vertical: 20.0,
    ),
    child: _chatList(),
     ),
    );
  }
  Widget _chatList(){
    return StreamBuilder(
      stream: _databaseService.getUserProfiles(), 
      builder: (context,snapshot){
        if(snapshot.hasError){
          return const Center(
            child: Text("Unable to load data."),
          );
        }

        if (snapshot.hasData && snapshot.data != null) {
          final users = snapshot.data!.docs;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              UserProfile user = users[index].data() as UserProfile;
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0),
                child: ChatTile(
                  userProfile: user,
                  onTap: () async{
                    final ChatExists = await _databaseService.checkChatExists(
                      _authService.user!.uid, 
                      user.uid!,);
                      if(!ChatExists){
                        await _databaseService.createNewChat(
                          _authService.user!.uid, 
                          user.uid!);
                      }
                    _navigationService
                      .push(MaterialPageRoute(builder: (context){
                        return ChatPage(chatUser: user,);
                       }
                      )
                    );
                  }
                ),
              );
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

}
