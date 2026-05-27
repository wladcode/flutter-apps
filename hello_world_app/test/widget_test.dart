import 'package:flutter_test/flutter_test.dart';

import 'package:hello_world_app/main.dart';

void main() {
  testWidgets('Chat screen renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Chat with Chamow'), findsOneWidget);
  });
}
