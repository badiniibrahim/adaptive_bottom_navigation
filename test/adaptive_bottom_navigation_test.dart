import 'package:adaptive_botton_navigatione/pages/adaptive_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  group('AdaptiveBottomNavigation', () {
    testWidgets('displays the correct number of icons',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        GetMaterialApp(
          home: AdaptiveBottomNavigation(
            icons: const [Icons.home, Icons.search, Icons.person],
            labels: const ['Home', 'Search', 'Profile'],
            pages: [Container(), Container(), Container()],
          ),
        ),
      );

      // Verify the number of icons
      expect(find.byIcon(Icons.home), findsOneWidget);
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.person), findsOneWidget);
    });

    testWidgets('navigates to the correct page on tap',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        GetMaterialApp(
          home: AdaptiveBottomNavigation(
            icons: const [Icons.home, Icons.search, Icons.person],
            labels: const ['Home', 'Search', 'Profile'],
            pages: const [
              Center(child: Text('Home Page')),
              Center(child: Text('Search Page')),
              Center(child: Text('Profile Page')),
            ],
          ),
        ),
      );

      // Tap on the Search icon
      await tester.tap(find.byIcon(Icons.search));
      await tester.pumpAndSettle();

      // Verify the correct page is displayed
      expect(find.text('Search Page'), findsOneWidget);

      // Tap on the Profile icon
      await tester.tap(find.byIcon(Icons.person));
      await tester.pumpAndSettle();

      // Verify the correct page is displayed
      expect(find.text('Profile Page'), findsOneWidget);

      // Tap on the Home icon
      await tester.tap(find.byIcon(Icons.home));
      await tester.pumpAndSettle();

      // Verify the correct page is displayed
      expect(find.text('Home Page'), findsOneWidget);
    });

    testWidgets('applies custom colors and sizes', (WidgetTester tester) async {
      await tester.pumpWidget(
        GetMaterialApp(
          home: AdaptiveBottomNavigation(
            icons: const [Icons.home, Icons.search, Icons.person],
            labels: const ['Home', 'Search', 'Profile'],
            pages: [Container(), Container(), Container()],
            selectedColor: Colors.blue,
            unselectedColor: Colors.grey,
            backgroundColor: Colors.white,
            iconSize: 30.0,
          ),
        ),
      );

      // Verify the custom icon size
      final icon = tester.firstWidget(find.byIcon(Icons.home)) as Icon;
      expect(icon.size, 30.0);

      // Verify the custom colors
      await tester.tap(find.byIcon(Icons.home));
      await tester.pumpAndSettle();
      expect(icon.color, Colors.blue);

      final unselectedIcon =
          tester.firstWidget(find.byIcon(Icons.search)) as Icon;
      expect(unselectedIcon.color, Colors.grey);
    });

    testWidgets('renders BottomNavigationBar on Android',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        GetMaterialApp(
          home: AdaptiveBottomNavigation(
            icons: const [Icons.home, Icons.search, Icons.person],
            labels: const ['Home', 'Search', 'Profile'],
            pages: [Container(), Container(), Container()],
          ),
        ),
      );

      // Verify the BottomNavigationBar is used on Android
      expect(find.byType(BottomNavigationBar), findsOneWidget);
    });
  });
}
