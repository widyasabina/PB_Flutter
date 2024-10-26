import 'package:flutter/material.dart';
import 'package:pb_sesi4/view/feed_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Our App', 
          style: TextStyle(
            fontWeight: FontWeight.w500
            ),
            ),
            ),
      body: ListView(
        children: [
          FeedCard(),
          FeedCard(),
          FeedCard(),
          FeedCard(),
          FeedCard(),
        ],
      )
    );
  }
}


