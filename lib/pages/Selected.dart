import 'package:flutter/material.dart';
import 'package:world_clock/model/TimezoneItem.dart';
import 'package:world_clock/lib/Template.dart';
import 'package:world_clock/components/TimezoneItemSelectWidget.dart';

class SelectedItem extends StatefulWidget {

  TimezoneItem item;

  SelectedItem(this.item, {Key? key}) : super(key: key);

  @override
  State<SelectedItem> createState() => _SelectedItemState();
}

class _SelectedItemState extends State<SelectedItem> {

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final iconFav = !widget.item.fav ?
      Icons.favorite_border_outlined :
      Icons.favorite;

    return Scaffold(
      backgroundColor: Template.color.primary,
      appBar: AppBar(
        backgroundColor: Template.color.dark,
        actions: [
          const Spacer(),
          Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text(
                  widget.item.nome,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
          ),
          Expanded(
              flex: 1,
              child: TextButton(
                onPressed: (){},
                child: Icon( iconFav , color: Colors.white,),
              )
          ),
        ],
      ),
      body: TimezoneItemSelectWidget(widget.item),
    );
  }
}
