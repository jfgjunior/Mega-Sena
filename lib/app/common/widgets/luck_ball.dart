import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lottery/app/bet/bet_storage.dart';
import 'package:flutter_lottery/res/colors.dart';
import 'package:flutter_lottery/res/styles.dart';
import 'package:provider/provider.dart';

class LuckBall extends StatefulWidget {
  final int number;
  final bool isEnabled;
  final bool mutable;

  LuckBall({this.number, this.isEnabled = false, this.mutable = true});

  @override
  _LuckBallState createState() => _LuckBallState();
}

class _LuckBallState extends State<LuckBall> {
  bool _isEnabled;
  BetStorage get homeStorage => Provider.of<BetStorage>(context, listen: false);

  @override
  void initState() {
    super.initState();
    _isEnabled = widget.isEnabled;
  }

  Color get _backgroundColor => _isEnabled
      ? AppColors.ballActiveBackground
      : AppColors.ballInactiveBackground;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: _onClick,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _backgroundColor,
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              widget.number.toString().padLeft(2, '0'),
              style: Styles.numberStyle,
            ),
          ),
        ),
      );

  void _onClick() {
    setState(
      () {
        if (!widget.mutable) return;
        _isEnabled = homeStorage.selectNumber(widget.number);
      },
    );
  }
}
