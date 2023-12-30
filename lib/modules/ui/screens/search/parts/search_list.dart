import 'package:firebase_example/core/untils/imports.dart';
import 'package:firebase_example/modules/ui/screens/search/widgets/search_item.dart';

class SearchList extends StatelessWidget {
  const SearchList({
    super.key,
    required this.searchName,
  });

  final String searchName;

  @override
  Widget build(BuildContext context) {
    final _user = FirebaseAuth.instance.currentUser!;
    final _storage = FirebaseFirestore.instance
        .collection('chats')
        .where(
          'getterUid',
          isEqualTo: _user.uid,
        )
        .where(
          'name',
          isEqualTo: searchName,
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
                child: SearchItemWidget(
                  userName: doc['name'],
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
