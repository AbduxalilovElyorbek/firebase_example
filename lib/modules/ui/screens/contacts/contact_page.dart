import 'package:firebase_example/core/untils/imports.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark,
      appBar: AppBar(
        toolbarHeight: 100.h,
        centerTitle: true,
        backgroundColor: transparent,
        title: Column(
          children: [
            SizedBox(
              height: 16.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 50.w,
                ),
                Text(
                  "Contacts",
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
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
        ),
        decoration: BoxDecoration(
          color: white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(
              height: 24.h,
            ),
            Text(
              "My Contact",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            const Expanded(
              child: Contacts(),
            ),
          ],
        ),
      ),
    );
  }
}
