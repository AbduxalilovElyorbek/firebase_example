import 'package:firebase_example/core/untils/imports.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({
    super.key,
    required this.icon,
    this.funtion,
  });
  final String icon;
  final VoidCallback? funtion;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: funtion ?? () {},
      child: Container(
        margin: const EdgeInsets.all(3),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(
            color: grey,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        height: 44,
        width: 44,
        child: Center(
          child: SvgPicture.asset(
            icon,
          ),
        ),
      ),
    );
  }
}
