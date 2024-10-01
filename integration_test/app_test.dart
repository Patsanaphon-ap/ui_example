import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:presentation/src/ui/page/category/category_page.dart';
import 'package:presentation/src/ui/page/history/history_page.dart';
import 'package:presentation/src/ui/page/home/home_page.dart';
import 'package:presentation/src/ui/page/option/option_page.dart';
import 'package:presentation/src/ui/widget/my_bottom_nav.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // group('end-to-end test', () {
  //   testWidgets('tap on the floating action button, verify counter',
  //       (tester) async {
  //     // Load app widget.
  //     await tester.pumpWidget(const MyApp());

  //     await tester.pumpAndSettle();

  //     await tester.pumpWidget(const HomePage());
  //   });
  // });
  group('BottomNavBar Integration Test', () {
    testWidgets('Verify bottom navigation items and page switching',
        (WidgetTester tester) async {
      // Arrange: Build the BottomNavBar widget
      await tester.pumpWidget(MaterialApp(home: BottomNavBar()));

      // Assert: Verify HomePage is displayed initially
      expect(find.byType(HomePage), findsOneWidget);

      // Act: Tap on the category icon and switch to CategoryPage
      await tester.tap(find.byIcon(Icons.list_outlined));
      await tester.pumpAndSettle();
      expect(find.byType(CategoryPage), findsOneWidget);

      // // Act: Tap on the history icon and switch to HistoryPage
      await tester.tap(find.byIcon(Icons.history));
      await tester.pumpAndSettle();
      expect(find.byType(HistoryPage), findsOneWidget);

      // // Act: Tap on the settings icon and switch to OptionPage
      await tester.tap(find.byIcon(Icons.settings));
      await tester.pumpAndSettle();
      expect(find.byType(OptionPage), findsOneWidget);
    });
  });
}
