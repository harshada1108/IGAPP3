class schedulemodel {
  String? message;
  bool? status;
  List<Schedules>? schedules;

  schedulemodel({this.message, this.status, this.schedules});

  schedulemodel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['schedules'] != null) {
      schedules = <Schedules>[];
      json['schedules'].forEach((v) {
        schedules!.add(new Schedules.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.schedules != null) {
      data['schedules'] = this.schedules!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Schedules {
  String? sId;
  String? team1;
  String? team2;
  String? venue;
  String? gameName;
  String? winner;
  String? date;
  String? time;
  String? timeAtCreate;
  int? iV;

  Schedules(
      {this.sId,
        this.team1,
        this.team2,
        this.venue,
        this.gameName,
        this.winner,
        this.date,
        this.time,
        this.timeAtCreate,
        this.iV});

  Schedules.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    team1 = json['Team1'];
    team2 = json['Team2'];
    venue = json['Venue'];
    gameName = json['GameName'];
    winner = json['Winner'];
    date = json['Date'];
    time = json['Time'];
    timeAtCreate = json['timeAtCreate'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['Team1'] = this.team1;
    data['Team2'] = this.team2;
    data['Venue'] = this.venue;
    data['GameName'] = this.gameName;
    data['Winner'] = this.winner;
    data['Date'] = this.date;
    data['Time'] = this.time;
    data['timeAtCreate'] = this.timeAtCreate;
    data['__v'] = this.iV;
    return data;
  }
}
