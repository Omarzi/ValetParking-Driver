class MakeScanResponseModel {
  String? message;
  Order? order;

  MakeScanResponseModel({this.message, this.order});

  MakeScanResponseModel.fromJson(Map<String, dynamic> json) {
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
  TimeRange? timeRange;
  String? sId;
  String? user;
  String? garage;
  String? typeOfCar;
  String? date;
  int? duration;
  int? totalPrice;
  String? status;
  String? paymentMethod;
  bool? isPaid;
  String? qrCode;
  bool? startNow;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Order(
      {this.timeRange,
        this.sId,
        this.user,
        this.garage,
        this.typeOfCar,
        this.date,
        this.duration,
        this.totalPrice,
        this.status,
        this.paymentMethod,
        this.isPaid,
        this.qrCode,
        this.startNow,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Order.fromJson(Map<String, dynamic> json) {
    timeRange = json['timeRange'] != null
        ? new TimeRange.fromJson(json['timeRange'])
        : null;
    sId = json['_id'];
    user = json['user'];
    garage = json['garage'];
    typeOfCar = json['typeOfCar'];
    date = json['date'];
    duration = json['duration'];
    totalPrice = json['totalPrice'];
    status = json['status'];
    paymentMethod = json['paymentMethod'];
    isPaid = json['isPaid'];
    qrCode = json['qrCode'];
    startNow = json['startNow'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.timeRange != null) {
      data['timeRange'] = this.timeRange!.toJson();
    }
    data['_id'] = this.sId;
    data['user'] = this.user;
    data['garage'] = this.garage;
    data['typeOfCar'] = this.typeOfCar;
    data['date'] = this.date;
    data['duration'] = this.duration;
    data['totalPrice'] = this.totalPrice;
    data['status'] = this.status;
    data['paymentMethod'] = this.paymentMethod;
    data['isPaid'] = this.isPaid;
    data['qrCode'] = this.qrCode;
    data['startNow'] = this.startNow;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
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
