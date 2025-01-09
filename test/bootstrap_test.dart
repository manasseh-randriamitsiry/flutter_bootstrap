import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bootstrap_flutter/bootstrap.dart';
import 'package:bootstrap_flutter/src/components/form/form_controller.dart';
import 'package:bootstrap_flutter/src/utilities/form_validator.dart';

void main() {
  group('BootstrapButton Tests', () {
    testWidgets('renders button with text', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BootstrapButton(
            text: 'Test Button',
            onPressed: () {},
          ),
        ),
      );

      expect(find.text('Test Button'), findsOneWidget);
    });

    testWidgets('handles button press', (WidgetTester tester) async {
      bool pressed = false;
      await tester.pumpWidget(
        MaterialApp(
          home: BootstrapButton(
            text: 'Test Button',
            onPressed: () => pressed = true,
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      expect(pressed, true);
    });

    testWidgets('disabled button does not trigger onPressed', (WidgetTester tester) async {
      bool pressed = false;
      await tester.pumpWidget(
        MaterialApp(
          home: BootstrapButton(
            text: 'Test Button',
            disabled: true,
            onPressed: () => pressed = true,
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      expect(pressed, false);
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

  group('BootstrapForm Tests', () {
    testWidgets('form validates inputs', (WidgetTester tester) async {
      final controller = BootstrapFormController();
      final formKey = GlobalKey<FormState>();
      
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: BootstrapForm(
              formController: controller,
              formKey: formKey,
              children: [
                BootstrapInput(
                  name: 'email',
                  label: 'Email',
                  validator: FormValidator.email,
                  formController: controller,
                ),
              ],
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextFormField), 'invalid-email');
      await tester.pump();

      expect(controller.getError('email'), isNotNull);
      expect(formKey.currentState!.validate(), false);
    });
  });

  group('BootstrapAlert Tests', () {
    testWidgets('renders alert with message', (WidgetTester tester) async {
      const testMessage = 'Test Alert';
      await tester.pumpWidget(
        const MaterialApp(
          home: BootstrapAlert(
            message: testMessage,
            style: BootstrapAlertStyle.success,
          ),
        ),
      );

      expect(find.text(testMessage), findsOneWidget);
    });

    testWidgets('handles dismiss', (WidgetTester tester) async {
      bool dismissed = false;
      await tester.pumpWidget(
        MaterialApp(
          home: BootstrapAlert(
            message: 'Test Alert',
            onDismiss: () => dismissed = true,
          ),
        ),
      );

      await tester.tap(find.byType(IconButton));
      expect(dismissed, true);
    });
  });

  group('BootstrapModal Tests', () {
    testWidgets('renders modal with title and body', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) => BootstrapButton(
              text: 'Open Modal',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => BootstrapModal(
                    title: 'Test Modal',
                    body: const Text('Modal Content'),
                  ),
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open Modal'));
      await tester.pumpAndSettle();

      expect(find.text('Test Modal'), findsOneWidget);
      expect(find.text('Modal Content'), findsOneWidget);
    });
  });

  group('BootstrapNavbar Tests', () {
    testWidgets('renders navbar with title and items', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BootstrapNavbar(
            title: 'Test Nav',
            items: [
              BootstrapNavItem(
                label: 'Home',
                onTap: () {},
              ),
              BootstrapNavItem(
                label: 'About',
                onTap: () {},
              ),
            ],
          ),
        ),
      );

      expect(find.text('Test Nav'), findsOneWidget);
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('About'), findsOneWidget);
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
}
