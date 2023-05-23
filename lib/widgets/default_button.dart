import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manty_nomer_1/theme/app_colors.dart';
import 'package:manty_nomer_1/theme/app_text_styles.dart';
import 'package:manty_nomer_1/widgets/app_indicator.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    this.text,
    this.color = AppColors.colore20912Red,
    required this.onPress,
    Key? key,
    this.width = double.infinity,
    this.isLoading = false,
    this.padding = 14.0,
    this.height = 56,
    this.radius = 20,
    this.textStyle,
    this.child,
    this.isNotFullColor,
  }) : super(key: key);

  final double? width;
  final double height;
  final double padding;
  final Color color;
  final Color? isNotFullColor;
  final double radius;
  final bool isLoading;
  final TextStyle? textStyle;
  final String? text;
  final Function() onPress;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: isLoading ? null : onPress,
      child: Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(
            color: color,
          ),
        ),
        child: isLoading
            ? const AppIndicator(color: Colors.white)
            : child ??
                Text(
                  text!,
                  textAlign: TextAlign.center,
                  style: textStyle ??
                      AppTextStyles.s17W600(
                        color: Colors.white,
                      ),
                ),
      ),
    );
  }
}
