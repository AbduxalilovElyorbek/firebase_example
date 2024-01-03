import 'package:firebase_example/core/untils/imports.dart';

class SettingsProfile extends StatelessWidget {
  const SettingsProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Avatar(
          size: 60,
          function: () {},
          user: FirebaseAuth.instance.currentUser!.displayName!,
        ),
        const SizedBox(
          width: 12,
        ),
        Text(
          FirebaseAuth.instance.currentUser!.displayName!,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
