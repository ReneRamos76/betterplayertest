import 'package:better_player/better_player.dart';
import 'package:example/constants.dart';
import 'package:flutter/material.dart';

class NotificationPlayerPage extends StatefulWidget {
  @override
  _NotificationPlayerPageState createState() => _NotificationPlayerPageState();
}

class _NotificationPlayerPageState extends State<NotificationPlayerPage> {
  late BetterPlayerController _betterPlayerController;

  final _betterKey = GlobalKey();

  @override
  void initState() {
    BetterPlayerConfiguration betterPlayerConfiguration =
        BetterPlayerConfiguration(
      aspectRatio: 16 / 9,
      fit: BoxFit.contain,
      handleLifecycle: false,
      autoPlay: true,
      autoDispose: true,
    );
    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _setupDataSource();
    super.initState();
  }

  void _setupDataSource() async {
    // String imageUrl = await Utils.getFileUrl(Constants.logo);
    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      Constants.elephantDreamVideoUrl,
      
      notificationConfiguration: BetterPlayerNotificationConfiguration(
        showNotification: false,
        title: "Elephant dream",
        author: "Some author",
        imageUrl: Constants.catImageUrl,
      ),
    );
    _betterPlayerController.setupDataSource(dataSource);
    _betterPlayerController.setBetterPlayerGlobalKey(_betterKey);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification player"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Click play on player to show notification in status bar.",
              style: TextStyle(fontSize: 16),
            ),
          ),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: BetterPlayer(
              controller: _betterPlayerController,
              key: _betterKey,
            ),
          ),
        ],
      ),
    );
  }
}
