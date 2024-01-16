class notificationmodel {
  String? message;
  bool? status;
  List<Notifications>? notifications;

  notificationmodel({this.message, this.status, this.notifications});

  notificationmodel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['notifications'] != null) {
      notifications = <Notifications>[];
      json['notifications'].forEach((v) {
        notifications!.add(new Notifications.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.notifications != null) {
      data['notifications'] =
          this.notifications!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Notifications {
  String? sId;
  String? data;
  String? timeAtCreate;
  int? iV;

  Notifications({this.sId, this.data, this.timeAtCreate, this.iV});

  Notifications.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    data = json['Data'];
    timeAtCreate = json['timeAtCreate'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['Data'] = this.data;
    data['timeAtCreate'] = this.timeAtCreate;
    data['__v'] = this.iV;
    return data;
  }
}
