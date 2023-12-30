import 'package:firebase_example/core/untils/imports.dart';

class ChatList extends StatelessWidget {
  const ChatList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final _user = FirebaseAuth.instance.currentUser!;
    final _storage = FirebaseFirestore.instance
        .collection('chats')
        .where(
          'getterUid',
          isEqualTo: _user.uid,
        )
        .snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: _storage,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.data != null && snapshot.hasData) {
          var data = snapshot.data!.docs;

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              var doc = data[index].data() as Map<String, dynamic>;

              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Chat.routeName, arguments: {
                    'name': doc['senderName'],
                    'getterUid': doc['senderUid'],
                  });
                },
                child: ChatItem(
                  uid: doc['senderUid'],
                  isOnline: false,
                  name: doc['senderName'],
                  message: doc['lastestMessage'],
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
