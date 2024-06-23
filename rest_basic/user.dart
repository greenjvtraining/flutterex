class User{
  final String name;
  final int age;
  final String msg;

  User({required this.name, required this.age, required this.msg});

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      name: json['name'],
      age: json['age'],
      msg: json['msg'],
    );
  }
}