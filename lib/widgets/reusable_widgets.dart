import 'package:flutter/material.dart';

Text headline6Text(BuildContext context,
    {required String text, Color? color, bool boldText = false}) {
  return Text(
    text,
    style: Theme.of(context).textTheme.headline6!.copyWith(
        color: color ?? Colors.white,
        fontWeight: boldText ? FontWeight.w600 : FontWeight.normal),
  );
}

Text headline5Text(BuildContext context,
    {required String text, Color? color}) {
  return Text(
    text,
    style: Theme.of(context).textTheme.headline5!.copyWith(
          color: color ?? Colors.white,
          fontWeight: FontWeight.w600,
        ),
  );
}

Text subtitleText(BuildContext context, {required String text, Color? color}) {
  return Text(
    text,
    style: Theme.of(context).textTheme.subtitle1!.copyWith(
          color: color ?? Colors.white,
          fontWeight: FontWeight.w600,
        ),
  );
}
