import 'package:flutter/material.dart';
import 'package:pb_sesi4/model/feed.dart';
import 'package:pb_sesi4/model/feed_repository.dart';

class FeedController extends ChangeNotifier {
  
  List<Feed> feeds = FeedRepository().fetch();
  int get length => feeds.length;

  Feed feed(int index){
    return feeds[index];
  }
   List<Feed> get bookmarkedFeeds => feeds.where((feed)=> feed.content.isBookmark).toList();

  like(Feed feed){
    feeds.firstWhere((element) => element.id == feed.id,
    ).content.isLike = !feed.content.isLike;
    notifyListeners();
  }
  bookmark(Feed feed){
    feeds.firstWhere((element) => element.id == feed.id,
    ).content.isBookmark = !feed.content.isBookmark;
    notifyListeners();
  }


  refresh(){
    feeds = FeedRepository().fetch()..shuffle();
    notifyListeners();
  }
}