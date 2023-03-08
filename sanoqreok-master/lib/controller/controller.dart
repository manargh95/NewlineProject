import 'package:flutter/material.dart';
import 'package:sanoqreok/myApp/favorite.dart';
import 'package:sanoqreok/myApp/library_location.dart';
import 'package:sanoqreok/myApp/quotes.dart';
import '../myApp/homePage.dart';
import '../search/search.dart';

class controller implements PageController {
  final screens = [library_location(), BookSearch(), home(), quotes(), favorite()];



  @override
  void addListener(VoidCallback listener) {
    // TODO: implement addListener
  }

  @override
  Future<void> animateTo(double offset,
      {required Duration duration, required Curve curve}) {
    // TODO: implement animateTo
    throw UnimplementedError();
  }

  @override
  Future<void> animateToPage(int page,
      {required Duration duration, required Curve curve}) {
    // TODO: implement animateToPage
    throw UnimplementedError();
  }

  @override
  void attach(ScrollPosition position) {
    // TODO: implement attach
  }

  @override
  ScrollPosition createScrollPosition(ScrollPhysics physics,
      ScrollContext context, ScrollPosition? oldPosition) {
    // TODO: implement createScrollPosition
    throw UnimplementedError();
  }

  @override
  void debugFillDescription(List<String> description) {
    // TODO: implement debugFillDescription
  }

  @override
  // TODO: implement debugLabel
  String? get debugLabel => throw UnimplementedError();

  @override
  void detach(ScrollPosition position) {
    // TODO: implement detach
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  // TODO: implement hasClients
  bool get hasClients => throw UnimplementedError();

  @override
  // TODO: implement hasListeners
  bool get hasListeners => throw UnimplementedError();

  @override
  // TODO: implement initialPage
  int get initialPage => throw UnimplementedError();

  @override
  // TODO: implement initialScrollOffset
  double get initialScrollOffset => throw UnimplementedError();

  @override
  void jumpTo(double value) {
    // TODO: implement jumpTo
  }

  @override
  void jumpToPage(int page) {
    // TODO: implement jumpToPage
  }

  @override
  // TODO: implement keepPage
  bool get keepPage => throw UnimplementedError();

  @override
  // TODO: implement keepScrollOffset
  bool get keepScrollOffset => throw UnimplementedError();

  @override
  Future<void> nextPage({required Duration duration, required Curve curve}) {
    // TODO: implement nextPage
    throw UnimplementedError();
  }

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
  }

  @override
  // TODO: implement offset
  double get offset => throw UnimplementedError();

  @override
  // TODO: implement page
  double? get page => throw UnimplementedError();

  @override
  // TODO: implement position
  ScrollPosition get position => throw UnimplementedError();

  @override
  // TODO: implement positions
  Iterable<ScrollPosition> get positions => throw UnimplementedError();

  @override
  Future<void> previousPage(
      {required Duration duration, required Curve curve}) {
    // TODO: implement previousPage
    throw UnimplementedError();
  }

  @override
  void removeListener(VoidCallback listener) {
    // TODO: implement removeListener
  }

  @override
  // TODO: implement viewportFraction
  double get viewportFraction => throw UnimplementedError();
}

