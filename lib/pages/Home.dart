import 'package:flutter/material.dart';
import 'package:world_clock/components/TimezoneListWidget.dart';
import 'package:world_clock/lib/Template.dart';
import 'package:world_clock/services/TimezoneService.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Template.color.primary,
      appBar: AppBar(
        backgroundColor: Template.color.dark,
        actions: [
          Expanded(
              flex: 1,
              child: Image.asset('assets/word_clock.png', width: 20,)
          ),
          Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextField(
                  onChanged: (value){
                    TimezoneService().getListBySearch(value);
                  },
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide:  BorderSide(color: Colors.white, width: 1),
                    ),
                    hintText: 'Digite uma região',
                    hintStyle: TextStyle(
                      color: Template.color.light,
                    ),
                  ),
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.bottom,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
          )
        ],
      ),
      body: const TimezoneListWidget(),
    );
  }
}
