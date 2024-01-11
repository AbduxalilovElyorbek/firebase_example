import 'package:firebase_example/core/untils/imports.dart';

class ChatItems extends StatelessWidget {
  const ChatItems({super.key});

  @override
  Widget build(BuildContext context) {
    late File imageFile;
    late String imageUrl;

    Future getImage() async {
      ImagePicker _image = ImagePicker();

      await _image.pickImage(source: ImageSource.camera).then((value) {
        if (value != null) {
          imageFile = File(value.path);
        }
      });
    }

    Future uploadImage() async {
      String fileName = const Uuid().v1();

      var ref =
          FirebaseStorage.instance.ref().child('images').child('$fileName.jpg');

      var send = await ref.putFile(imageFile);

      imageUrl = await send.ref.getDownloadURL();

      print(imageUrl);
    }

    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      padding: const EdgeInsets.all(
        24,
      ),
      height: 400,
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: SvgPicture.asset(
                  AppIcons.close,
                ),
              ),
              Text(
                "Share Content",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                width: 20,
              ),
              Container(
                width: 20,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Item(
            icon: AppIcons.camItem,
            title: "Camera",
            function: () async {
              await getImage();
              await uploadImage();
            },
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          Item(
            icon: AppIcons.medItem,
            title: "Photos",
            function: () async {},
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          Item(
            icon: AppIcons.medItem,
            title: "Videos",
            function: () async {},
          ),
        ],
      ),
    );
  }
}
