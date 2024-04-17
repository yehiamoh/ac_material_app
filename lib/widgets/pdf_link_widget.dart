import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PdfLinkWidget extends StatelessWidget {
  final String PdfUrl;

  const PdfLinkWidget({super.key, required this.PdfUrl});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(

      onPressed: () async {
        if (await canLaunch(PdfUrl)) {
          await launch(PdfUrl);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Could not launch Pdf'),
            ),
          );
        }
      },
      icon: const Icon(Icons.picture_as_pdf,size: 30,color: Colors.blueAccent,),
      label: const Text('View Pdf'),
    );
  }
}
