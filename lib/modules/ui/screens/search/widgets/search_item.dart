import 'package:firebase_example/core/untils/imports.dart';

class SearchItemWidget extends StatelessWidget {
  const SearchItemWidget({
    super.key,
    required this.userName,
  });
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 8,
      ),
      child: Row(
        children: [
          Avatar(
            user: userName,
            size: 52.sp,
            function: () {},
          ),
          SizedBox(
            width: 12.w,
          ),
          Text(
            userName,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
