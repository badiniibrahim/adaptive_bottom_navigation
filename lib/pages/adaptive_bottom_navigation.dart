import 'dart:io';
import 'package:adaptive_bottom_navigation/controller/adaptive_bottom_navigation_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// A widget that displays an adaptive bottom navigation bar depending on the platform.
///
/// The [icons], [pages], and [labels] parameters must not be null.
/// The [iconSize], [backgroundColor], [selectedColor], [unselectedColor], [animationDuration],
/// [animationIndicatorCurve], [animationIconCurve], [indicatorDecoration], [itemDecoration],
/// [bottomNavigationDecoration], [height], [indicatorHeight], and [indicatorSpaceBottom]
/// parameters control the appearance and behavior of the bottom navigation bar.
///
/// Example usage:
/// ```dart
/// AdaptiveBottomNavigation(
///   icons: [Icons.home, Icons.search, Icons.person],
///   labels: ['Home', 'Search', 'Profile'],
///   pages: [HomePage(), SearchPage(), ProfilePage()],
///   selectedColor: Colors.blue,
///   unselectedColor: Colors.grey,
///   backgroundColor: Colors.white,
///   iconSize: 30.0,
///   animationDuration: Duration(milliseconds: 300),
///   animationIndicatorCurve: Curves.easeIn,
///   animationIconCurve: Curves.easeOut,
///   indicatorDecoration: BoxDecoration(
///     color: Colors.blue,
///     borderRadius: BorderRadius.circular(10),
///   ),
///   itemDecoration: BoxDecoration(
///     border: Border(
///       top: BorderSide(color: Colors.grey, width: 0.5),
///     ),
///   ),
///   bottomNavigationDecoration: BoxDecoration(
///     boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
///   ),
///   height: 60.0,
///   indicatorHeight: 4.0,
///   indicatorSpaceBottom: 2.0,
/// );
/// ```
class AdaptiveBottomNavigation
    extends GetView<AdaptiveBottomNavigationController> {
  /// The size of the icons in the navigation bar.
  final double iconSize;

  /// The list of icons to display in the navigation bar.
  final List<IconData> icons;

  /// The list of labels corresponding to each icon.
  final List<String> labels;

  /// The list of pages corresponding to each navigation item.
  final List<Widget> pages;

  /// The color of the selected icon.
  final Color selectedColor;

  /// The color of the unselected icons.
  final Color unselectedColor;

  /// The background color of the navigation bar.
  final Color backgroundColor;

  /// The duration of the animation when switching tabs.
  final Duration animationDuration;

  /// The curve for the indicator animation.
  final Curve animationIndicatorCurve;

  /// The curve for the icon animation.
  final Curve animationIconCurve;

  /// The decoration for the indicator.
  final BoxDecoration? indicatorDecoration;

  /// The decoration for each item in the navigation bar.
  final BoxDecoration? itemDecoration;

  /// The decoration for the entire bottom navigation bar.
  final BoxDecoration? bottomNavigationDecoration;

  /// The height of the navigation bar.
  final double height;

  /// The height of the indicator.
  final double indicatorHeight;

  /// The space between the indicator and the bottom of the navigation bar.
  final double indicatorSpaceBottom;

  /// Creates an [AdaptiveBottomNavigation].
  ///
  /// The [icons], [labels], and [pages] parameters must not be null.
  /// The [iconSize], [backgroundColor], [selectedColor], [unselectedColor], [animationDuration],
  /// [animationIndicatorCurve], [animationIconCurve], [indicatorDecoration], [itemDecoration],
  /// [bottomNavigationDecoration], [height], [indicatorHeight], and [indicatorSpaceBottom]
  /// parameters control the appearance and behavior of the bottom navigation bar.
  ///
  /// Throws an [AssertionError] if [icons], [labels], and [pages] lengths do not match.
  const AdaptiveBottomNavigation({
    super.key,
    this.iconSize = 24.0,
    required this.icons,
    required this.labels,
    required this.pages,
    this.selectedColor = Colors.black,
    this.unselectedColor = Colors.black38,
    this.backgroundColor = Colors.white,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationIndicatorCurve = Curves.easeIn,
    this.animationIconCurve = Curves.easeOut,
    this.indicatorDecoration,
    this.itemDecoration,
    this.bottomNavigationDecoration,
    this.height = 60.0,
    this.indicatorHeight = 4.0,
    this.indicatorSpaceBottom = 2.0,
  })  : assert(icons.length == labels.length,
            'Icons and labels length must be the same'),
        assert(icons.length == pages.length,
            'Icons and pages length must be the same');

  @override
  Widget build(BuildContext context) {
    // Obtain the controller instance
    final controller = Get.put(AdaptiveBottomNavigationController());

    return Obx(
      () {
        return Container(
          height: height,
          decoration: bottomNavigationDecoration,
          child: Scaffold(
            backgroundColor: backgroundColor,
            body: pages[controller.selectedIndex.value],
            bottomNavigationBar: Platform.isIOS
                ? CupertinoTabBar(
                    backgroundColor: backgroundColor,
                    items: List<BottomNavigationBarItem>.generate(
                      icons.length,
                      (index) => BottomNavigationBarItem(
                        icon: Icon(
                          icons[index],
                          size: iconSize,
                          color: controller.selectedIndex.value == index
                              ? selectedColor
                              : unselectedColor,
                        ),
                        label: labels[index],
                      ),
                    ),
                    currentIndex: controller.selectedIndex.value,
                    onTap: controller.onItemTapped,
                    activeColor: selectedColor,
                    inactiveColor: unselectedColor,
                  )
                : BottomNavigationBar(
                    backgroundColor: backgroundColor,
                    items: List<BottomNavigationBarItem>.generate(
                      icons.length,
                      (index) => BottomNavigationBarItem(
                        icon: Icon(
                          icons[index],
                          size: iconSize,
                          color: controller.selectedIndex.value == index
                              ? selectedColor
                              : unselectedColor,
                        ),
                        label: labels[index],
                      ),
                    ),
                    currentIndex: controller.selectedIndex.value,
                    onTap: controller.onItemTapped,
                    selectedItemColor: selectedColor,
                    unselectedItemColor: unselectedColor,
                  ),
          ),
        );
      },
    );
  }
}
