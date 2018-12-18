import 'package:flutter/material.dart';
import 'package:material_page_reveal/pages.dart';
import 'package:material_page_reveal/page_reveal.dart';
import 'package:material_page_reveal/page_indicator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material Page Reveal',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        PageReveal(
          revealPercent: 1.0,
          child: Page(
            viewModel: pages[0],
            percentVisible: 1.0,
          ),
        ),
        PageReveal(
          revealPercent: 0.9,
          child: Page(
            viewModel: pages[1],
            percentVisible: 1.0,
          ),
        ),
        PageIndicator(
          viewModel: PageIndicatorViewModel(pages, 1, SlideDirection.leftToRight, 1.0),
        )
      ],
    ));
  }
}
