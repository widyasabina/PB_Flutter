import 'package:flutter/material.dart';
import 'package:pb_sesi4/controller/feed_controller.dart';
import 'package:pb_sesi4/view/feed_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // var feedController = FeedController();
    final controller = context.watch<FeedController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Our App', 
          style: TextStyle(
            fontWeight: FontWeight.w500
            ),
            ),
            ),
      body: RefreshIndicator(
        onRefresh: ()async{
          await Future.delayed(const Duration(seconds: 1));
          controller.refresh();
        },
        child: ListView.builder(
          itemCount: controller.length,
          itemBuilder: (context, index) => FeedCard(
            feed: controller.feed(index),
            )
          ),
      )
    );
  }
}


