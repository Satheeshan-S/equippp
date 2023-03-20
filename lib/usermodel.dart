
class MyData {
  String name;
  String gender;
  int age;
  int phone;
  String status;
  String explain;
  String description;
  String skills;
  String Url;
  bool verify;

  MyData(
      {required this.name,
        required this.gender,
        required this.age,
        required this.phone,
        required this.status,
        required this.explain,
        required this.description,
        required this.skills,
        required this.Url, required  this.verify});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'gender': gender,
      'age': age,
      'phone': phone,
      'status': status,
      'explain': explain,
      'description': description,
      'skills': skills,
      'Url':Url,
      'verify':verify,
    };
  }
}