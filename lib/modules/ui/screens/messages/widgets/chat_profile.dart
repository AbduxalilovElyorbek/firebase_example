import 'package:firebase_example/core/untils/imports.dart';

class ChatProfile extends StatelessWidget {
  const ChatProfile({
    super.key,
    this.isActive,
    this.image,
    this.letter,
    this.function,
  });

  final bool? isActive;
  final String? image;
  final String? letter;
  final VoidCallback? function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: SizedBox(
        height: 52,
        width: 52,
        child: image != null && image != ''
            ? Stack(children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                    image!,
                  ),
                  radius: 50,
                ),
                Positioned(
                  right: 2,
                  bottom: 2,
                  child: isActive != null
                      ? Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(90.0),
                            color: isActive! ? active : grey,
                          ),
                        )
                      : Container(),
                ),
              ])
            : Stack(children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: sendedMessageColor,
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      letter![0],
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 2,
                  bottom: 2,
                  child: isActive != null
                      ? Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(90.0),
                            color: isActive! ? active : grey,
                          ),
                        )
                      : Container(),
                ),
              ]),
      ),
    );
  }
}
