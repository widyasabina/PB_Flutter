import 'package:flutter/material.dart';
import 'package:pb_sesi4/model/feed.dart';

class FeedCard extends StatelessWidget {
  final Feed feed;
  const FeedCard({
    super.key,
    required this.feed,
  });

  @override
  Widget build(BuildContext context) {
    const url = 'https://images.pexels.com/photos/27893233/pexels-photo-27893233/free-photo-of-woman-in-shirt-photographing-with-digital-camera.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load';
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(feed.user.avatar),
              
            ),
            title: Text(feed.user.name),
            subtitle: Text(feed.user.place),
            trailing: Icon(Icons.more_vert),
          ),
       //content
          Image.network(feed.content.image,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width * 0.8,
          fit: BoxFit.cover,
          ),
       //footer
      ListTile(
  leading: Row(
    mainAxisSize: MainAxisSize.min, 
    children: [
      Icon(Icons.favorite),
      SizedBox(width: 16), 
      Icon(Icons.comment),
      SizedBox(width: 16),
      Icon(Icons.share),
    ],
  ),
    trailing: Icon(Icons.bookmark_outlined),
),
      ListTile(
        title: Text(feed.content.Likes),
        subtitle: Text(feed.content.description),
      )
        ],
      ),
    );
  }
}