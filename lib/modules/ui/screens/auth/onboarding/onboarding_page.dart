import 'package:firebase_example/core/untils/imports.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  static const routeName = "onboarding/screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Container(
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
                height: 25.h,
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
                          fontSize: 68.sp,
                        ),
                      ),
                      TextSpan(
                        text: 'easily & \n quickly',
                        style: TextStyle(
                          fontSize: 68.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8.h,
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
                height: 18.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButtonWidget(
                    isBordered: true,
                    icon: AppIcons.facebook,
                    color: white,
                  ),
                  const SizedBox(
                    width: 22,
                  ),
                  IconButtonWidget(
                    isBordered: true,
                    icon: AppIcons.google,
                    color: white,
                  ),
                  const SizedBox(
                    width: 22,
                  ),
                  IconButtonWidget(
                    isBordered: true,
                    icon: AppIcons.appleLight,
                    color: white,
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              OrWidget(
                lineColor: grey,
                textColor: lightGrey,
              ),
              SizedBox(
                height: 30.h,
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
                height: 20.h,
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
                  const SizedBox(
                    width: 3,
                  ),
                  GestureDetector(
                    onTap: () {
                      print("Log in");
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
            ],
          ),
        ),
      ),
    );
  }
}
