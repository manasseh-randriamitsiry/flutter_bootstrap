import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bootstrap/bootstrap.dart';

void main() {
  group('BootstrapButton Tests', () {
    testWidgets('renders button with default props', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BootstrapButton(
            text: 'Test Button',
            onPressed: () {},
          ),
        ),
      );

      expect(find.text('Test Button'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets('disabled button is not clickable', (WidgetTester tester) async {
      bool wasPressed = false;
      await tester.pumpWidget(
        MaterialApp(
          home: BootstrapButton(
            text: 'Disabled Button',
            onPressed: () => wasPressed = true,
            disabled: true,
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      expect(wasPressed, false);
    });
  });

  group('BootstrapAlert Tests', () {
    testWidgets('renders alert with message', (WidgetTester tester) async {
      const testMessage = 'Test Alert';
      await tester.pumpWidget(
        const MaterialApp(
          home: Material(
            child: BootstrapAlert(
              message: testMessage,
              style: BootstrapAlertStyle.primary,
            ),
          ),
        ),
      );

      expect(find.text(testMessage), findsOneWidget);
    });

    testWidgets('alert can be dismissed', (WidgetTester tester) async {
      bool wasDismissed = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: BootstrapAlert(
              message: 'Dismissible Alert',
              onDismiss: () => wasDismissed = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.close));
      expect(wasDismissed, true);
    });
  });

  group('BootstrapGrid Tests', () {
    testWidgets('renders row with columns', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BootstrapRow(
            children: [
              BootstrapColumn(
                xs: 12,
                md: 6,
                child: Container(key: const Key('column1')),
              ),
              BootstrapColumn(
                xs: 12,
                md: 6,
                child: Container(key: const Key('column2')),
              ),
            ],
          ),
        ),
      );

      expect(find.byKey(const Key('column1')), findsOneWidget);
      expect(find.byKey(const Key('column2')), findsOneWidget);
    });
  });

  group('BootstrapInput Tests', () {
    testWidgets('renders input with label', (WidgetTester tester) async {
      const testLabel = 'Test Label';
      await tester.pumpWidget(
        const MaterialApp(
          home: Material(
            child: BootstrapInput(
              label: testLabel,
              placeholder: 'Enter text',
            ),
          ),
        ),
      );

      expect(find.text(testLabel), findsOneWidget);
    });

    testWidgets('input handles text changes', (WidgetTester tester) async {
      String? changedValue;
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: BootstrapInput(
              onChanged: (value) => changedValue = value,
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), 'test input');
      expect(changedValue, 'test input');
    });
  });

  group('BootstrapCard Tests', () {
    testWidgets('renders card with all sections', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BootstrapCard(
            header: const Text('Header'),
            body: const Text('Body'),
            footer: const Text('Footer'),
          ),
        ),
      );

      expect(find.text('Header'), findsOneWidget);
      expect(find.text('Body'), findsOneWidget);
      expect(find.text('Footer'), findsOneWidget);
    });
  });

  group('BootstrapNavbar Tests', () {
    testWidgets('renders navbar with items', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BootstrapNavbar(
            title: 'Test Nav',
            items: [
              BootstrapNavItem(
                label: 'Item 1',
                onTap: () {},
              ),
              BootstrapNavItem(
                label: 'Item 2',
                onTap: () {},
              ),
            ],
          ),
        ),
      );

      expect(find.text('Test Nav'), findsOneWidget);
      expect(find.text('Item 1'), findsOneWidget);
      expect(find.text('Item 2'), findsOneWidget);
    });
  });

  group('BootstrapModal Tests', () {
    testWidgets('shows modal dialog', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              return ElevatedButton(
                onPressed: () {
                  BootstrapModal.show(
                    context: context,
                    title: 'Test Modal',
                    body: const Text('Modal Content'),
                  );
                },
                child: const Text('Show Modal'),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Show Modal'));
      await tester.pumpAndSettle();

      expect(find.text('Test Modal'), findsOneWidget);
      expect(find.text('Modal Content'), findsOneWidget);
    });
  });
}
