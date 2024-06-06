import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:rekmed/model/user/user_profile.dart';
import 'package:rekmed/service/auth_service.dart';
import 'package:rekmed/model/user/chat.dart';
import 'package:rekmed/model/user/massage.dart'; 
import 'package:rekmed/utils/utils.dart';

class DatabaseService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  late AuthService _authService;  
  final GetIt _getIt = GetIt.instance;

  CollectionReference<UserProfile>? _usersCollection;
  CollectionReference<Chat>? _chatCollection;

  DatabaseService() {
    _authService = _getIt.get<AuthService>();
    _setupCollectionReference();
  }

  void _setupCollectionReference() {
    _usersCollection = _firebaseFirestore.collection('users').withConverter<UserProfile>(
      fromFirestore: (snapshots, _) => UserProfile.fromJson(snapshots.data()!),
      toFirestore: (userProfile, _) => userProfile.toJson(),
    );

    _chatCollection = _firebaseFirestore.collection('chats').withConverter<Chat>(
      fromFirestore: (snapshots, _) => Chat.fromJson(snapshots.data()!),
      toFirestore: (chat, _) => chat.toJson(),
    );
  }

  Future<void> createUserProfile({required UserProfile userProfile}) async {
    await _usersCollection?.doc(userProfile.uid).set(userProfile);
  }

  Stream<QuerySnapshot<UserProfile>> getUserProfiles() {
    return _usersCollection!
        .where("uid", isNotEqualTo: _authService.user!.uid)
        .snapshots();
  }

  Future<bool> checkChatExists(String uid1, String uid2) async {
    String chatID = generateChatID(uid1: uid1, uid2: uid2);
    final result = await _chatCollection?.doc(chatID).get();
    if (result != null) {
      return result.exists; 
    }
    return false;
  }

  Future<void> createNewChat(String uid1, String uid2) async {
    String chatID = generateChatID(uid1: uid1, uid2: uid2);
    final docRef = _chatCollection!.doc(chatID);
    final chat = Chat(
      id: chatID,
      participants: [uid1, uid2],
      messages: [],
    );
    await docRef.set(chat);
  }

  Future<void> sendChatMessage(
    String uid1,
    String uid2,
    Message message
  ) async {
    String chatID = generateChatID(uid1: uid1, uid2: uid2);
    final docRef = _chatCollection!.doc(chatID);

    // Menggunakan FieldValue.arrayUnion untuk menambahkan pesan ke array messages
    await docRef.update({
      "messages": FieldValue.arrayUnion([message.toJson()])
    });
  }

  Stream getChatData(String uid1 , String uid2){
    String chatID = generateChatID(uid1: uid1, uid2: uid2);
    return _chatCollection?.doc(chatID).snapshots() 
      as Stream<DocumentSnapshot<Chat>>;
  }
}
