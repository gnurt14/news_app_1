class User {
  final String email;
  final String fullName;
  final String imagePath;
  final List<String> savedList;
  final String uid;

  User({
    required this.email,
    required this.fullName,
    required this.imagePath,
    required this.savedList,
    required this.uid,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      fullName: json['fullName'],
      imagePath: json['imagePath'],
      savedList: List<String>.from(json['savedList']),
      uid: json['uid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'fullName': fullName,
      'imagePath': imagePath,
      'savedList': savedList,
      'uid': uid,
    };
  }
}
