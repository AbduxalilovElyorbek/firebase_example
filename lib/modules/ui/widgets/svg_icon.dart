import 'package:firebase_example/core/untils/imports.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon({
    super.key,
    required this.iconName,
    required this.color,
    required this.size,
    this.function,
  });

  final String iconName;
  final Color color;

  final double size;
  final VoidCallback? function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: SvgPicture.asset(
        iconName,
        colorFilter: ColorFilter.mode(
          color,
          BlendMode.srcIn,
        ),
        height: size,
        width: size,
      ),
    );
  }
}
