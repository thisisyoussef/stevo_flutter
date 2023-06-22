class User {
  String? firstName;
  String? lastName;
  String email;
  String role;
  String id;

  User({
    this.firstName,
    this.lastName,
    required this.email,
    required this.role,
    required this.id,
  });

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'role': role,
      'id': id,
    };
  }

  //Default constructor
  User.empty()
      : firstName = "",
        lastName = "",
        email = "",
        role = "",
        id = "";

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      role: json['role'],
      id: json['_id'],
    );
  }

  //Helper function to update the user's information
  void updateUserInfo({
    String? firstName,
    String? lastName,
    String? email,
    String? role,
  }) {
    if (firstName != null) {
      this.firstName = firstName;
    }
    if (lastName != null) {
      this.lastName = lastName;
    }
    if (email != null) {
      this.email = email;
    }
    if (role != null) {
      this.role = role;
    }
  }
}
