import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audio_service/audio_service.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'audio.dart';
import 'controller_audio.dart';

class MyHomePage extends StatefulWidget {
  bool statusPlay = false;

  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  bool statusPlay = false;

  var playing;
  var title = '';
  var cover = '';

  final audioController = AudioPlayerTask();
  final controller = GetIt.I.get<ControllerAudio>();

  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    print('init 2');
    connect();

    AudioService.currentMediaItemStream.listen((ret) {
      controller.audioModel.changeTitle(ret.title);
      controller.audioModel.changeImage(ret.artUri);
      
    });

  
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    print('remove dispose');
    disconnect();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        print('enter do resume mode');
        connect();
        break;
      case AppLifecycleState.paused:
        print('enter do paused mode');
        disconnect();
        break;
      default:
        break;
    }
  }

  void connect() async {
    await AudioService.connect();
  }

  void disconnect() {
    AudioService.disconnect();
  }

  Future<void> onStart() async {
    print('chamou sart');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(
          builder: (_) {
            return Text(controller.audioModel.title + controller.statusOfPlay());
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Observer(builder: (_) {
              return Image.network(
                controller.audioModel.image,
                width: 450,
                height: 230,
              );
            }),
            Center(
              child: 
                Observer(
                  builder: (_) {
                    return Text( controller.statusOfPlay() );
                  },
                )             
            ),
            Center(
              child: (RaisedButton(
                child: Text('toca 2'),
                onPressed: () {
                  print('init btn');

                  AudioService.start(
                    backgroundTaskEntrypoint: _audioPlayerTaskEntrypoint,
                    resumeOnClick: true,
                    androidNotificationChannelName: 'Audio Service Demo',
                    notificationColor: 0xFF2196f1,
                    androidNotificationIcon: 'mipmap/ic_launcher',
                  );
                },
              )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.skip_previous),
                  iconSize: 64.0,
                  onPressed: AudioService.skipToPrevious,
                ),
                IconButton(
                  icon: Icon(Icons.pause),
                  iconSize: 64.0,
                  onPressed: () {
                    // audioController.onAddQueueItem(MediaItem(
                    //     id: "https://player.vimeo.com/external/297369952.m3u8?s=c4c8a5e8819dffdd7f784bf5c91a2d4dbbf80947",
                    //     album: "222",
                    //     title: "add agre",
                    //     artist: "2",
                    //     duration: 234,
                    //     artUri:"https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg",
                    //   ));
                  },
                ),
                IconButton(
                  icon: Icon(Icons.skip_next),
                  iconSize: 64.0,
                  onPressed: AudioService.skipToNext,
                ),
              ],
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

  _audioPlayerTaskEntrypoint() async {
    AudioServiceBackground.run(() => AudioPlayerTask());
  }