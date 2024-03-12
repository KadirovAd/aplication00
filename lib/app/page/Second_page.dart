import 'package:aplication000/app/view/drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserModelText extends StatefulWidget {
  final String name;
  final String email;
  final DateTime createdAt;

  UserModelText({
    required this.name,
    required this.email,
    required this.createdAt,
  });

  @override
  _UserModelTextState createState() => _UserModelTextState();
}

class _UserModelTextState extends State<UserModelText> {
  final TextEditingController _messageController = TextEditingController();
  List<String> messages = [];
  void addMessage() {
    final message = _messageController.text;
    if (message.isNotEmpty) {
      setState(() {
        messages.add(message);
      });
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WhatsApp'),
      ),
      drawer: DrawerWidget(
        userModel: UserModel(
          name: widget.name,
          email: widget.email,
          createdAt: DateTime.now(),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: 350,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextFormField(
                controller: _messageController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 14.0,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.send),
                    onPressed: addMessage,
                  ),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(
                          messages[index],
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// import 'package:aplication000/app/view/drawer.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class UserModelText extends StatefulWidget {
//   final String name;
//   final String email;
//   final DateTime createdAt;

//   UserModelText({
//     required this.name,
//     required this.email,
//     required this.createdAt,
//   });

//   @override
//   _UserModelTextState createState() => _UserModelTextState();
// }

// class _UserModelTextState extends State<UserModelText> {
//   final TextEditingController _messageController = TextEditingController();
//   List<String> messages = [];

//   void addMessage() async {
//     final message = _messageController.text;
//     if (message.isNotEmpty) {
//       await FirebaseFirestore.instance.collection('messages').add({
//         'text': message,
//         'createdAt': Timestamp.now(),
//         'sender': widget.name,
//       });
//       _messageController.clear();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('WhatsApp'),
//       ),
//       drawer: DrawerWidget(
//         userModel: UserModel(
//           name: widget.name,
//           email: widget.email,
//           createdAt: DateTime.now(),
//         ),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Container(
//               width: 350,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10.0),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.3),
//                     spreadRadius: 1,
//                     blurRadius: 5,
//                     offset: Offset(0, 3),
//                   ),
//                 ],
//               ),
//               child: TextFormField(
//                 controller: _messageController,
//                 decoration: InputDecoration(
//                   contentPadding: EdgeInsets.symmetric(
//                     horizontal: 16.0,
//                     vertical: 14.0,
//                   ),
//                   suffixIcon: IconButton(
//                     icon: Icon(Icons.send),
//                     onPressed: addMessage,
//                   ),
//                   border: OutlineInputBorder(),
//                   prefixIcon: Icon(Icons.search, color: Colors.grey),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: StreamBuilder(
//               stream: FirebaseFirestore.instance
//                   .collection('messages')
//                   .orderBy('createdAt', descending: true)
//                   .snapshots(),
//               builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 }
//                 if (snapshot.hasError) {
//                   return Center(child: Text('Error: ${snapshot.error}'));
//                 }
//                 messages.clear();
//                 for (final doc in snapshot.data!.docs) {
//                   messages.add(doc['text']);
//                 }
//                 return ListView.builder(
//                   itemCount: messages.length,
//                   itemBuilder: (context, index) {
//                     return Card(
//                       elevation: 4,
//                       margin: EdgeInsets.symmetric(vertical: 8.0),
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: ListTile(
//                           title: Text(
//                             messages[index],
//                             style: TextStyle(
//                               fontSize: 18.0,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           leading: CircleAvatar(
//                             backgroundColor: Colors.blue,
//                             child: Icon(
//                               Icons.person,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
