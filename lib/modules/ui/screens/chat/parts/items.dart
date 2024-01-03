import 'package:firebase_example/core/untils/imports.dart';

class ChatItems extends StatelessWidget {
  const ChatItems({super.key});

  static String imageUrl = '';
  static String imagePath = '';

  @override
  Widget build(BuildContext context) {
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
              IconButtonWidget(
                icon: AppIcons.close,
                color: transparent,
                isBordered: true,
                function: () {
                  Navigator.pop(context);
                },
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
              final image = ImagePicker();
              XFile? file = await image.pickImage(
                source: ImageSource.camera,
              );

              Reference ref = FirebaseStorage.instance.ref();
              Reference imageRef = ref.child('images/');

              Reference upload = imageRef.child(file!.name);

              try {
                await upload.putFile(
                  File(file.path),
                );

                print(file.path + '   path');
                imageUrl = await upload.getDownloadURL();

                imagePath = file.path;
              } catch (e) {}
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
            function: () async {
              final image = ImagePicker();
              XFile? file = await image.pickImage(
                source: ImageSource.gallery,
              );

              Reference ref = FirebaseStorage.instance.ref();
              Reference imageRef = ref.child('images/');

              Reference upload = imageRef.child(file!.name);

              try {
                upload.putFile(
                  File(file.path),
                );
                imagePath = file.path;
              } catch (e) {}
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
            title: "Videos",
            function: () async {
              final image = ImagePicker();
              XFile? file = await image.pickVideo(
                source: ImageSource.gallery,
              );

              Reference ref = FirebaseStorage.instance.ref();
              Reference imageRef = ref.child('videos/');

              Reference upload = imageRef.child(file!.name);

              try {
                await upload.putFile(
                  File(file.path),
                );
              } catch (e) {}
            },
          ),
        ],
      ),
    );
  }
}
