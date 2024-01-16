class articlemodel {
  String? message;
  bool? status;
  List<Articles>? articles;

  articlemodel({this.message, this.status, this.articles});

  articlemodel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['articles'] != null) {
      articles = <Articles>[];
      json['articles'].forEach((v) {
        articles!.add(new Articles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.articles != null) {
      data['articles'] = this.articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Articles {
  String? sId;
  String? data;
  String? department;
  String? timeAtCreate;
  int? iV;

  Articles({this.sId, this.data, this.department, this.timeAtCreate, this.iV});

  Articles.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    data = json['Data'];
    department = json['Department'];
    timeAtCreate = json['timeAtCreate'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['Data'] = this.data;
    data['Department'] = this.department;
    data['timeAtCreate'] = this.timeAtCreate;
    data['__v'] = this.iV;
    return data;
  }
}
