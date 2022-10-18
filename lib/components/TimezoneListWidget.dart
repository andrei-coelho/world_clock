import 'package:flutter/material.dart';
import 'package:world_clock/components/TimezoneItemWidget.dart';
import 'package:world_clock/lib/Request.dart';

import '../model/TimezoneItem.dart';
import '../services/TimezoneService.dart';

class TimezoneListWidget extends StatefulWidget {

  const TimezoneListWidget({Key? key}) : super(key: key);

  @override
  State<TimezoneListWidget> createState() => _ListTimezoneWidgetState();

}

class _ListTimezoneWidgetState extends State<TimezoneListWidget> {

  List<TimezoneItem> timezones = [];

  void _setList() async {
    List<TimezoneItem> lista = await TimezoneService().getList();
    setState(() {
      timezones = lista;
      TimezoneService.setListener((listb){
        setState(() {
          timezones = listb;
        });
      });
    });
  }

  @override
  void initState() {
    _setList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> finalList = [];

    timezones.forEach((item) => finalList.add(TimezoneItemWidget(item)));

    return ListView(
      children: finalList,
    );

  }


}
