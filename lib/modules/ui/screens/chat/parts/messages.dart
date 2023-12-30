import 'package:firebase_example/core/untils/imports.dart';
import 'package:firebase_example/modules/ui/screens/chat/widgets/my_message.dart';
import 'package:firebase_example/modules/ui/screens/chat/widgets/send_message.dart';

class Messages extends StatefulWidget {
  const Messages({
    super.key,
    required this.getterName,
    required this.getterUid,
    required this.controller,
  });

  final String getterName;
  final String getterUid;
  final ScrollController controller;

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  final _user = FirebaseAuth.instance;
  final _storage = FirebaseFirestore.instance
      .collection('messages')
      .orderBy('dateTime', descending: false)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _storage,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.data != null) {
          var data = snapshot.data!.docs;

          return ListView.builder(
            controller: widget.controller,
            itemCount: data.length,
            itemBuilder: (context, index) {
              var doc = data[index].data() as Map<String, dynamic>;

              var date = doc['dateTime'];

              // final checkDate = DateTime(date.year, date.month, date.day);

              // final today = DateTime.now();
              // final yesterday = DateTime(DateTime.now().year,
              // DateTime.now().month, DateTime.now().day - 1);

              // print(checkDate == today);

              if (date != null) {
                if (doc['uid'] == widget.getterUid + _user.currentUser!.uid) {
                  return Column(
                    children: [
                      // checkDate == today && index == 0
                      //     ? Container(
                      //         padding: const EdgeInsets.symmetric(
                      //           vertical: 5,
                      //           horizontal: 8,
                      //         ),
                      //         color: sendedMessageColor,
                      //         child: Text(
                      //           "Today",
                      //           style: TextStyle(
                      //             color: dark,
                      //             fontSize: 12,
                      //             fontWeight: FontWeight.w500,
                      //           ),
                      //         ),
                      //       )
                      //     : date == yesterday
                      //         ? Container(
                      //             padding: const EdgeInsets.symmetric(
                      //               vertical: 5,
                      //               horizontal: 8,
                      //             ),
                      //             color: sendedMessageColor,
                      //             child: Text(
                      //               "YesterDay",
                      //               style: TextStyle(
                      //                 color: dark,
                      //                 fontSize: 12,
                      //                 fontWeight: FontWeight.w500,
                      //               ),
                      //             ),
                      //           )
                      //         : const SizedBox(),
                      doc['senderUid'] == _user.currentUser!.uid
                          ? MyMessages(
                              message: doc['message'],
                              date: doc['dateTime'],
                            )
                          : SendedMessages(
                              userName: doc['senderName'],
                              message: doc['message'],
                              date: doc['dateTime'],
                            ),
                    ],
                  );
                } else if (doc['uid'] ==
                    _user.currentUser!.uid + widget.getterUid) {
                  if (doc['senderUid'] == _user.currentUser!.uid) {
                    return MyMessages(
                      message: doc['message'],
                      date: doc['dateTime'],
                    );
                  } else {
                    return SendedMessages(
                      userName: doc['senderName'],
                      message: doc['message'],
                      date: doc['dateTime'],
                    );
                  }
                } else {
                  return const SizedBox();
                }
              }
              return const SizedBox();
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
