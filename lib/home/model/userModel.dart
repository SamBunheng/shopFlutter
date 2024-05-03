class UserModel {
  final String firstname;
  final String lastname;
  final int age;
 UserModel({
    required this.firstname, 
    required this.lastname, 
    required this.age, 
  });
  Map<String, dynamic> fromJson() {
    return ({
      'first name': firstname,
      'last name': lastname,
      'age': age,
    });
  }
}
