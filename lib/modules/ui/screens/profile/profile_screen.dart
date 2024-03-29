import 'package:firebase_example/core/untils/imports.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = "profile/screen";

  const ProfilePage({
    super.key,
    this.image,
    required this.userName,
    required this.userEmail,
    required this.uid,
    this.userAddress,
    this.userNumber,
  });
  final String? image;
  final String uid;
  final String userName;
  final String userEmail;
  final String? userAddress;
  final String? userNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark.withOpacity(0.4),
      appBar: AppBar(
        backgroundColor: transparent,
        automaticallyImplyLeading: false,
        leading: IconButtonWidget(
          icon: AppIcons.back,
          color: transparent,
          isBordered: true,
          function: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 12.h,
          ),
          Center(
            child: Column(
              children: [
                image != null && image != ''
                    ? CircleAvatar(
                        backgroundImage: AssetImage(image!),
                        maxRadius: 82,
                      )
                    : Container(
                        height: 82,
                        width: 82,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: sendedMessageColor,
                        ),
                        child: Center(
                          child: Text(
                            userName[0],
                            style: TextStyle(
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  userName,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: white,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  userEmail,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(),
              IconButtonWidget(
                icon: AppIcons.whiteMessaging,
                color: darkGreen,
                isBordered: false,
                function: () {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(
                    context,
                    Chat.routeName,
                    arguments: {
                      'name': userName,
                      'getterUid': uid,
                    },
                  );
                },
              ),
              IconButtonWidget(
                icon: AppIcons.whiteCall,
                color: darkGreen,
                isBordered: false,
                function: () {},
              ),
              IconButtonWidget(
                icon: AppIcons.whiteVideoCall,
                color: darkGreen,
                isBordered: false,
                function: () {},
              ),
              IconButtonWidget(
                icon: AppIcons.more,
                color: darkGreen,
                isBordered: false,
                function: () {},
              ),
              const SizedBox(),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(24),
              width: double.infinity,
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
                  ItemProfile(
                    title: 'Display Name',
                    text: userName,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ItemProfile(
                    title: 'Email Address',
                    text: userEmail,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ItemProfile(
                    title: 'Phone Number',
                    text: userNumber != null && userNumber != ''
                        ? userNumber
                        : '',
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
