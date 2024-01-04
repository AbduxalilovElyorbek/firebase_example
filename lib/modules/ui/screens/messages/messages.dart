import 'package:firebase_example/core/untils/imports.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({
    super.key,
  });
  static const routeName = "message/screen";

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        toolbarHeight: 60.w,
        backgroundColor: transparent,
        title: Column(
          children: [
            SizedBox(
              height: 12.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconWidget(
                  icon: AppIcons.search,
                  funtion: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchPage(),
                      ),
                    );
                  },
                ),
                Text(
                  "Home",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: white,
                  ),
                ),
                Avatar(
                  size: 44,
                  function: () async {
                    await FirebaseAuth.instance.signOut();
                  },
                  user: user.displayName!,
                )
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 20.h,
              bottom: 30.h,
            ),
            height: 100,
            width: double.infinity,
            child: Profiles(),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  )),
              child: Column(
                children: [
                  SizedBox(
                    height: 14.h,
                  ),
                  Center(
                    child: Container(
                      height: 3.h,
                      width: 30.w,
                      decoration: BoxDecoration(
                        color: lightGrey,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  const Expanded(
                    child: ChatList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
