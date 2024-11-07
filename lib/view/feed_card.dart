import 'package:flutter/material.dart';
import 'package:pb_sesi4/model/feed.dart';

class FeedCard extends StatefulWidget {
  final Feed feed;
  const FeedCard({
    super.key,
    required this.feed,
  });
  @override
  _FeedCardState createState() => _FeedCardState();
}

class _FeedCardState extends State<FeedCard> {
  // Variabel untuk menyimpan status like
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    const url =
        'https://images.pexels.com/photos/27893233/pexels-photo-27893233/free-photo-of-woman-in-shirt-photographing-with-digital-camera.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load';
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(widget.feed.user.avatar),
            ),
            title: Text(widget.feed.user.name),
            subtitle: Text(widget.feed.user.place),
            trailing: Icon(Icons.more_vert),
          ),
          //content
          Image.network(
            widget.feed.content.image,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * 0.8,
            fit: BoxFit.cover,
          ),
          //footer
          ListTile(
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(
                    isLiked
                        ? Icons.favorite
                        : Icons
                            .favorite_border, // If liked, show filled heart; else, outline
                    color: isLiked
                        ? Colors.red
                        : Colors.grey, // Red color for liked, grey for unliked
                  ),
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked; // Toggle like status
                    });
                  },
                ),
                SizedBox(width: 16),
                Icon(Icons.comment),
                SizedBox(width: 16),
                Icon(Icons.share),
              ],
            ),
            trailing: Icon(Icons.bookmark_outlined),
          ),
          ListTile(
            title: Text(widget.feed.content.Likes),
            subtitle: Text(widget.feed.content.description),
          )
        ],
      ),
    );
  }
}
