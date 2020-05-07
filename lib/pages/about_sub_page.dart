import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;

class AboutSubPage extends StatelessWidget {
  final String title;
  final String body;

  AboutSubPage(this.title, this.body);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 0),
          child: Html(
            data: body,
            customTextStyle: (dom.Node node, TextStyle baseStyle) {
              if (node is dom.Element) {
                switch (node.localName) {
                  case "p":
                    return baseStyle
                        .merge(TextStyle(height: 1.2, fontSize: 20));
                  case "strong":
                    return baseStyle
                        .merge(TextStyle(height: 1.2, fontSize: 20));
                }
              }
              return baseStyle;
            },
          ),
        ),
      ),
    );
  }
}
