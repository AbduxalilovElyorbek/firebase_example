import 'package:firebase_example/core/untils/imports.dart';

class Item extends StatelessWidget {
  const Item({
    super.key,
    required this.icon,
    required this.title,
    this.function,
  });
  final String icon;
  final String title;
  final VoidCallback? function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Row(
        children: [
          IconWidget(
            icon: icon,
          ),
          const SizedBox(
            width: 14,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
