import 'package:flutter/material.dart';
import 'package:universityapp/pages/detail.dart';
import 'package:webview_flutter/webview_flutter.dart';

import './pages/welcome.dart';
import './pages/add_lecture.dart';
import './pages/about.dart';
import './pages/search.dart';
import './pages/contact.dart';
import './pages/about_sub_page.dart';
import './pages/data/text.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home:  WelcomePage(),
      routes: {
        '/home': (context) => MyHomePage(title: 'ESN Ege Lecture Matching'),
        '/library': (context) => AboutSubPage(PageText().library["title"], PageText().library["body"]),
        '/health': (context) => AboutSubPage(PageText().health["title"], PageText().health["body"]),
        '/pool': (context) => AboutSubPage(PageText().pool["title"], PageText().pool["body"]),
        '/gym': (context) => AboutSubPage(PageText().gym["title"], PageText().gym["body"]),
        '/dining': (context) => AboutSubPage(PageText().dining["title"], PageText().dining["body"]),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;


  final List<Widget> _pages = [
    WebView(
      initialUrl: "https://ege.esnturkey.org",
      javascriptMode: JavascriptMode.unrestricted,
    ),
    SearchPage(),
    LectureForm(),
    AboutPage(),
    ContactPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            title: Text('Add'),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            title: Text('About'),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            title: Text('Contact'),
            backgroundColor: Colors.blue,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
