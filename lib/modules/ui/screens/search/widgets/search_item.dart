import 'package:firebase_example/core/untils/imports.dart';

class SearchItemWidget extends StatelessWidget {
  const SearchItemWidget({
    super.key,
    required this.userName,
  });
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 8,
      ),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Avatar(
                  user: userName,
                  size: 52,
                  function: () {},
                ),
                const SizedBox(
                  width: 12,
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
          ],
        ),
      ),
    );
  }
}
