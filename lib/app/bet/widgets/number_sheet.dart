import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lottery/app/common/widgets/luck_ball.dart';
import 'package:flutter_lottery/res/strings.dart';
import 'package:flutter_lottery/res/styles.dart';

class NumberSheet extends StatefulWidget {
  final int totalNumbers = 60;

  @override
  _NumberSheetState createState() => _NumberSheetState();
}

class _NumberSheetState extends State<NumberSheet> {
  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Strings.doYourBet,
              style: Styles.primaryTextStyle.copyWith(fontSize: 25.0),
            ),
            Wrap(
              children: List<int>.generate(widget.totalNumbers, (i) => i + 1)
                  .map((value) => _buildNumber(value))
                  .toList(),
            ),
          ],
        ),
      );

  Widget _buildNumber(int position) => Padding(
        padding: EdgeInsets.only(left: 4.0, top: 4.0, right: 4.0),
        child: LuckBall(
          number: position,
        ),
      );
}
