
import 'package:igapp/models/ig_leader_model.dart';

import '../Repository/ig_repository.dart';
import '../models/ig_enthu_model.dart';
import '../models/schedule.dart';

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
}