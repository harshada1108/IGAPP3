class imagemodel {
  String? sId;
  String? description;
  String? cloudinaryId;
  String? imageUrl;
  int? iV;

  imagemodel(
      {this.sId, this.description, this.cloudinaryId, this.imageUrl, this.iV});

  imagemodel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    description = json['description'];
    cloudinaryId = json['cloudinaryId'];
    imageUrl = json['imageUrl'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['description'] = this.description;
    data['cloudinaryId'] = this.cloudinaryId;
    data['imageUrl'] = this.imageUrl;
    data['__v'] = this.iV;
    return data;
  }
}
