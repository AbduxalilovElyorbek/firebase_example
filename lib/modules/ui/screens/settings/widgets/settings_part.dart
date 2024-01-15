import 'package:firebase_example/core/untils/imports.dart';

class SettingsProfile extends StatelessWidget {
  const SettingsProfile({
    super.key,
    required this.image,
    required this.title,
    required this.function,
    this.subtitle,
  });
  final String image;
  final String title;
  final String? subtitle;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Avatar(
              size: 60,
              function: () {},
              image: image != '' ? image : null,
              user: title[0],
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                subtitle != null
                    ? Text(
                        subtitle!,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    : Container(),
              ],
            ),
          ],
        ),
        IconButton(
          onPressed: function,
          icon: SvgPicture.asset(
            AppIcons.edit,
            colorFilter: ColorFilter.mode(
              grey,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }
}
