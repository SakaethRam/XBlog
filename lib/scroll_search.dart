import 'package:flutter/material.dart';
import 'package:xblog/main.dart';

// BottomSheetDummyUI widget - Contains the image, text, and tap gesture to navigate to the next page
class ScrollXBlog extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the next page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) => XBlog()), // Replace 'NextPage' with your next screen
        );
      },
      child: Container(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black12, // Background color
                      image: DecorationImage(
                        image: AssetImage("assets/Black_Hunt.jpg"), // Image asset
                        fit: BoxFit.cover, // Ensure the image covers the container
                      ),
                    ),
                    height: 100,
                    width: 100,
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Container(
                        child: Text(">> Black Hunt <<", style: TextStyle(fontSize: 15)),
                        height: 20,
                        width: 240,
                      ),
                    ),
                    SizedBox(height: 5),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Container(
                        child: Text("#JJk #Fashion", style: TextStyle(fontSize: 15)),
                        height: 20,
                        width: 180,
                      ),
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class ScrollYBlog extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the next page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) => XBlogArk2()), // Replace 'NextPage' with your next screen
        );
      },
      child: Container(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black12, // Background color
                      image: DecorationImage(
                        image: AssetImage("assets/Crimson_Red.jpg"), // Image asset
                        fit: BoxFit.cover, // Ensure the image covers the container
                      ),
                    ),
                    height: 100,
                    width: 100,
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Container(
                        child: Text(">> Crimson Red <<", style: TextStyle(fontSize: 15)),
                        height: 20,
                        width: 240,
                      ),
                    ),
                    SizedBox(height: 5),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Container(
                        child: Text("#JJk #Fashion", style: TextStyle(fontSize: 15)),
                        height: 20,
                        width: 180,
                      ),
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class ScrollZBlog extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the next page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) => XBlogArk3()), // Replace 'NextPage' with your next screen
        );
      },
      child: Container(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black12, // Background color
                      image: DecorationImage(
                        image: AssetImage("assets/Stylish_Brown.jpg"), // Image asset
                        fit: BoxFit.cover, // Ensure the image covers the container
                      ),
                    ),
                    height: 100,
                    width: 100,
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Container(
                        child: Text(">> Styled Brown <<", style: TextStyle(fontSize: 15)),
                        height: 20,
                        width: 240,
                      ),
                    ),
                    SizedBox(height: 5),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Container(
                        child: Text("#JJk #Fashion", style: TextStyle(fontSize: 15)),
                        height: 20,
                        width: 180,
                      ),
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

// MyDraggableSheet widget - Handles the draggable sheet functionality
class MyDraggableSheet extends StatefulWidget {
  final Widget child;
  const MyDraggableSheet({super.key, required this.child});

  @override
  State<MyDraggableSheet> createState() => _MyDraggableSheetState();
}

class _MyDraggableSheetState extends State<MyDraggableSheet> {
  final sheet = GlobalKey();
  final controller = DraggableScrollableController();

  @override
  void initState() {
    super.initState();
    controller.addListener(onChanged);
  }

  void onChanged() {
    final currentSize = controller.size;
    if (currentSize <= 0.05) collapse();
  }

  void collapse() => animateSheet(getSheet.snapSizes!.first);

  void anchor() => animateSheet(getSheet.snapSizes!.last);

  void expand() => animateSheet(getSheet.maxChildSize);

  void hide() => animateSheet(getSheet.minChildSize);

  void animateSheet(double size) {
    controller.animateTo(
      size,
      duration: const Duration(milliseconds: 50),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  DraggableScrollableSheet get getSheet =>
      (sheet.currentWidget as DraggableScrollableSheet);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return DraggableScrollableSheet(
        key: sheet,
        initialChildSize: 0.025,
        maxChildSize: 1.0,
        minChildSize: 0,
        expand: true,
        snap: true,
        snapSizes: [
          60 / constraints.maxHeight,
          0.5,
        ],
        controller: controller,
        builder: (BuildContext context, ScrollController scrollController) {
          return DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: Offset(0, 1),
                ),
              ],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(22),
                topRight: Radius.circular(22),
              ),
            ),
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                topButtonIndicator(),
                SliverToBoxAdapter(
                  child: widget.child,
                ),
              ],
            ),
          );
        },
      );
    });
  }

  SliverToBoxAdapter topButtonIndicator() {
    return SliverToBoxAdapter(
        child: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                      child: Center(
                          child: Wrap(children: <Widget>[
                            Container(
                                width: 100,
                                margin: const EdgeInsets.only(top: 10, bottom: 10),
                                height: 5,
                                decoration: const BoxDecoration(
                                  color: Colors.black45,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                ))
                          ])))
                ]))
    );
  }
}

