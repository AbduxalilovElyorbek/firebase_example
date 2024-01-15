import 'package:firebase_example/core/untils/imports.dart';

class ChatItems extends StatelessWidget {
  static String routeName = 'chat/item';
  const ChatItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MessagesBloc, MessagesState>(
      listener: (context, state) {},
      builder: (context, state) {
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
                function: () {
                  context.read<MessagesBloc>().add(
                        SendImage(
                          isCamera: true,
                        ),
                      );
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
                function: () {
                  context.read<MessagesBloc>().add(
                        SendImage(
                          isCamera: false,
                        ),
                      );
                },
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        );
      },
    );
  }
}
