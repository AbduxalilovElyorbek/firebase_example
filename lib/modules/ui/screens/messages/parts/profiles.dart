import 'package:firebase_example/core/untils/imports.dart';

class Profiles extends StatelessWidget {
  Profiles({super.key});

  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('users')
      .where(
        'uid',
        isNotEqualTo: FirebaseAuth.instance.currentUser!.uid,
      )
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.data != null && snapshot.hasData) {
          var data = snapshot.data!.docs;
          return ListView.separated(
            padding: const EdgeInsets.only(
              left: 25,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 12.w,
              );
            },
            itemBuilder: (context, index) {
              Map<String, dynamic> document =
                  data[index].data() as Map<String, dynamic>;

              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Chat.routeName, arguments: {
                    'name': document['name'],
                    'getterUid': document['uid'],
                    'email': document['email'] ?? '',
                    'number': document['phoneNumber'] ?? '',
                  });
                },
                child: ProfileItem(
                  text: document['name'],
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return const SizedBox();
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
