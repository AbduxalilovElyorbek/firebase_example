import 'package:firebase_example/core/untils/imports.dart';

import 'package:firebase_example/modules/ui/screens/calls/calls_page.dart';
import 'package:firebase_example/modules/ui/screens/contacts/contact_page.dart';
import 'package:firebase_example/modules/ui/screens/settings/settings_screen.dart';

class NavigationBarScreen extends StatefulWidget {
  static const String routeName = "navigation/screen";
  const NavigationBarScreen({super.key, this.index});

  final int? index;

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  late int index = 0;

  final List pages = [
    const MessagesPage(),
    const CallsPage(),
    const ContactsPage(),
    const SettingsScreen(),
  ];

  @override
  void initState() {
    index = 0;

    if (widget.index != null) {
      index = widget.index!;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        unselectedLabelStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        unselectedItemColor: grey,
        selectedLabelStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        selectedItemColor: green,
        currentIndex: index,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgIcon(
              iconName: AppIcons.message,
              color: index == 0 ? green : grey,
              size: 26,
            ),
            label: "Messages",
          ),
          BottomNavigationBarItem(
            icon: SvgIcon(
              iconName: AppIcons.call,
              color: index == 1 ? green : grey,
              size: 26,
            ),
            label: "Calls",
          ),
          BottomNavigationBarItem(
            icon: SvgIcon(
              iconName: AppIcons.contact,
              color: index == 2 ? green : grey,
              size: 26,
            ),
            label: "Contacts",
          ),
          BottomNavigationBarItem(
            icon: SvgIcon(
              iconName: AppIcons.settings,
              color: index == 3 ? green : grey,
              size: 26,
            ),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
