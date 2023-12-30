import 'package:firebase_example/core/untils/imports.dart';
import 'package:firebase_example/modules/ui/screens/chat/widgets/item.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class ChatItems extends StatelessWidget {
  const ChatItems({super.key});

  @override
  Widget build(BuildContext context) {
    String imageUrl = '';

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
      height: 320,
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
              const Text(
                "Share Content",
                style: TextStyle(
                  fontSize: 16,
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

              Reference upload = imageRef.child('${file!.name}');

              try {
                upload.putFile(
                  File(file.path),
                );
                imageUrl = await upload.getDownloadURL();
              } catch (e) {
                print(e);
              }
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
          ),
        ],
      ),
    );
  }
}
