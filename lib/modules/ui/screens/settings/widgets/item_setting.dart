import 'package:firebase_example/core/untils/imports.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    super.key,
    required this.title,
    required this.functions,
  });
  final String title;
  final List<Widget> functions;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      children: functions,
    );
  }
}
