import 'package:firebase_example/core/untils/imports.dart';
import 'package:firebase_example/modules/ui/blocks/profile/profile_bloc.dart';
import 'package:firebase_example/modules/ui/screens/settings/widgets/edit_item.dart';
import 'package:firebase_example/modules/ui/screens/settings/widgets/item_setting.dart';

class SettingsScreen extends StatefulWidget {
  static String routeName = 'settings/screen';
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late TextEditingController _userName;
  late TextEditingController _phoneNumber;
  late TextEditingController _email;
  late TextEditingController _bio;
  final _user = FirebaseAuth.instance.currentUser!;

  late ProfileBloc value;

  @override
  void initState() {
    _userName = TextEditingController();
    _phoneNumber = TextEditingController();
    _email = TextEditingController();
    _bio = TextEditingController();

    value = ProfileBloc();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      body: BlocProvider.value(
        value: value,
        child: Column(
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
                        function: () {
                          _userName.text = _user.displayName!;
                          _email.text = _user.email!;
                          _phoneNumber.text = _user.phoneNumber ?? '';

                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return BlocProvider.value(
                                value: value,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    bottom:
                                        MediaQuery.of(context).padding.bottom +
                                            25,
                                  ),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
                                        0.8,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 24.w,
                                        vertical: 24.w,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Center(
                                            child: Container(
                                              height: 3.h,
                                              width: 30.w,
                                              decoration: BoxDecoration(
                                                color: lightGrey,
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 18.h,
                                          ),
                                          EditItem(
                                            title: "Edit UserName",
                                            controller: _userName,
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          EditItem(
                                            title: "Edit Email",
                                            controller: _email,
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          EditItem(
                                            title: "Edit Phone Number",
                                            controller: _phoneNumber,
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          EditItem(
                                            title: "Bio",
                                            controller: _bio,
                                          ),
                                          const Spacer(),
                                          Row(
                                            children: [
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: red,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  "Close",
                                                  style: TextStyle(
                                                    fontSize: 18.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: white,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 12.w,
                                              ),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: grey,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      12,
                                                    ),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  context
                                                      .read<ProfileBloc>()
                                                      .add(
                                                        EditUser(
                                                          userName:
                                                              _userName.text,
                                                          email: _email.text,
                                                          number:
                                                              _phoneNumber.text,
                                                          bio: _bio.text,
                                                        ),
                                                      );
                                                  setState(() {
                                                    Navigator.pop(context);
                                                  });
                                                },
                                                child: Text(
                                                  "Save",
                                                  style: TextStyle(
                                                    fontSize: 18.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .padding
                                                    .bottom +
                                                16.h,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Divider(
                      color: lightWhite,
                    ),
                    SettingsItem(
                      title: "Storage",
                      functions: [
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                
                              },
                              child: const Text(
                                "Delete Chats",
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
