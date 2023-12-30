import 'package:firebase_example/core/untils/imports.dart';
import 'package:firebase_example/modules/ui/screens/contacts/widgets/contact_item.dart';

class Contacts extends StatelessWidget {
  const Contacts({super.key});

  @override
  Widget build(BuildContext context) {
    final collection =
        FirebaseFirestore.instance.collection('chats').snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: collection,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          var data = snapshot.data!.docs;
          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: data.length,
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 10,
              );
            },
            itemBuilder: (context, index) {
              var doc = data[index].data() as Map<String, dynamic>;

              if (doc['senderUid'] != FirebaseAuth.instance.currentUser!.uid) {
                return ContactItemWidget(
                  userName: doc['senderName'],
                  uid: doc['senderUid'],
                );
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
