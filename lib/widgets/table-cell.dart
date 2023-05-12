import 'package:flutter/material.dart';

import 'package:mtm/constants/Theme.dart';

class TableCellSettings extends StatelessWidget {
  final String title;
  final Function? onTap;
  TableCellSettings({required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap as void Function()?,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(color: Colors.black)),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child:
                  Icon(Icons.arrow_forward_ios, color: Colors.black, size: 14),
            )
          ],
        ),
      ),
    );
  }
}
