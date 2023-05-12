import 'package:flutter/material.dart';

class TitleRow extends StatelessWidget {
  final String? title;
  final EdgeInsetsGeometry? padding;
  final Function? onTap;
  bool? showAll;

  TitleRow(this.title, {this.padding, this.onTap, this.showAll});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ListTile(
      contentPadding: padding ?? EdgeInsets.zero,
      title: Text(
        title!,
        style: theme.textTheme.subtitle1!
            .copyWith(color: Colors.black87, fontWeight: FontWeight.bold),
      ),
      trailing: (showAll == true)
          ? MaterialButton(
              child: Text(
                "VER TODOS",
                style: theme.textTheme.headline6!
                    .copyWith(color: Colors.black45, fontSize: 14),
              ),
              onPressed: onTap as void Function()?,
            )
          : SizedBox(),
    );
  }
}
