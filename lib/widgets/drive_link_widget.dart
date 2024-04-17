import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DriveLinkWidget extends StatelessWidget {
  final String DriveUrl;

  const DriveLinkWidget({super.key, required this.DriveUrl});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () async {
        if (await canLaunch(DriveUrl)) {
          await launch(DriveUrl);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Could not launch Drive'),
            ),
          );
        }
      },
      icon: const Icon(Icons.add_to_drive_rounded,size: 30,color: Colors.blueAccent),
      label: const Text('View Drive'),
    );
  }
}
