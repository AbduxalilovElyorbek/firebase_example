import 'package:firebase_example/core/untils/imports.dart';

class InputWidget extends StatelessWidget {
  const InputWidget(
      {super.key,
      required this.text,
      this.isPassword,
      this.controller,
      this.validators});
  final String text;
  final bool? isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validators;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: green,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          inputFormatters: [
            FilteringTextInputFormatter.deny(RegExp(r'\s')), // Deny spaces
          ],
          controller: controller,
          obscureText: isPassword ?? false,
          decoration: InputDecoration(
            isDense: true,
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: lineColor,
              ),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: red,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: lightGrey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
