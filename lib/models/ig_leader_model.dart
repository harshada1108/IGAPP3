class igleadermodel {
  String? message;
  bool? status;
  Points? points;

  igleadermodel({this.message, this.status, this.points});

  igleadermodel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    points =
    json['points'] != null ? new Points.fromJson(json['points']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.points != null) {
      data['points'] = this.points!.toJson();
    }
    return data;
  }
}

class Points {
  String? sId;
  int? cSE;
  int? eCE;
  int? eEE;
  int? mECH;
  int? cIVIL;
  int? cHEMMIN;
  int? mETA;
  int? aRCHI;
  int? iV;

  Points(
      {this.sId,
        this.cSE,
        this.eCE,
        this.eEE,
        this.mECH,
        this.cIVIL,
        this.cHEMMIN,
        this.mETA,
        this.aRCHI,
        this.iV});

  Points.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    cSE = json['CSE'];
    eCE = json['ECE'];
    eEE = json['EEE'];
    mECH = json['MECH'];
    cIVIL = json['CIVIL'];
    cHEMMIN = json['CHEMMIN'];
    mETA = json['META'];
    aRCHI = json['ARCHI'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['CSE'] = this.cSE;
    data['ECE'] = this.eCE;
    data['EEE'] = this.eEE;
    data['MECH'] = this.mECH;
    data['CIVIL'] = this.cIVIL;
    data['CHEMMIN'] = this.cHEMMIN;
    data['META'] = this.mETA;
    data['ARCHI'] = this.aRCHI;
    data['__v'] = this.iV;
    return data;
  }
}
