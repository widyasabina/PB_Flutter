import 'package:flutter/material.dart';

class FeedCard extends StatelessWidget {
  const FeedCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const url = 'https://images.pexels.com/photos/27893233/pexels-photo-27893233/free-photo-of-woman-in-shirt-photographing-with-digital-camera.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load';
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(url),
            ),
            title: Text('widiashabina'),
            subtitle: Text('Status'),
            trailing: Icon(Icons.more_vert),
          ),
       //content
          Image.network('https://images.pexels.com/photos/28158791/pexels-photo-28158791/free-photo-of-a-snowy-mountain-road-with-a-village-in-the-background.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
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
        title: Text('1,285 Likes'),
        subtitle: Text('haloooooo'),
      )
        ],
      ),
    );
  }
}