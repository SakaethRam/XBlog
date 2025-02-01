import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xblog/Design/components.dart';
import 'package:xblog/Design/forum_post.dart';
import 'package:xblog/Design/menu_design.dart';
import 'package:xblog/Models/helper.dart';
import 'package:xblog/Themes/drawer.dart';

class ForumSect extends StatefulWidget {
  const ForumSect({super.key});


  @override
  State<ForumSect> createState() => _ForumSectState();
}

class _ForumSectState extends State<ForumSect> {

  final user = FirebaseAuth.instance.currentUser!;

  //TEXT CONTROLLER
  final textController =TextEditingController();

  //POST MESSAGES
  void postMessage() {
    //ONLY POST IF THERE IS SOMETHING IN TEXTFIELD
    if (textController.text.isNotEmpty) {
      //STORE IN FIREBASE
      FirebaseFirestore.instance.collection("User Posts").add(
        {
          'UserEmail': user.email!,
          'Message': textController.text,
          'TimeStamp': Timestamp.now(),
          'Likes': []
        }
      );

    }

    //CLEAR THE TEXTFIELD
    setState(() {
      textController.clear();
    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("F O R U M", style: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary,
          fontFamily: 'Poppins',
        )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => MyDrawer(background: ForumSect()),
                  ),
                );
              },
              icon: CustomPaint(
                size: Size(30, 30), // Adjust size as needed
                painter: MenuIconPainter(iconColor: Theme.of(context).colorScheme.inversePrimary),
              ),
            ),
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          children: [
            //THE WALL
            Expanded(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection("User Posts").orderBy("TimeStamp", descending: false).snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(itemCount: snapshot.data!.docs.length, itemBuilder: (context, index) {
                        //GET MESSAGE
                        final post = snapshot.data!.docs[index];
                        return ForumPost(
                            message: post['Message'],
                            user: post['UserEmail'],
                            postId: post.id,
                            likes: List<String>.from(post['Likes'] ?? []),
                            time: formatDate(post['TimeStamp']),
                            );

                      });
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
              ),
            ),

            //POST MESSAGES
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                children: [
                  //TEXTFIELD
                  Expanded(
                      child: MyTextField(
                        controller: textController,
                        hintText: 'Is "Black Hunt" Manga Good?..',
                        obscureText: false,
                      )),

                  const SizedBox(width: 5),
                  //POST BTN
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.inversePrimary, // Background color for the icon
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: IconButton(
                      onPressed: postMessage,
                      icon: Icon(
                        Icons.arrow_circle_up,
                        size: 30,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                    padding: EdgeInsets.all(5), // Adds some padding around the icon
                  ),

                ],
              ),
            ),

            //LOGGED IN AS
            Text(
              'Welcome to Arkin X\'s Forum',
              style: TextStyle(
                fontFamily: 'ModernAntiqua',
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),


            const SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
