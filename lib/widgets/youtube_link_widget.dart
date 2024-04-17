import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class YoutubeLinkWidget extends StatelessWidget {
  final String youtubeUrl;

  const YoutubeLinkWidget({super.key, required this.youtubeUrl});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () async {

          await launch(youtubeUrl);

      },
      icon: const Icon(Icons.video_library,size: 30,color: Colors.blueAccent),
      label: const Text('Watch Video'),
    );
  }
}
