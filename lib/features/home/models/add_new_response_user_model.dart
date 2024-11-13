class NewUserResponseModel {
  UserData? userData;
  String? token;

  NewUserResponseModel({this.userData, this.token});

  NewUserResponseModel.fromJson(Map<String, dynamic> json) {
    userData = json['userData'] != null
        ? new UserData.fromJson(json['userData'])
        : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userData != null) {
      data['userData'] = this.userData!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class UserData {
  String? userId;
  String? email;
  String? password;
  String? createdAt;
  String? updatedAt;

  UserData(
      {this.userId, this.email, this.password, this.createdAt, this.updatedAt});

  UserData.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    email = json['email'];
    password = json['password'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['email'] = this.email;
    data['password'] = this.password;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
