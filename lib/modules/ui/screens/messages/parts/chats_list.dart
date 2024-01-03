import 'package:firebase_example/core/untils/imports.dart';

class ChatList extends StatelessWidget {
  const ChatList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final _user = FirebaseAuth.instance.currentUser!;
    final _storage = FirebaseFirestore.instance.collection('chats').snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: _storage,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.data != null && snapshot.hasData) {
          var data = snapshot.data!.docs;

          return ListView.separated(
            itemCount: data.length,
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 14,
              );
            },
            itemBuilder: (context, index) {
              var doc = data[index].data() as Map<String, dynamic>;

              if (doc['senderUid'] == _user.uid) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Chat.routeName, arguments: {
                      'getterUid': doc['senderUid'],
                      'name': "Saved",
                    });
                  },
                  child: ChatItem(
                    uid: doc['senderUid'],
                    name: "Saved",
                    message: '',
                    isOnline: false,
                  ),
                );
              }
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Chat.routeName, arguments: {
                    'getterUid': doc['senderUid'],
                    'name': doc['senderName'],
                  });
                },
                child: ChatItem(
                  uid: doc['senderUid'],
                  name: doc['senderName'],
                  message: doc['lastestMessage'],
                  isOnline: false,
                ),
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
