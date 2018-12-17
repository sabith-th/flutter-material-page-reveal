import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:material_page_reveal/pages.dart';

class PageIndicator extends StatelessWidget {
  final PageIndicatorViewModel viewModel;

  PageIndicator({this.viewModel});

  @override
  Widget build(BuildContext context) {
    List<PageBubble> bubbles = [];
    for (var i = 0; i < viewModel.pages.length; i++) {
      final page = viewModel.pages[i];
      bubbles.add(PageBubble(
          viewModel: PageBubbleViewModel(
              page.iconAssetPath,
              page.color,
              i > viewModel.activeIndex,
              i == viewModel.activeIndex ? 1.0 : 0.0)));
    }

    return Column(
      children: <Widget>[
        Expanded(
          child: Container(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: bubbles,
        )
      ],
    );
  }
}

enum SlideDirection { leftToRight, rightToLeft, none }

class PageBubbleViewModel {
  final String iconAssetPath;
  final Color color;
  final bool isHollow;
  final double activePercent;

  PageBubbleViewModel(
      this.iconAssetPath, this.color, this.isHollow, this.activePercent);
}

class PageIndicatorViewModel {
  final List<PageViewModel> pages;
  final int activeIndex;
  final SlideDirection slideDirection;
  final double slidePercent;

  PageIndicatorViewModel(
      this.pages, this.activeIndex, this.slideDirection, this.slidePercent);
}

class PageBubble extends StatelessWidget {
  final PageBubbleViewModel viewModel;

  PageBubble({this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        width: lerpDouble(20.0, 45.0, viewModel.activePercent),
        height: lerpDouble(20.0, 45.0, viewModel.activePercent),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: viewModel.isHollow ? Colors.transparent : Color(0x88FFFFFF),
          border: Border.all(
              color:
                  viewModel.isHollow ? Color(0x88FFFFFF) : Colors.transparent,
              width: 3.0),
        ),
        child: Opacity(
          opacity: viewModel.activePercent,
          child: Image.asset(
            viewModel.iconAssetPath,
            color: viewModel.color,
          ),
        ),
      ),
    );
  }
}
