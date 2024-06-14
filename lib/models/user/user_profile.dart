class UserProfile {
  String? uid;
  String? name;
  String? pfpURL;
  String? role;

  UserProfile({
    this.uid,
    this.name,
    this.pfpURL,
    this.role,
  });

  UserProfile.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    pfpURL = json['pfpURL'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['name'] = name;
    data['pfpURL'] = pfpURL;
    data['role'] = role;
    return data;
  }
}
