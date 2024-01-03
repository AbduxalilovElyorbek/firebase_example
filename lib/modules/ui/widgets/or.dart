import 'package:firebase_example/core/untils/imports.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({
    super.key,
    required this.lineColor,
    required this.textColor,
  });

  final Color lineColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 132,
            height: 1,
            color: lineColor,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Text(
              "OR",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: textColor,
              ),
            ),
          ),
          Container(
            width: 132,
            height: 1,
            color: lineColor,
          ),
        ],
      ),
    );
  }
}
