import 'package:flutter/material.dart';
import 'package:newsapp/model/Source.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({Key? key, required this.source, required this.icon, required this.onPressed}) : super(key: key);

  final Source source;
  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        height: 40,
        child: Row(
          children: [
            Icon(icon, size: 19, color: Colors.white,),
            const SizedBox(width: 40,),
            Text('${source.category}: ${source.name}', style: const TextStyle(fontSize: 19, color: Colors.white),)
          ],
        ),
      ),
    );
  }
}
