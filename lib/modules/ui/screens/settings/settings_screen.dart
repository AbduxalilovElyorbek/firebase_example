import 'package:firebase_example/core/untils/imports.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      backgroundColor: dark,
      appBar: AppBar(
        backgroundColor: transparent,
        toolbarHeight: 80.h,
        centerTitle: true,
        title: Text(
          "Settings",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            color: white,
          ),
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
                ),
              ),
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                    ),
                    child: SettingsProfile(
                      title: _user.displayName!,
                      subtitle: _user.email,
                      image: '',
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Divider(
                    color: lightWhite,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
