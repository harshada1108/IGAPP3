
import 'package:igapp/models/ig_leader_model.dart';

import '../Repository/ig_repository.dart';
import '../models/ig_enthu_model.dart';
import '../models/schedule.dart';
import 'package:igapp/models/notificationmodel.dart';
import 'package:igapp/models/article_model.dart';
import 'package:igapp/models/imagemodel.dart';

class  IgViewModel{

  final _repo = IgRepository();


  Future<igmodel> fetchIgApi() async{
    final response= await _repo.fetchIgApi();
    return response;
  }
  Future<igleadermodel> fetchIgleaderApi() async{
    final response= await _repo.fetchIgleaderApi();
    return response;
  }
  Future<schedulemodel> fetchIgscheduleApi(String date) async{
    final response= await _repo.fetchIgscheduleApi(date);
    return response;
  }
  Future<notificationmodel> fetchIgnotificationApi() async{
    final response= await _repo.fetchIgnotificationApi();
    return response;
  }
  Future<articlemodel> fetchIgarticleApi() async{
    final response= await _repo.fetchIgarticleApi();
    return response;
  }
  Future<imagemodel> fetchIgimageApi() async{
    final response= await _repo.fetchIgimageApi();
    return response;
  }
}