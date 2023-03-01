class UserModel {
  final String name;
  final String status;
  final String interest;

  UserModel({required this.name, required this.status, required this.interest});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      status: map['status'] ?? '',
      interest: map['interest'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "status": status,
      "interest": interest,
    };
  }
}
