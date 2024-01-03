import 'package:firebase_example/core/untils/imports.dart';

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
