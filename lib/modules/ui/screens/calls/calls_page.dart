import 'package:firebase_example/constants/colors/colors.dart';
import 'package:firebase_example/constants/icons/icons.dart';
import 'package:firebase_example/modules/ui/screens/calls/parts/calls.dart';
import 'package:firebase_example/modules/ui/screens/messages/widgets/icon_widget.dart';
import 'package:firebase_example/modules/ui/screens/search/search_page.dart';
import 'package:flutter/material.dart';

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
                const SizedBox(),
                Text(
                  "Calls",
                  style: TextStyle(
                    fontSize: 20,
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
                        builder: (context) => const SearchPage(),
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
              const Expanded(
                child: Calls(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
