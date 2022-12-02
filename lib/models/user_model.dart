class UserModel {
  late int id;
  late String? fullname;
  late String? email;
  late String? age;
  late String? password;
  late String? phonenumber;
  late String? profilePhotoUrl;
  late String? token;

  UserModel(
    this.id,
    this.fullname,
    this.email,
    this.password,
    this.age,
    this.phonenumber,
    this.profilePhotoUrl,
    this.token,
  );

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    email = json['email'];
    password = json['password'];
    age = json['age'];
    phonenumber = json['phonenumber'];
    profilePhotoUrl = json['profile_photo_url'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullname': fullname,
      'email': email,
      'password': password,
      'age': age,
      'phonenumber': phonenumber,
      'profile_photo_url': profilePhotoUrl,
      'token': token,
    };
  }
}
