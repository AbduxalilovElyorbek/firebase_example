import 'package:firebase_example/core/untils/imports.dart';

class EditItem extends StatelessWidget {
  const EditItem({
    super.key,
    required this.title,
    required this.controller,
  });
  final String title;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        TextField(
          controller: controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            isDense: true,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
          ),
        ),
      ],
    );
  }
}
