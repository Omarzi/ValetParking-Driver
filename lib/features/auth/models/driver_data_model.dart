class DriverDataModel {
  String? message;
  AdminData? adminData;
  String? token;

  DriverDataModel({this.message, this.adminData, this.token});

  DriverDataModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    adminData = json['adminData'] != null
        ? new AdminData.fromJson(json['adminData'])
        : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.adminData != null) {
      data['adminData'] = this.adminData!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class AdminData {
  String? adminId;
  String? email;
  double? lat;
  double? lng;
  int? salary;
  String? role;
  Garage? garage;
  String? createdAt;
  String? updatedAt;

  AdminData(
      {this.adminId,
        this.email,
        this.lat,
        this.lng,
        this.salary,
        this.role,
        this.garage,
        this.createdAt,
        this.updatedAt});

  AdminData.fromJson(Map<String, dynamic> json) {
    adminId = json['adminId'];
    email = json['email'];
    lat = json['lat'];
    lng = json['lng'];
    salary = json['salary'];
    role = json['role'];
    garage =
    json['garage'] != null ? new Garage.fromJson(json['garage']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adminId'] = this.adminId;
    data['email'] = this.email;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['salary'] = this.salary;
    data['role'] = this.role;
    if (this.garage != null) {
      data['garage'] = this.garage!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Garage {
  String? garageId;
  List<String>? garageImages;
  String? gragename;
  String? grageDescription;
  int? gragePricePerHoure;
  double? lat;
  double? lng;
  String? openDate;
  String? endDate;
  bool? active;
  String? createdAt;
  String? updatedAt;

  Garage(
      {this.garageId,
        this.garageImages,
        this.gragename,
        this.grageDescription,
        this.gragePricePerHoure,
        this.lat,
        this.lng,
        this.openDate,
        this.endDate,
        this.active,
        this.createdAt,
        this.updatedAt});

  Garage.fromJson(Map<String, dynamic> json) {
    garageId = json['garageId'];
    garageImages = json['garageImages'].cast<String>();
    gragename = json['gragename'];
    grageDescription = json['grageDescription'];
    gragePricePerHoure = json['gragePricePerHoure'];
    lat = json['lat'];
    lng = json['lng'];
    openDate = json['openDate'];
    endDate = json['endDate'];
    active = json['active'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['garageId'] = this.garageId;
    data['garageImages'] = this.garageImages;
    data['gragename'] = this.gragename;
    data['grageDescription'] = this.grageDescription;
    data['gragePricePerHoure'] = this.gragePricePerHoure;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['openDate'] = this.openDate;
    data['endDate'] = this.endDate;
    data['active'] = this.active;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
