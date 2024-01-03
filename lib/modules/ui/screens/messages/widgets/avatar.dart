import 'package:firebase_example/core/untils/imports.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    required this.size,
    required this.function,
    required this.user,
    this.image,
  });

  final double size;
  final VoidCallback function;
  final String? image;
  final String user;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: function,
        child: image != null && image != ''
            ? Image.asset(
                AppImages.avatar,
                height: size,
                width: size,
              )
            : Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: sendedMessageColor,
                ),
                height: size,
                width: size,
                child: Center(
                  child: Text(
                    user[0],
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ));
  }
}
