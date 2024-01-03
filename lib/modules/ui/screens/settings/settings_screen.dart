import 'package:firebase_example/core/untils/imports.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark,
      appBar: AppBar(
        backgroundColor: transparent,
        toolbarHeight: 100,
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
      body: Expanded(
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
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: SettingsProfile(),
              ),
              const SizedBox(
                height: 20,
              ),
              Divider(
                color: lightWhite,
              )
            ],
          ),
        ),
      ),
    );
  }
}
