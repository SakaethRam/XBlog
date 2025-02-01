import 'package:flutter/material.dart';
import 'package:xblog/Models/series.dart';
import 'package:xblog/main.dart';

class SeriesTile extends StatelessWidget {
  final Series series;
  void Function()? onPressed;
  final Widget icon;
  SeriesTile({super.key, required this.series, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      child: ListTile(
        onTap: () {
          if (series.name == 'Black Hunt') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => XBlog()), // Replace with your page
            );
          }
          if (series.name == 'Crimson Red') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => XBlogArk2()), // Replace with your page
            );
          }
          if (series.name == 'Styled Brown') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => XBlogArk3()), // Replace with your page
            );
          }
          // Add conditions for other series if needed
        },
        title: Text(series.name),
        subtitle: Text(series.tag),
        leading: Image.asset(series.imagePath),
        trailing: IconButton(
          icon: icon,
          onPressed: onPressed,
        ),
      ),
    );
  }
}


