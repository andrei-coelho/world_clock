import 'package:flutter/material.dart';
import 'package:world_clock/model/TimezoneItem.dart';
import 'package:world_clock/lib/Template.dart';
import 'package:world_clock/pages/Selected.dart';

class TimezoneItemWidget extends StatefulWidget {

  final TimezoneItem item;

  const TimezoneItemWidget(this.item, {Key? key}) : super(key: key);

  @override
  State<TimezoneItemWidget> createState() => _TimezoneItemWidgetState();
}

class _TimezoneItemWidgetState extends State<TimezoneItemWidget> {

  var _iconFav = Icons.favorite_border_outlined;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Template.color.primary,
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: TextButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SelectedItem(widget.item),
                  ),
                );
              },
              child: Text(
                widget.item.nome,
                style: const TextStyle(
                  color: Colors.white
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: (){
                setState(() {
                  _iconFav = Icons.favorite;
                });
              },
              child: Icon( _iconFav, color: Colors.white, ),
            )
          )
        ],
      ),
    );
  }
}
