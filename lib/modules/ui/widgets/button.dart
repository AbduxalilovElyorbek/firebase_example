import 'package:firebase_example/core/untils/imports.dart';
import 'package:flutter/cupertino.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.text,
    required this.textColor,
    required this.backgroundColor,
    this.onPressed,
    required this.isLoading,
  });
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          disabledBackgroundColor: backgroundColor,
          backgroundColor: backgroundColor,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(
              16,
            ),
          ),
        ),
        child: isLoading
            ? CupertinoActivityIndicator.partiallyRevealed(
                color: white,
              )
            : Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),
              ),
      ),
    );
  }
}
