import 'package:my_app/models/user/massage.dart';

class Chat {
  String? id;
  List<String>? participants;
  List<MessageObj>? messages;

  Chat({
    required this.id,
    required this.participants,
    required this.messages,
  });

  Chat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    participants = List<String>.from(json['participants']);
    messages = List<MessageObj>.from(
      json['messages'].map((m) => MessageObj.fromJson(m))
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['participants'] = participants;
    data['messages'] = messages?.map((m) => m.toJson()).toList() ?? [];
    return data;
  }
}
