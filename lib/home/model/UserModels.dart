class UserModels{
  String? firstname;
  String? lastname;
  int? age;


  UserModels({
    this.firstname,
    this.lastname,
    this.age,
  });

   UserModels.fromJson(Map<String, dynamic> json){
    firstname = json['first name'];
    lastname = json['last name'];
    age = json['age'];
}
}
 