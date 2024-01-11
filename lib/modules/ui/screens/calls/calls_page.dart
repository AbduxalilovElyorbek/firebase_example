import 'package:firebase_example/core/untils/imports.dart';

class CallsPage extends StatelessWidget {
  const CallsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark,
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        backgroundColor: transparent,
        title: Column(
          children: [
            const SizedBox(
              height: 17,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 50.w,
                ),
                Text(
                  "Calls",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: white,
                  ),
                ),
                IconWidget(
                  icon: AppIcons.search,
                  funtion: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchPage(
                          isContacts: true,
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
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
                    child: Calls(),
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
