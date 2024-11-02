import 'package:flutter/material.dart';
import 'package:pb_sesi4/controller/feed_controller.dart';
import 'package:pb_sesi4/view/feed_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var feedController = FeedController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Our App', 
          style: TextStyle(
            fontWeight: FontWeight.w500
            ),
            ),
            ),
      body: ListView.builder(
        itemCount: feedController.feeds.length,
        itemBuilder: (context, index) => FeedCard(
          feed: feedController.feeds[index],
          )
        )
    );
  }
}


