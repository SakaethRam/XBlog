import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xblog/Design/forum_post.dart';
import 'package:xblog/Design/menu_design.dart';
import 'package:xblog/Models/helper.dart';
import 'package:xblog/Models/profile_ext.dart';
import 'package:xblog/Themes/drawer.dart';
import 'package:xblog/Themes/profile_pic.dart';

class ProfileSect extends StatefulWidget {

  const ProfileSect({super.key});

  @override
  State<ProfileSect> createState() => _ProfileSectState();
}

class _ProfileSectState extends State<ProfileSect> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  // All Users
  final userCollection = FirebaseFirestore.instance.collection('Users');

  // Fetch user posts from the 'User Posts' collection where user email matches
  Stream<QuerySnapshot> getUserPosts() {
    return FirebaseFirestore.instance
        .collection('User Posts')
        .where('UserEmail', isEqualTo: currentUser.email)
        .snapshots();
  }

  // EDIT FIELD
  Future<void> editField(String field) async {
    String newValue = "";
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: Text("EDIT: " + field, style: const TextStyle(color: Colors.white)),
        content: TextField(
          autofocus: true,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Enter New $field",
            hintStyle: TextStyle(color: Colors.grey),
          ),
          onChanged: (value) {
            newValue = value;
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(newValue),
            child: Text('Save', style: TextStyle(color: Colors.white)),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero, // Sets the border radius to zero (rectangular)
        ),
      ),
    );

    // UPDATE IN FIRESTORE
    if (newValue.trim().length > 0) {
      await userCollection.doc(currentUser.email).update({field: newValue});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          "P R O F I L E",
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
            fontFamily: 'Poppins',
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => MyDrawer(background: ProfileSect()),
                  ),
                );
              },
              icon: CustomPaint(
                size: Size(30, 30),
                painter: MenuIconPainter(iconColor: Theme.of(context).colorScheme.inversePrimary),
              ),
            ),
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
        body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance.collection("Users").doc(currentUser.email).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final userData = snapshot.data!.data() as Map<String, dynamic>;

              return ListView(
                children: [
                  const SizedBox(height: 50),
                  // Profile Picture
                  ProfilePicture(),
                  const SizedBox(height: 10),
                  // Username (instead of email)
                  Text(
                    userData['username'] ?? 'No username available', // Using username instead of email
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 50),
                  // User Details
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Text(
                      "USER DETAILS:",
                      style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                  ),
                  // Username field (editable)
                  ProfileEdit(
                    text: userData['username'] ?? 'No username available', // Default value to handle null
                    sectionName: 'Username',
                    onPressed: () => editField('username'),
                  ),
                  // Bio
                  ProfileEdit(
                    text: userData['bio'] ?? 'No bio available', // Default value to handle null
                    sectionName: 'Bio',
                    onPressed: () => editField('bio'),
                  ),
                  const SizedBox(height: 50),
                  // User Posts Section
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Text(
                      "POSTS:",
                      style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                  ),
                  const SizedBox(height: 5),
                  // POSTS
                  StreamBuilder<QuerySnapshot>(
                    stream: getUserPosts(),
                    builder: (context, postSnapshot) {
                      if (!postSnapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      final posts = postSnapshot.data!.docs;

                      if (posts.isEmpty) {
                        return Center(
                          child: Text(
                            "No posts available.",
                            style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                          ),
                        );
                      }

                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: posts.length,
                        itemBuilder: (context, index) {
                          final postData = posts[index].data() as Map<String, dynamic>;

                          return ForumPost(
                            message: postData['Message'] ?? 'No message available', // Default value to handle null
                            user: postData['UserEmail'] ?? 'Unknown User', // Default value to handle null
                            time: postData['PostTime'] ?? 'Unknown time', // Default value to handle null
                            postId: posts[index].id,
                            likes: List<String>.from(postData['Likes'] ?? []), // Default value to handle null
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 25)
                ],
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),

    );
  }
}

