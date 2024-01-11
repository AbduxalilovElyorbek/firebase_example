import 'package:firebase_example/core/untils/imports.dart';

class SearchList extends StatelessWidget {
  const SearchList({
    super.key,
    required this.searchText,
    required this.isContacts,
  });

  final String searchText;
  final bool isContacts;

  @override
  Widget build(BuildContext context) {
    final _user = FirebaseAuth.instance.currentUser!;
    final dynamic _storage = isContacts
        ? FirebaseFirestore.instance
            .collection('chats')
            .where('getterName', isGreaterThanOrEqualTo: searchText)
            .snapshots()
        : FirebaseFirestore.instance
            .collection('users')
            .where('name', isGreaterThanOrEqualTo: searchText)
            .where('name', isLessThan: searchText + '\uf8ff')
            .snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: _storage,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.data != null && snapshot.hasData) {
          var data = snapshot.data!.docs;
    
          return ListView.separated(
            itemCount: data.length,
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 12,
              );
            },
            itemBuilder: (context, index) {
              var doc = data[index].data() as Map<String, dynamic>;
    
              if (doc['uid'] == _user.uid || doc['senderUid'] == _user.uid) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Chat.routeName, arguments: {
                      'name': "Saved",
                      'getterUid': isContacts ? doc['senderUid'] : doc['uid'],
                    });
                  },
                  child: const SearchItemWidget(
                    userName: "Saved",
                  ),
                );
              }
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Chat.routeName, arguments: {
                    'name': isContacts ? doc['senderName'] : doc['name'],
                    'getterUid': isContacts ? doc['senderUid'] : doc['uid'],
                  });
                },
                child: SearchItemWidget(
                  userName: isContacts ? doc['senderName'] : doc['name'],
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
