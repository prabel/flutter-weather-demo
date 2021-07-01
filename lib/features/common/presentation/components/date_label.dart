import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateLabel extends StatelessWidget {
  const DateLabel({
    Key? key,
    required this.dateTime,
    this.textStyle,
    this.dateFormat = 'dd/MM/yyyy, HH:mm',
  }) : super(key: key);

  final int dateTime;
  final String dateFormat;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      DateFormat(dateFormat).format(
        DateTime.fromMillisecondsSinceEpoch(dateTime * 1000),
      ),
      style: textStyle ?? Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.black38),
    );
  }
}
