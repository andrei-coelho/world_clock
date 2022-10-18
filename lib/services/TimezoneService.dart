
import 'package:world_clock/lib/Request.dart';
import 'package:world_clock/model/TimezoneItem.dart';
import 'package:world_clock/model/TimezoneData.dart';


class TimezoneService {

  static final TimezoneService _instance = TimezoneService._init();
  List<TimezoneItem> timezones = [];
  static Function? callback;

  factory TimezoneService(){
    return _instance;
  }

  TimezoneService._init(){
    // verifica se a lista está salva no banco interno
    // e gere os objetos
  }

  static void setListener(Function f){
    callback = f;
  }

  Future<TimezoneData> getItem(String slug) async {
    final response = await Request().get("timezone/$slug");
    return TimezoneData(response['datetime']);
  }

  Future<List<TimezoneItem>> getList() async{

    if(timezones.isEmpty){
      List list = await Request().get('timezone');
      list.asMap().forEach((k, el) {
        timezones.add(TimezoneItem(k, el));
      });
      // salva a lista em um banco de dados interno
    }

    return timezones;

  }

  void getListBySearch(String search) {

    List<TimezoneItem> nova = [];

    timezones.forEach((n) {
      if(n.nome.toLowerCase().contains(search.toLowerCase())){
        nova.add(n);
      }
    });

    if(callback != null){
      callback!(nova);
    }

  }


}