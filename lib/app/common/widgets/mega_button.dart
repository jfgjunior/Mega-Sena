import 'package:flutter/material.dart';
import 'package:flutter_lottery/res/colors.dart';
import 'package:flutter_lottery/res/styles.dart';

class MegaButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function onPressed;

  MegaButton({
    this.label,
    this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) => FlatButton.icon(
        color: onPressed == null ? Colors.grey : AppColors.buttonColor,
        onPressed: onPressed == null ? () {} : onPressed,
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        label: Text(
          label,
          style: Styles.subtitleTextStyle.copyWith(color: Colors.white),
        ),
      );
}
