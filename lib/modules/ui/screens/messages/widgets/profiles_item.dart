import 'package:firebase_example/core/untils/imports.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.text,
    this.image,
  });

  final String text;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Column(
        children: [
          image != null && image != ''
              ? CircleAvatar(
                  backgroundImage: AssetImage(image!),
                  maxRadius: 58,
                )
              : Container(
                  height: 58,
                  width: 58,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: sendedMessageColor,
                  ),
                  child: Center(
                    child: Text(
                      text[0],
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
          const SizedBox(
            height: 8,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: white,
            ),
          ),
        ],
      ),
    );
  }
}
