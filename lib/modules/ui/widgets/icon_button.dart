import 'package:firebase_example/core/untils/imports.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
    super.key,
    required this.icon,
    required this.color,
    required this.isBordered,
    this.function,
    this.iconColor,
  });
  final String icon;
  final Color color;
  final bool isBordered;
  final VoidCallback? function;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        width: 48,
        height: 48,
        decoration: isBordered
            ? BoxDecoration(
                border: Border.all(
                  color: color,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(50),
              )
            : BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(50),
              ),
        child: Center(
          child: SvgPicture.asset(
            icon,
          ),
        ),
      ),
    );
  }
}
