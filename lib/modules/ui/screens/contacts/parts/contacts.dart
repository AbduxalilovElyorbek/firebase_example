import 'package:firebase_example/core/untils/imports.dart';

class Contacts extends StatelessWidget {
  const Contacts({super.key});

  @override
  Widget build(BuildContext context) {
    final collection = FirebaseFirestore.instance
        .collection('chats')
        .orderBy(
          'senderName',
          descending: false,
        )
        .snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: collection,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          var data = snapshot.data!.docs;
          return ListView.separated(
            padding: EdgeInsets.zero,
            itemCount: data.length,
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 10.h,
              );
            },
            itemBuilder: (context, index) {
              var doc = data[index].data() as Map<String, dynamic>;

              if (doc['senderUid'] != FirebaseAuth.instance.currentUser!.uid) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doc['senderName'][0],
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: dark,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    ContactItemWidget(
                      userName: doc['senderName'],
                      uid: doc['senderUid'],
                    ),
                  ],
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
