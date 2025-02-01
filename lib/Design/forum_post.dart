import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xblog/Design/signin.dart';

import '../Models/helper.dart';

class ForumPost extends StatefulWidget {

  final String message;
  final String user;
  final String time;
  final String postId;
  final List<String> likes;

  const ForumPost({super.key, required this.message, required this.user, required this.postId, required this.likes, required this.time});

  @override
  State<ForumPost> createState() => _ForumPostState();
}

class _ForumPostState extends State<ForumPost> {

  //User
  final currentUser = FirebaseAuth.instance.currentUser!;
  final currentUserName = FirebaseFirestore.instance
      .collection('Users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .get()
      .then((doc) => doc.data()?['username'] ?? 'Unknown User');
  bool isLiked = false;

  //Comment Text Controller
  final _commentTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    isLiked = widget.likes.contains(currentUser.email);
  }

  //Toggle Like
  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });

    //Access the doc in Firebase
    DocumentReference postRef = FirebaseFirestore.instance.collection('User Posts').doc(widget.postId);

    if (isLiked) {
      //If post liked, Add user's email to likes field
      postRef.update({
        'Likes': FieldValue.arrayUnion([currentUser.email])
      });

    } else {
      //If post unliked, Remove user's email to likes field
      postRef.update({
        'Likes': FieldValue.arrayRemove([currentUser.email])
      });

    }

}

  //Add Comment
  void addComment(String commentText) {
    //Firestore under the comments collection
    FirebaseFirestore.instance
        .collection("User Posts")
        .doc(widget.postId)
        .collection("Comments")
        .add({
      "CommentText": commentText,
      "CommentedBy": currentUser.email,
      "CommentTime": Timestamp.now()
    });
  }

  //Show a dialog box  for adding comment
  void showCommentDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Add Comment"),
          content: TextField(
            controller: _commentTextController,
            decoration: InputDecoration(hintText: "Write a comment.."),
          ),
          actions: [
            //Cancel Btn
            TextButton(
                onPressed: () {
                  //pop box
                  Navigator.pop(context);

                  //clear controller
                  _commentTextController.clear();
                },
                child: Text("Cancel", style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary))
            ),

            //Save Post Btn
            TextButton(
                onPressed: () {
                  //Add Comment
                  addComment(_commentTextController.text);

                  //Pop box
                  Navigator.pop(context);

                  //Clear Controller
                  _commentTextController.clear();
                },
                child: Text("Post", style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary))
            ),

          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero, // Sets the border radius to zero (rectangular)
          ),
        ),
    );
  }

  // Delete Post
  void deletePost() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Delete Post"),
        content: Text("Do you want to delete this post?"),
        actions: [
          // CANCEL BUTTON
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Cancel",
              style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ),

          // DELETE BUTTON
          TextButton(
            onPressed: () async {
              Navigator.pop(context); // Close dialog immediately to prevent delay
              try {
                // Delete comments along with the post
                final commentDocs = await FirebaseFirestore.instance
                    .collection("User Posts")
                    .doc(widget.postId)
                    .collection("Comments")
                    .get();

                for (var doc in commentDocs.docs) {
                  await FirebaseFirestore.instance
                      .collection("User Posts")
                      .doc(widget.postId)
                      .collection("Comments")
                      .doc(doc.id)
                      .delete();
                }

                // Delete the post
                await FirebaseFirestore.instance
                    .collection("User Posts")
                    .doc(widget.postId)
                    .delete();

                // Show success message
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Post deleted successfully."),
                    backgroundColor: Colors.green,
                    duration: Duration(seconds: 3),
                  ),
                );

                print("Post Deleted");
              } catch (e) {
                print("Failed to delete the post: $e");

                // Show error message
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Failed to delete the post. Please try again."),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 3),
                  ),
                );
              }
            },
            child: Text(
              "Delete",
              style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero, // Sets the border radius to zero (rectangular)
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          borderRadius: BorderRadius.circular(8)
      ),
      margin: EdgeInsets.only(top: 25, left: 25, right: 25),
      padding: EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align items at the start of the row
        children: [

          // USERNAME AND MESSAGE
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              //Group of Text (Message + Email)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start of the column
                children: [
                  // MESSAGE
                  Text(
                    widget.message,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),

                  const SizedBox(height: 5),

                  // USERNAME
                  Row(
                    children: [
                      Text(
                          widget.user,
                          style: TextStyle(color: Theme.of(context).colorScheme.primary
                          )),
                      Text(
                          " | ",
                          style: TextStyle(color: Theme.of(context).colorScheme.primary)
                      ),
                      Text(
                          widget.time,
                          style: TextStyle(color: Theme.of(context).colorScheme.primary)
                      ),
                    ],
                  ),
                ],
              ),

              //Delete Btn
              if (widget.user == currentUser.email)
                DeleteBtn(onTap: deletePost),
            ],
          ),

          const SizedBox(height: 10, width: 10),

          //Comment, Likes Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Like Button and Count
              Column(
                children: [
                  LikeBtn(
                    isLiked: isLiked,
                    ontap: toggleLike,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.likes.length.toString(),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),

              const SizedBox(width: 10),

              // Comment Button and Count
              Column(
                children: [
                  CommentBtn(onTap: showCommentDialog),
                  const SizedBox(height: 5),
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("User Posts")
                        .doc(widget.postId)
                        .collection("Comments")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Text(
                          "0",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 14,
                          ),
                        );
                      }

                      // Show the count of documents in the collection
                      final commentCount = snapshot.data!.docs.length;

                      return Text(
                        commentCount.toString(),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontSize: 14,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 10),
          //Comment Under Post
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore
                  .instance
                  .collection("User Posts")
                  .doc(widget.postId)
                  .collection("Comments")
                  .orderBy("CommentTime", descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                //Show loading circle if no data yet
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                return ListView(
                  shrinkWrap: true, // For Nested Lists
                  physics: const NeverScrollableScrollPhysics(),
                  children: snapshot.hasData
                      ? snapshot.data!.docs.map<Widget>((doc) {
                    // Get the comment
                    final commentData = doc.data() as Map<String, dynamic>;

                    // Return the comment
                    return Comment(
                      text: commentData["CommentText"],
                      user: commentData["CommentedBy"],
                      time: formatDate(commentData["CommentTime"]),
                    );
                  }).toList()
                      : [],
                );
              })
        ],
      ),
    );
  }
}


class LikeBtn extends StatelessWidget {

  final bool isLiked;
  void Function()? ontap;

  LikeBtn({super.key, required this.isLiked, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Icon(
          isLiked ? Icons.favorite: Icons.favorite_border,
          color: isLiked ? Colors.red : Theme.of(context).colorScheme.inversePrimary,
      ),
    );
  }
}

class Comment extends StatelessWidget {

  final String text;
  final String user;
  final String time;

  const Comment({
    super.key,
    required this.text,
    required this.user,
    required this.time
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(4)
      ),
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //COMMENT
          Text(text),

          const SizedBox(height: 5),

          //USER, TIME
          Row(
            children: [
              Text(
                  user,
                  style: TextStyle(color: Theme.of(context).colorScheme.primary
                  )),
              Text(
                " | ",
                style: TextStyle(color: Theme.of(context).colorScheme.primary)
              ),
              Text(
                  time,
                style: TextStyle(color: Theme.of(context).colorScheme.primary)
              ),
            ],
          ),


        ],
      ),
    );
  }
}

class CommentBtn extends StatelessWidget {
  final void Function()? onTap;

  const CommentBtn({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        Icons.comment,
        color: Theme.of(context).colorScheme.inversePrimary,
      ),
    );
  }
}


