import 'package:firebase_example/constants/colors/colors.dart';
import 'package:firebase_example/constants/icons/icons.dart';
import 'package:firebase_example/modules/ui/screens/auth/sign_in/sign_in_page.dart';

import 'package:firebase_example/modules/ui/screens/auth/sign_up/sign_up_page.dart';
import 'package:firebase_example/modules/ui/widgets/button.dart';
import 'package:firebase_example/modules/ui/widgets/icon_button.dart';
import 'package:firebase_example/modules/ui/widgets/or.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  static const routeName = "onboarding/screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
              height: MediaQuery.of(context).padding.top + 20,
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
                    fontSize: 14,
                    color: white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 46,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
              ),
              child: RichText(
                textAlign: TextAlign.left,
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Connect \nfriends\n',
                      style: TextStyle(
                        fontSize: 68,
                      ),
                    ),
                    TextSpan(
                      text: 'easily & \n quickly',
                      style: TextStyle(
                        fontSize: 68,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
              ),
              child: Text(
                "Our chat app is the perfect way to stay \nconnected with friends and family.",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16,
                  color: lightGrey,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 38,
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
            const SizedBox(
              height: 30,
            ),
            OrWidget(
              lineColor: grey,
              textColor: lightGrey,
            ),
            const SizedBox(
              height: 30,
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
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Existing account?",
                  style: TextStyle(
                    fontSize: 14,
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
                      fontSize: 14,
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
    );
  }
}
