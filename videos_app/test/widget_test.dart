import 'package:flutter_test/flutter_test.dart';

import 'package:videos_app/main.dart';

void main() {
  testWidgets('App renders discover screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump();

    expect(find.text('Discover'), findsOneWidget);
  });
}
