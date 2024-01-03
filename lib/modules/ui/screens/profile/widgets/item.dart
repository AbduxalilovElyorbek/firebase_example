import 'package:firebase_example/core/untils/imports.dart';

class ItemProfile extends StatelessWidget {
  const ItemProfile({
    super.key,
    this.text,
    required this.title,
  });
  final String title;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: lightWhite,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            text!,
            style: TextStyle(
              color: dark,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
