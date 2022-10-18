
class TimezoneData {

  int ano = 0;
  int mes = 0;
  int dia = 0;

  int hours = 0;
  int minutes = 0;
  int seconds = 0;

  TimezoneData(String src){

    RegExp reg = RegExp(r"(\d{4})-(\d{2})-(\d{2})T(\d{2}):(\d{2}):(\d{2})");
    final match = reg.firstMatch(src);

    if(match != null){

      ano = int.parse("${match.group(1)}");
      mes = int.parse("${match.group(2)}");
      dia = int.parse("${match.group(3)}");

      hours   = int.parse("${match.group(4)}");
      minutes = int.parse("${match.group(5)}");
      seconds = int.parse("${match.group(6)}");

    }

  }

  void addSecond(){
    if(seconds == 59) {
      seconds = 0;
      return addMinute();
    } seconds++;
  }

  void addMinute(){
    if(minutes == 59){
      minutes = 0;
      return addHour();
    } minutes++;
  }

  void addHour(){
    if(hours == 23){
      hours = 0;
      return;
    } hours++;
  }

  String getTime(){
    addSecond();
    var h = hours < 10 ? "0${hours}" : hours;
    var n = minutes < 10 ? "0${minutes}" : minutes;
    var s = seconds < 10 ? "0${seconds}" : seconds;
    return "$h:$n:$s";
  }

  String getData(){
    var d = dia < 10 ? "0${dia}" : dia;
    var m = mes < 10 ? "0${mes}" : mes;
    return "$d/$m/$ano";
  }

}