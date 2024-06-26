import 'package:cloud_firestore/cloud_firestore.dart';

enum MessageType { Text, Image }

class MessageObj {
  String? senderID;
  String? content;
  MessageType? messageType;
  Timestamp? sentAt;

  MessageObj({
    required this.senderID,
    required this.content,
    required this.messageType,
    required this.sentAt,
  });

  MessageObj.fromJson(Map<String, dynamic> json) {
    senderID = json['senderID'];
    content = json['content'];
    sentAt = json['sentAt'];
    messageType = MessageType.values.byName(json['messageType']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['senderID'] = senderID;
    data['content'] = content;
    data['sentAt'] = sentAt;
    data['messageType'] = messageType!.name;
    return data;
  }
}
