import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CreditsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Developer Credits'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              child: Column(
                children: [
                  // SectionHeader(title: 'Application'),
                  InfoRowView(name: 'Developer', content: 'Giorgio Giannotta'),
                  InfoRowView(name: 'Platforms', content: 'iOS, Web & Flutter'),
                  InfoRowView(
                      name: 'Languages', content: 'Swift, Python, JS, Dart'),
                  InfoRowView(
                    name: 'Website',
                    linkLabel: 'Softbay X',
                    linkDestination: 'https://softbayx.com',
                  ),
                  InfoRowView(
                    name: 'Portfolio',
                    linkLabel: 'westcostyle',
                    linkDestination: 'https://westcostyle.com',
                  ),
                  InfoRowView(
                    name: 'Twitter',
                    linkLabel: '@whosjorge23',
                    linkDestination: 'https://twitter.com/whosjorge23',
                  ),
                  InfoRowView(
                    name: 'GitHub',
                    linkLabel: '@whosjorge23',
                    linkDestination: 'https://github.com/whosjorge23',
                  ),
                  InfoRowView(
                    name: 'Instagram',
                    linkLabel: '@whosjorge23',
                    linkDestination: 'https://instagram.com/whosjorge23',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class InfoRowView extends StatelessWidget {
  final String name;
  final String? content;
  final String? linkLabel;
  final String? linkDestination;

  const InfoRowView({
    required this.name,
    this.content,
    this.linkLabel,
    this.linkDestination,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: ListTile(
        title: Text(name, style: TextStyle(color: Colors.grey)),
        trailing: content != null
            ? Text(content!)
            : linkLabel != null && linkDestination != null
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        onPressed: () {
                          _launchInBrowser(Uri.parse("${linkDestination}"));
                        },
                        child: Text(
                          linkLabel!,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  )
                : SizedBox.shrink(),
      ),
    );
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
