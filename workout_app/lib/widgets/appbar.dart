import 'package:flutter/material.dart';

class AdatpativeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String _title;

  AdatpativeAppBar(this._title);

  @override
  Size get preferredSize {
    return const Size.fromHeight(54.0);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xff3c505e),
      title: Text(_title, style: TextStyle(color: Color(0xff489b9b))),
      //centerTitle: true,
      actions: [
        PopupMenuButton(
            onSelected: (item) => _onSelected(context, item as int),
            itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 0,
                    child: Text('Add content'),
                  ),
                  PopupMenuItem(
                    value: 1,
                    child: Text('Remove content'),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Text('Modify content'),
                  ),
                ])
      ],
    );
  }

  void _onSelected(BuildContext context, int item) {
    print('you selected option $item');
  }
}
