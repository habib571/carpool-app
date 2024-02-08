
class User {
  int? id;
  String? uid;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? age;
  String? miniBio;
  String? carModel; 
  String? gender ; 
  bool? mailVerified ; 
  String? picture ; 

  User({
    this.id,
    this.uid,
    this.age,
    this.miniBio,
    this.carModel,
    this.email,
    this.firstName,
    this.lastName,
    this.phoneNumber, 
    this.gender, 
    this.mailVerified ,
    this.picture
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ,
      uid: json['user_id'],
      firstName: json['first_name'],
      lastName: json['last_name']?? '',
      email: json['email'] ??'',
      phoneNumber: json['phone_number'] ?? '',
      age: json['age'] ?? '',
      miniBio: json['mini_bio'] ??'',
      carModel: json['owned_car_model'] ?? '' ,
      gender: json['gender'] ?? '' , 
      mailVerified: json['email_verified'] ?? false  , 
     picture:  json['profile_picture']
    );
  }
}
