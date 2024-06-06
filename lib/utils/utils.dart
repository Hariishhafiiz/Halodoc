import 'package:rekmed/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rekmed/service/alert_service.dart';
import 'package:rekmed/service/auth_service.dart';
import 'package:get_it/get_it.dart';
import 'package:rekmed/service/database_service.dart';
import 'package:rekmed/service/media_service.dart';
import 'package:rekmed/service/navigation_service.dart';
import 'package:rekmed/service/storage_service.dart';




Future<void> setupFirebase() async {
  await Firebase.initializeApp(
    options : DefaultFirebaseOptions.currentPlatform,
  );
}

Future<void> registerService() async{
  final GetIt getIt = GetIt.instance;
  getIt.registerSingleton<AuthService>(
    AuthService(),
  );
  getIt.registerSingleton<NavigationService>(
    NavigationService(),
  );
  getIt.registerSingleton<AlertService>(
    AlertService(),
  );
  getIt.registerSingleton<MediaService>(
    MediaService(),
  );
  getIt.registerSingleton<StorageService>(
    StorageService(),
  );
  getIt.registerSingleton<DatabaseService>(
    DatabaseService(),
  );

}

String generateChatID({required String uid1, required String uid2}){
  List uids=[uid1,uid2];
  uids.sort();
  String chatID= uids.fold("",(id,uid)=>"$id$uid");
  return chatID;
}