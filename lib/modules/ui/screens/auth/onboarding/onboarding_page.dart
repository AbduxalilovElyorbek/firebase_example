import 'package:firebase_example/core/untils/imports.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  static const routeName = "onboarding/screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [0.1, 0.2, 0.6, 0.9],
                colors: [
                  dark,
                  purple,
                  dark,
                  dark,
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).padding.top + 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppIcons.logo),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      "Chatbox",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 46.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 24,
                  ),
                  child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Connect \nfriends\n',
                          style: TextStyle(
                            fontSize: 55.sp,
                          ),
                        ),
                        TextSpan(
                          text: 'easily & \nquickly',
                          style: TextStyle(
                            fontSize: 55.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 14.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 24,
                  ),
                  child: Text(
                    "Our chat app is the perfect way to stay \nconnected with friends and family.",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: lightGrey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButtonWidget(
                      isBordered: true,
                      icon: AppIcons.facebook,
                      color: white,
                    ),
                    SizedBox(
                      width: 22.w,
                    ),
                    IconButtonWidget(
                      isBordered: true,
                      icon: AppIcons.google,
                      color: white,
                    ),
                    SizedBox(
                      width: 22.w,
                    ),
                    IconButtonWidget(
                      icon: AppIcons.appleLight,
                      isBordered: true,
                      color: white,
                    ),
                  ],
                ),
                const Spacer(),
                OrWidget(
                  lineColor: grey,
                  textColor: lightGrey,
                ),
                SizedBox(
                  height: 18.h,
                ),
                Center(
                  child: ButtonWidget(
                    text: "Sign up withn mail",
                    textColor: dark,
                    isLoading: false,
                    backgroundColor: white,
                    onPressed: () {
                      Navigator.of(context).pushNamed(SignUpPage.routeName);
                    },
                  ),
                ),
                SizedBox(
                  height: 18.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Existing account?",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: lightGrey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          SignInPage.routeName,
                        );
                      },
                      child: Text(
                        "Log in",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).padding.top + 10.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
