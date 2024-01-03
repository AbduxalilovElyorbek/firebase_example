import 'package:firebase_example/core/untils/imports.dart';


class Chat extends StatefulWidget {
  static const routeName = "chat/screen";

  const Chat({
    super.key,
  });

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  late TextEditingController _messageController;
  late String name;
  late String getterUid;

  late ScrollController _controller;

  @override
  void initState() {
    _messageController = TextEditingController();
    _controller = ScrollController();

    super.initState();

    if (_controller.hasClients) {
      _controller.animateTo(
        _controller.position.maxScrollExtent,
        duration: const Duration(seconds: 2),
        curve: Curves.fastOutSlowIn,
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Map argument = ModalRoute.of(context)!.settings.arguments as Map;

    name = argument['name'];
    getterUid = argument['getterUid'];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            AppIcons.back,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ChatProfile(
              isActive: false,
              letter: name,
              function: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(
                      userName: name,
                      userEmail: 'user.email!',
                      userNumber: 'user.phoneNumber',
                      uid: getterUid,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: dark,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  "Active now",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              AppIcons.callIcon,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              AppIcons.video,
            ),
          ),
        ],
      ),
      body: BlocConsumer<MessagesBloc, MessagesState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: Messages(
                  getterName: name,
                  getterUid: getterUid,
                  controller: _controller,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom + 16,
                  left: 24,
                  right: 24,
                ),
                width: double.maxFinite,
                child: Row(
                  children: [
                    SvgIcon(
                      iconName: AppIcons.clip,
                      color: dark,
                      size: 24,
                      function: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => const ChatItems(),
                        );
                      },
                    ),
                    const SizedBox(
                      width: 11,
                    ),
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          setState(() {});
                        },
                        onTapOutside: (e) {
                          setState(() {
                            FocusManager.instance.primaryFocus?.unfocus();
                          });
                        },
                        controller: _messageController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 14,
                          ),
                          hintText: 'Write your message',
                          fillColor: lightWhite,
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(10),
                            child: SvgIcon(
                              iconName: AppIcons.copy,
                              color: grey,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    _messageController.text != ''
                        ? InkWell(
                            onTap: () {
                              if (_messageController.text != '') {
                                context.read<MessagesBloc>().add(
                                      SendMessage(
                                        getterUid: getterUid,
                                        message: _messageController.text,
                                        getterName: name,
                                      ),
                                    );

                                _messageController.clear();

                                _controller.animateTo(
                                  _controller.position.maxScrollExtent,
                                  duration: const Duration(seconds: 2),
                                  curve: Curves.fastOutSlowIn,
                                );
                              }
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: green,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: SvgIcon(
                                iconName: AppIcons.send,
                                color: white,
                                size: 24,
                              ),
                            ),
                          )
                        : Row(
                            children: [
                              SvgIcon(
                                iconName: AppIcons.camera,
                                color: dark,
                                size: 24,
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              SvgIcon(
                                iconName: AppIcons.audio,
                                color: dark,
                                size: 24,
                              ),
                            ],
                          ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}