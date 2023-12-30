import 'package:firebase_example/core/untils/imports.dart';
import 'package:firebase_example/modules/ui/screens/search/search_page.dart';

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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        toolbarHeight: 70,
        backgroundColor: transparent,
        title: Column(
          children: [
            const SizedBox(
              height: 17,
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
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: white,
                  ),
                ),
                Avatar(
                  size: 44,
                  function: () {
                    // Navigator.pushNamed(context, ProfilePage.routeName);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => ProfilePage(
                    //       userName: user.displayName!,
                    //       userEmail: user.email!,
                    //       userNumber: user.phoneNumber,
                    //     ),
                    //   ),
                    // );
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
            margin: const EdgeInsets.only(
              top: 40,
              bottom: 30,
            ),
            height: 82,
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
                  const SizedBox(
                    height: 14,
                  ),
                  Center(
                    child: Container(
                      height: 3,
                      width: 30,
                      decoration: BoxDecoration(
                        color: lightGrey,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
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
