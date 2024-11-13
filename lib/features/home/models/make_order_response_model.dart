// class MakeOrderResponseModel {
//   String? message;
//   Order? order;
//
//   MakeOrderResponseModel({this.message, this.order});
//
//   MakeOrderResponseModel.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     order = json['order'] != null ? new Order.fromJson(json['order']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['message'] = this.message;
//     if (this.order != null) {
//       data['order'] = this.order!.toJson();
//     }
//     return data;
//   }
// }
//
// class Order {
//   String? orderId;
//   User? user;
//   Garage? garage;
//   String? typeOfCar;
//   String? date;
//   TimeRange? timeRange;
//   int? totalPrice;
//   int? duration;
//   String? paymentMethod;
//   bool? isPaid;
//   String? status;
//   bool? startNow;
//   String? timeLeft;
//   String? qrCode;
//   String? createdAt;
//   String? updatedAt;
//
//   Order(
//       {this.orderId,
//         this.user,
//         this.garage,
//         this.typeOfCar,
//         this.date,
//         this.timeRange,
//         this.totalPrice,
//         this.duration,
//         this.paymentMethod,
//         this.isPaid,
//         this.status,
//         this.startNow,
//         this.timeLeft,
//         this.qrCode,
//         this.createdAt,
//         this.updatedAt});
//
//   Order.fromJson(Map<String, dynamic> json) {
//     orderId = json['orderId'];
//     user = json['user'] != null ? new User.fromJson(json['user']) : null;
//     garage =
//     json['garage'] != null ? new Garage.fromJson(json['garage']) : null;
//     typeOfCar = json['typeOfCar'];
//     date = json['date'];
//     timeRange = json['timeRange'] != null
//         ? new TimeRange.fromJson(json['timeRange'])
//         : null;
//     totalPrice = json['totalPrice'];
//     duration = json['duration'];
//     paymentMethod = json['paymentMethod'];
//     isPaid = json['isPaid'];
//     status = json['status'];
//     startNow = json['startNow'];
//     timeLeft = json['timeLeft'];
//     qrCode = json['qrCode'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['orderId'] = this.orderId;
//     if (this.user != null) {
//       data['user'] = this.user!.toJson();
//     }
//     if (this.garage != null) {
//       data['garage'] = this.garage!.toJson();
//     }
//     data['typeOfCar'] = this.typeOfCar;
//     data['date'] = this.date;
//     if (this.timeRange != null) {
//       data['timeRange'] = this.timeRange!.toJson();
//     }
//     data['totalPrice'] = this.totalPrice;
//     data['duration'] = this.duration;
//     data['paymentMethod'] = this.paymentMethod;
//     data['isPaid'] = this.isPaid;
//     data['status'] = this.status;
//     data['startNow'] = this.startNow;
//     data['timeLeft'] = this.timeLeft;
//     data['qrCode'] = this.qrCode;
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     return data;
//   }
// }
//
// class User {
//   String? userId;
//   String? name;
//   String? email;
//   String? phone;
//   String? carName;
//   String? carNumber;
//   String? createdAt;
//   String? updatedAt;
//
//   User(
//       {this.userId,
//         this.name,
//         this.email,
//         this.phone,
//         this.carName,
//         this.carNumber,
//         this.createdAt,
//         this.updatedAt});
//
//   User.fromJson(Map<String, dynamic> json) {
//     userId = json['userId'];
//     name = json['name'];
//     email = json['email'];
//     phone = json['phone'];
//     carName = json['carName'];
//     carNumber = json['carNumber'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['userId'] = this.userId;
//     data['name'] = this.name;
//     data['email'] = this.email;
//     data['phone'] = this.phone;
//     data['carName'] = this.carName;
//     data['carNumber'] = this.carNumber;
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     return data;
//   }
// }
//
// class Garage {
//   String? garageId;
//   List<String>? driver;
//   List<String>? subOwner;
//   String? gragename;
//   String? grageDescription;
//   String? grageImages;
//   int? gragePricePerHoure;
//   double? lat;
//   double? lng;
//   String? openDate;
//   String? endDate;
//   bool? active;
//   String? createdAt;
//   String? updatedAt;
//
//   Garage(
//       {this.garageId,
//         this.driver,
//         this.subOwner,
//         this.gragename,
//         this.grageDescription,
//         this.grageImages,
//         this.gragePricePerHoure,
//         this.lat,
//         this.lng,
//         this.openDate,
//         this.endDate,
//         this.active,
//         this.createdAt,
//         this.updatedAt});
//
//   Garage.fromJson(Map<String, dynamic> json) {
//     garageId = json['garageId'];
//     driver = json['driver'].cast<String>();
//     subOwner = json['subOwner'].cast<String>();
//     gragename = json['gragename'];
//     grageDescription = json['grageDescription'];
//     grageImages = json['grageImages'];
//     gragePricePerHoure = json['gragePricePerHoure'];
//     lat = json['lat'];
//     lng = json['lng'];
//     openDate = json['openDate'];
//     endDate = json['endDate'];
//     active = json['active'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['garageId'] = this.garageId;
//     data['driver'] = this.driver;
//     data['subOwner'] = this.subOwner;
//     data['gragename'] = this.gragename;
//     data['grageDescription'] = this.grageDescription;
//     data['grageImages'] = this.grageImages;
//     data['gragePricePerHoure'] = this.gragePricePerHoure;
//     data['lat'] = this.lat;
//     data['lng'] = this.lng;
//     data['openDate'] = this.openDate;
//     data['endDate'] = this.endDate;
//     data['active'] = this.active;
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     return data;
//   }
// }
//
// class TimeRange {
//   String? start;
//   String? end;
//
//   TimeRange({this.start, this.end});
//
//   TimeRange.fromJson(Map<String, dynamic> json) {
//     start = json['start'];
//     end = json['end'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['start'] = this.start;
//     data['end'] = this.end;
//     return data;
//   }
// }



class MakeOrderResponseModel {
  String? message;
  Order? order;

  MakeOrderResponseModel({this.message, this.order});

  MakeOrderResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    order = json['order'] != null ? new Order.fromJson(json['order']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.order != null) {
      data['order'] = this.order!.toJson();
    }
    return data;
  }
}

class Order {
  String? orderId;
  User? user;
  Garage? garage;
  String? typeOfCar;
  String? date;
  TimeRange? timeRange;
  int? totalPrice;
  int? duration;
  String? paymentMethod;
  bool? isPaid;
  String? status;
  bool? startNow;
  String? timeLeft;
  String? qrCode;
  String? createdAt;
  String? updatedAt;

  Order(
      {this.orderId,
        this.user,
        this.garage,
        this.typeOfCar,
        this.date,
        this.timeRange,
        this.totalPrice,
        this.duration,
        this.paymentMethod,
        this.isPaid,
        this.status,
        this.startNow,
        this.timeLeft,
        this.qrCode,
        this.createdAt,
        this.updatedAt});

  Order.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    garage =
    json['garage'] != null ? new Garage.fromJson(json['garage']) : null;
    typeOfCar = json['typeOfCar'];
    date = json['date'];
    timeRange = json['timeRange'] != null
        ? new TimeRange.fromJson(json['timeRange'])
        : null;
    totalPrice = json['totalPrice'];
    duration = json['duration'];
    paymentMethod = json['paymentMethod'];
    isPaid = json['isPaid'];
    status = json['status'];
    startNow = json['startNow'];
    timeLeft = json['timeLeft'];
    qrCode = json['qrCode'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.garage != null) {
      data['garage'] = this.garage!.toJson();
    }
    data['typeOfCar'] = this.typeOfCar;
    data['date'] = this.date;
    if (this.timeRange != null) {
      data['timeRange'] = this.timeRange!.toJson();
    }
    data['totalPrice'] = this.totalPrice;
    data['duration'] = this.duration;
    data['paymentMethod'] = this.paymentMethod;
    data['isPaid'] = this.isPaid;
    data['status'] = this.status;
    data['startNow'] = this.startNow;
    data['timeLeft'] = this.timeLeft;
    data['qrCode'] = this.qrCode;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class User {
  String? userId;
  String? email;
  String? createdAt;
  String? updatedAt;

  User({this.userId, this.email, this.createdAt, this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    email = json['email'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['email'] = this.email;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Garage {
  String? garageId;
  List<String>? driver;
  List<String>? subOwner;
  String? gragename;
  String? grageDescription;
  String? grageImages;
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
        this.driver,
        this.subOwner,
        this.gragename,
        this.grageDescription,
        this.grageImages,
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
    driver = json['driver'].cast<String>();
    subOwner = json['subOwner'].cast<String>();
    gragename = json['gragename'];
    grageDescription = json['grageDescription'];
    grageImages = json['grageImages'];
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
    data['driver'] = this.driver;
    data['subOwner'] = this.subOwner;
    data['gragename'] = this.gragename;
    data['grageDescription'] = this.grageDescription;
    data['grageImages'] = this.grageImages;
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

class TimeRange {
  String? start;
  String? end;

  TimeRange({this.start, this.end});

  TimeRange.fromJson(Map<String, dynamic> json) {
    start = json['start'];
    end = json['end'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start'] = this.start;
    data['end'] = this.end;
    return data;
  }
}



// import 'package:valetparking_driver/features/home/models/user_data_model.dart';
//
// class MakeOrderResponseModel {
//   String? message;
//   Order? order;
//
//   MakeOrderResponseModel({this.message, this.order});
//
//   MakeOrderResponseModel.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     order = json['order'] != null ? new Order.fromJson(json['order']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['message'] = this.message;
//     if (this.order != null) {
//       data['order'] = this.order!.toJson();
//     }
//     return data;
//   }
// }
//
// class Order {
//   TimeRange? timeRange;
//   String? sId;
//   UserDataModel? user;
//   Garage? garage;
//   String? typeOfCar;
//   String? date;
//   int? duration;
//   int? totalPrice;
//   String? status;
//   String? paymentMethod;
//   String? qrCode;
//   bool? startNow;
//   String? createdAt;
//   String? updatedAt;
//   int? iV;
//
//   Order(
//       {this.timeRange,
//         this.sId,
//         this.user,
//         this.garage,
//         this.typeOfCar,
//         this.date,
//         this.duration,
//         this.totalPrice,
//         this.status,
//         this.paymentMethod,
//         this.qrCode,
//         this.startNow,
//         this.createdAt,
//         this.updatedAt,
//         this.iV});
//
//   Order.fromJson(Map<String, dynamic> json) {
//     timeRange = json['timeRange'] != null
//         ? new TimeRange.fromJson(json['timeRange'])
//         : null;
//     sId = json['_id'];
//     user = json['user'] != null ? new UserDataModel.fromJson(json['user']) : null;
//     garage =
//     json['garage'] != null ? new Garage.fromJson(json['garage']) : null;
//     typeOfCar = json['typeOfCar'];
//     date = json['date'];
//     duration = json['duration'];
//     totalPrice = json['totalPrice'];
//     status = json['status'];
//     paymentMethod = json['paymentMethod'];
//     qrCode = json['qrCode'];
//     startNow = json['startNow'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     iV = json['__v'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.timeRange != null) {
//       data['timeRange'] = this.timeRange!.toJson();
//     }
//     data['_id'] = this.sId;
//     if (this.user != null) {
//       data['user'] = this.user!.toJson();
//     }
//     if (this.garage != null) {
//       data['garage'] = this.garage!.toJson();
//     }
//     data['typeOfCar'] = this.typeOfCar;
//     data['date'] = this.date;
//     data['duration'] = this.duration;
//     data['totalPrice'] = this.totalPrice;
//     data['status'] = this.status;
//     data['paymentMethod'] = this.paymentMethod;
//     data['qrCode'] = this.qrCode;
//     data['startNow'] = this.startNow;
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     data['__v'] = this.iV;
//     return data;
//   }
// }
//
// class TimeRange {
//   String? start;
//   String? end;
//
//   TimeRange({this.start, this.end});
//
//   TimeRange.fromJson(Map<String, dynamic> json) {
//     start = json['start'];
//     end = json['end'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['start'] = this.start;
//     data['end'] = this.end;
//     return data;
//   }
// }
//
// // class User {
// //   String? sId;
// //   String? username;
// //   String? email;
// //   String? password;
// //   String? phone;
// //   String? profileImage;
// //   String? carName;
// //   String? carNumber;
// //   String? carImage;
// //   List<Null>? saved;
// //   String? role;
// //   String? createdAt;
// //   String? updatedAt;
// //   int? iV;
// //   bool? passwordResetVerified;
// //   int? wallet;
// //
// //   User(
// //       {this.sId,
// //         this.username,
// //         this.email,
// //         this.password,
// //         this.phone,
// //         this.profileImage,
// //         this.carName,
// //         this.carNumber,
// //         this.carImage,
// //         this.saved,
// //         this.role,
// //         this.createdAt,
// //         this.updatedAt,
// //         this.iV,
// //         this.passwordResetVerified,
// //         this.wallet});
// //
// //   User.fromJson(Map<String, dynamic> json) {
// //     sId = json['_id'];
// //     username = json['username'];
// //     email = json['email'];
// //     password = json['password'];
// //     phone = json['phone'];
// //     profileImage = json['profileImage'];
// //     carName = json['carName'];
// //     carNumber = json['carNumber'];
// //     carImage = json['carImage'];
// //     if (json['saved'] != null) {
// //       saved = <Null>[];
// //       json['saved'].forEach((v) {
// //         saved!.add(new Null.fromJson(v));
// //       });
// //     }
// //     role = json['role'];
// //     createdAt = json['createdAt'];
// //     updatedAt = json['updatedAt'];
// //     iV = json['__v'];
// //     passwordResetVerified = json['passwordResetVerified'];
// //     wallet = json['wallet'];
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['_id'] = this.sId;
// //     data['username'] = this.username;
// //     data['email'] = this.email;
// //     data['password'] = this.password;
// //     data['phone'] = this.phone;
// //     data['profileImage'] = this.profileImage;
// //     data['carName'] = this.carName;
// //     data['carNumber'] = this.carNumber;
// //     data['carImage'] = this.carImage;
// //     if (this.saved != null) {
// //       data['saved'] = this.saved!.map((v) => v.toJson()).toList();
// //     }
// //     data['role'] = this.role;
// //     data['createdAt'] = this.createdAt;
// //     data['updatedAt'] = this.updatedAt;
// //     data['__v'] = this.iV;
// //     data['passwordResetVerified'] = this.passwordResetVerified;
// //     data['wallet'] = this.wallet;
// //     return data;
// //   }
// // }
//
// class Garage {
//   List<String>? garageImages;
//   String? sId;
//   String? gragename;
//   String? grageDescription;
//   String? grageImages;
//   int? gragePricePerHoure;
//   double? lat;
//   double? lng;
//   String? openDate;
//   String? endDate;
//   bool? active;
//   List<String>? driver;
//   List<String>? subOwner;
//   String? createdAt;
//   String? updatedAt;
//   int? iV;
//
//   Garage(
//       {this.garageImages,
//         this.sId,
//         this.gragename,
//         this.grageDescription,
//         this.grageImages,
//         this.gragePricePerHoure,
//         this.lat,
//         this.lng,
//         this.openDate,
//         this.endDate,
//         this.active,
//         this.driver,
//         this.subOwner,
//         this.createdAt,
//         this.updatedAt,
//         this.iV});
//
//   Garage.fromJson(Map<String, dynamic> json) {
//     garageImages = json['garageImages'].cast<String>();
//     sId = json['_id'];
//     gragename = json['gragename'];
//     grageDescription = json['grageDescription'];
//     grageImages = json['grageImages'];
//     gragePricePerHoure = json['gragePricePerHoure'];
//     lat = json['lat'];
//     lng = json['lng'];
//     openDate = json['openDate'];
//     endDate = json['endDate'];
//     active = json['active'];
//     driver = json['driver'].cast<String>();
//     subOwner = json['subOwner'].cast<String>();
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     iV = json['__v'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['garageImages'] = this.garageImages;
//     data['_id'] = this.sId;
//     data['gragename'] = this.gragename;
//     data['grageDescription'] = this.grageDescription;
//     data['grageImages'] = this.grageImages;
//     data['gragePricePerHoure'] = this.gragePricePerHoure;
//     data['lat'] = this.lat;
//     data['lng'] = this.lng;
//     data['openDate'] = this.openDate;
//     data['endDate'] = this.endDate;
//     data['active'] = this.active;
//     data['driver'] = this.driver;
//     data['subOwner'] = this.subOwner;
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     data['__v'] = this.iV;
//     return data;
//   }
// }
//
//
// // class MakeOrderResponseModel {
// //   String? message;
// //   Order? order;
// //
// //   MakeOrderResponseModel({this.message, this.order});
// //
// //   MakeOrderResponseModel.fromJson(Map<String, dynamic> json) {
// //     message = json['message'];
// //     order = json['order'] != null ? new Order.fromJson(json['order']) : null;
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['message'] = this.message;
// //     if (this.order != null) {
// //       data['order'] = this.order!.toJson();
// //     }
// //     return data;
// //   }
// // }
// //
// // class Order {
// //   String? user;
// //   String? garage;
// //   String? typeOfCar;
// //   String? date;
// //   TimeRange? timeRange;
// //   int? duration;
// //   int? totalPrice;
// //   String? status;
// //   String? paymentMethod;
// //   String? qrCode;
// //   bool? startNow;
// //   String? sId;
// //   String? createdAt;
// //   String? updatedAt;
// //   int? iV;
// //
// //   Order(
// //       {this.user,
// //         this.garage,
// //         this.typeOfCar,
// //         this.date,
// //         this.timeRange,
// //         this.duration,
// //         this.totalPrice,
// //         this.status,
// //         this.paymentMethod,
// //         this.qrCode,
// //         this.startNow,
// //         this.sId,
// //         this.createdAt,
// //         this.updatedAt,
// //         this.iV});
// //
// //   Order.fromJson(Map<String, dynamic> json) {
// //     user = json['user'];
// //     garage = json['garage'];
// //     typeOfCar = json['typeOfCar'];
// //     date = json['date'];
// //     timeRange = json['timeRange'] != null
// //         ? new TimeRange.fromJson(json['timeRange'])
// //         : null;
// //     duration = json['duration'];
// //     totalPrice = json['totalPrice'];
// //     status = json['status'];
// //     paymentMethod = json['paymentMethod'];
// //     qrCode = json['qrCode'];
// //     startNow = json['startNow'];
// //     sId = json['_id'];
// //     createdAt = json['createdAt'];
// //     updatedAt = json['updatedAt'];
// //     iV = json['__v'];
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['user'] = this.user;
// //     data['garage'] = this.garage;
// //     data['typeOfCar'] = this.typeOfCar;
// //     data['date'] = this.date;
// //     if (this.timeRange != null) {
// //       data['timeRange'] = this.timeRange!.toJson();
// //     }
// //     data['duration'] = this.duration;
// //     data['totalPrice'] = this.totalPrice;
// //     data['status'] = this.status;
// //     data['paymentMethod'] = this.paymentMethod;
// //     data['qrCode'] = this.qrCode;
// //     data['startNow'] = this.startNow;
// //     data['_id'] = this.sId;
// //     data['createdAt'] = this.createdAt;
// //     data['updatedAt'] = this.updatedAt;
// //     data['__v'] = this.iV;
// //     return data;
// //   }
// // }
// //
// // class TimeRange {
// //   String? start;
// //   String? end;
// //
// //   TimeRange({this.start, this.end});
// //
// //   TimeRange.fromJson(Map<String, dynamic> json) {
// //     start = json['start'];
// //     end = json['end'];
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['start'] = this.start;
// //     data['end'] = this.end;
// //     return data;
// //   }
// // }