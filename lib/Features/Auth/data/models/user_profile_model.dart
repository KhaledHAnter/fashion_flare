class UserProfileModel {
  final String name, gender, email, city, height, weight, age;

  UserProfileModel({
    required this.name,
    required this.gender,
    required this.email,
    required this.city,
    required this.age,
    required this.height,
    required this.weight,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      name: json['name'],
      gender: json['gender'],
      email: json['email'],
      city: json['city'],
      age: json['age'],
      height: json['height'],
      weight: json['weight'],
    );
  }
}
