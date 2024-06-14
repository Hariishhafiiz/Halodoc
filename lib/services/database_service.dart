import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/models/user/user_profile.dart';
import 'package:my_app/services/auth_service.dart';
import 'package:my_app/models/user/chat.dart';
import 'package:my_app/models/user/massage.dart'; // Perbaikan: Mengimpor model Message yang benar
import 'package:my_app/utils/utils.dart';

class DatabaseService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  late AuthService _authService;
  final GetIt _getIt = GetIt.instance;

  CollectionReference<UserProfile>? _usersCollection;
  CollectionReference<Chat>? _chatCollection;
  CollectionReference<Chat>? _doctorChatCollection;

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

    _doctorChatCollection =
        _firebaseFirestore.collection('doctor_chats').withConverter<Chat>(
              fromFirestore: (snapshots, _) => Chat.fromJson(snapshots.data()!),
              toFirestore: (chat, _) => chat.toJson(),
            );
  }

  Future<void> createUserProfile({required UserProfile userProfile}) async {
    // Add default role to user
    userProfile.role = "user";
    await _usersCollection?.doc(userProfile.uid).set(userProfile);
  }

  Stream<QuerySnapshot<UserProfile>> getUserProfiles() {
    return _usersCollection!
        .where("uid", isNotEqualTo: _authService.user!.uid)
        .snapshots();
  }

  Future<UserProfile> getDoctor() {
    return _usersCollection!
        .where("role", isEqualTo: "doctor")
        .get()
        .then((value) => value.docs.first.data());
  }

  Future<bool> checkChatExists(String uid1, String uid2) async {
    String chatID = generateChatID(uid1: uid1, uid2: uid2);
    final result = await _chatCollection?.doc(chatID).get();
    if (result != null) {
      return result.exists;
    }
    return false;
  }

  Future<bool> checkDoctorChatExists(String uid1, String uid2) async {
    String chatID = generateChatID(uid1: uid1, uid2: uid2);
    final result = await _doctorChatCollection?.doc(chatID).get();
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

  Future<void> createNewDoctorChat(String uid1, String uid2) async {
    String chatID = generateChatID(uid1: uid1, uid2: uid2);
    final docRef = _doctorChatCollection!.doc(chatID);
    final chat = Chat(
      id: chatID,
      participants: [uid1, uid2],
      messages: [],
    );
    await docRef.set(chat);
  }

  Future<void> sendChatMessage(String uid1, String uid2, MessageObj message) async {
    String chatID = generateChatID(uid1: uid1, uid2: uid2);
    final docRef = _chatCollection!.doc(chatID);

    // Menggunakan FieldValue.arrayUnion untuk menambahkan pesan ke array messages
    await docRef.update({
      "messages": FieldValue.arrayUnion([message.toJson()])
    });
  }

  Future<void> sendDoctorChatMessage(String uid1, String uid2, MessageObj message) async {
    String chatID = generateChatID(uid1: uid1, uid2: uid2);
    final docRef = _doctorChatCollection!.doc(chatID);

    // Menggunakan FieldValue.arrayUnion untuk menambahkan pesan ke array messages
    await docRef.update({
      "messages": FieldValue.arrayUnion([message.toJson()])
    });
  }

  Stream getChatData(String uid1, String uid2) {
    String chatID = generateChatID(uid1: uid1, uid2: uid2);
    return _chatCollection?.doc(chatID).snapshots() as Stream<DocumentSnapshot<Chat>>;
  }

  Stream getDoctorChatData(String uid1, String uid2) {
    String chatID = generateChatID(uid1: uid1, uid2: uid2);
    return _doctorChatCollection?.doc(chatID).snapshots()
        as Stream<DocumentSnapshot<Chat>>;
  }

  // New method to get the current authenticated user's profile
  Future<UserProfile?> getCurrentUserProfile() async {
    final currentUser = _authService.user;
    if (currentUser != null) {
      final doc = await _usersCollection?.doc(currentUser.uid).get();
      return doc?.data();
    }
    return null;
  }
}
