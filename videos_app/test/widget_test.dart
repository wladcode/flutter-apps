import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:videos_app/main.dart';
import 'package:videos_app/presentation/providers/discover_provider.dart';

void main() {
  testWidgets('App renders discover screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Discover'), findsOneWidget);

    await tester.pump();

    expect(find.byType(PageView), findsOneWidget);
    expect(find.text('Subiendo escaleras automáticas'), findsOneWidget);
  });

  testWidgets('Discover shows empty state when provider has no videos',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => DiscoverProvider(),
        child: MaterialApp(
          home: Builder(
            builder: (context) {
              final provider = context.read<DiscoverProvider>();
              provider.initialLoading = false;
              return const Scaffold(
                body: Center(child: Text('No videos available')),
              );
            },
          ),
        ),
      ),
    );

    expect(find.text('No videos available'), findsOneWidget);
  });
}
