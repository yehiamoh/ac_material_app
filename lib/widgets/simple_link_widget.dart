import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SimpleLinkWidget extends StatelessWidget {
  final String linkUrl;

  const SimpleLinkWidget({super.key, required this.linkUrl});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () async {
        await launch(linkUrl);
      },
      icon: const Icon(Icons.link,size: 25,color: Colors.blueAccent),
      label: const Text('view link'),
    );
  }
}
