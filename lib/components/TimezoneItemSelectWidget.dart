import 'package:flutter/material.dart';
import 'package:world_clock/lib/Template.dart';
import 'package:world_clock/model/TimezoneData.dart';
import 'package:world_clock/model/TimezoneItem.dart';
import 'package:world_clock/services/TimezoneService.dart';

class TimezoneItemSelectWidget extends StatefulWidget {

  final TimezoneItem item;

  const TimezoneItemSelectWidget(this.item, {Key? key}) : super(key: key);

  @override
  State<TimezoneItemSelectWidget> createState() => _TimezoneItemSelectWidgetState();

}

class _TimezoneItemSelectWidgetState extends State<TimezoneItemSelectWidget> {

  TimezoneData? timezone;
  String time = "";
  String data = "";

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    timezone = await TimezoneService().getItem(widget.item.nome);
    changeSeconds();
  }

  void changeSeconds() async {
    while(true){
      await Future.delayed(const Duration(seconds: 1));
      if(timezone != null){
        setState(() {
          time = timezone!.getTime();
          data = timezone!.getData();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Template.color.dark,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text("Horário Local",
              style: TextStyle(
                color: Template.color.light,
                fontSize: 20
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Text(time, style: const TextStyle(
              color: Colors.white,
              fontSize: 50
            ),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text("Data",
              style: TextStyle(
                  color: Template.color.light,
                  fontSize: 20
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Text(data, style: const TextStyle(
              color: Colors.white,
              fontSize: 30
          ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
