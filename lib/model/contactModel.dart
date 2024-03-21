
class Contact {
  final String name;
  final String designation;
  final String mobile;
  final String email;

 const Contact(
      {required this.name,
      required this.designation,
      required this.mobile,
      required this.email});

factory Contact.fromJson(Map<String, dynamic> json){
  return Contact(
    name:json['name'],
    designation: json['designation'],
    mobile: json['mobile'],
    email: json['email']);
}
}
