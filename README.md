# Flutter Bootstrap

A Flutter package that provides Bootstrap-like responsive components and utilities for building beautiful and responsive Flutter applications.

> **Disclaimer**: This package is not affiliated with or endorsed by the official Bootstrap framework or Twitter, Inc.

## Author
manassehrandriamitsiry@gmail.com 🇲🇬

## Features

- 🎨 Bootstrap-style buttons with various variants and sizes
- 📱 Responsive grid system (12-column layout)
- 📝 Form components with validation
  - Input fields with different sizes and states
  - Select/Dropdown component
  - Checkbox and Radio buttons
  - Form validation
- 🎴 Cards with header and footer
- 🚨 Alert components with different styles
- 🧭 Navigation bar
- 🪟 Modal dialogs
- 📐 Responsive breakpoints system (xs, sm, md, lg, xl, xxl)
- 🎯 Bootstrap 5 color scheme

## Installation

Add this to your package's pubspec.yaml file:

```yaml
dependencies:
  flutter_bootstrap: ^0.1.0
```

## Usage

### Grid System

Create responsive layouts using the 12-column grid system:

```dart
BootstrapRow(
    children: [
        BootstrapColumn(
            xs: 12, // Full width on extra small screens
            md: 6, // Half width on medium screens
            child: YourWidget(),
            ),
            BootstrapColumn(
                xs: 12,
                md: 6,
            child: AnotherWidget(),
        ),
    ],s
)
```

### Buttons

```dart
BootstrapButton(
  text: 'Primary Button',
  variant: BootstrapButtonVariant.primary,
  size: BootstrapButtonSize.md,
  onPressed: () {
    // Handle button press
  },
)
```
### Form Components

```dart
// Text Input
BootstrapInput(
  label: 'Username',
  placeholder: 'Enter username',
  helperText: 'Your unique username',
  size: BootstrapInputSize.md,
  onChanged: (value) {
    // Handle text change
  },
)

// Select/Dropdown
BootstrapSelect(
  label: 'Country',
  options: [
    BootstrapSelectOption(value: 'us', label: 'United States'),
    BootstrapSelectOption(value: 'uk', label: 'United Kingdom'),
  ],
  onChanged: (value) {
    // Handle selection
  },
)
```

### Cards

```dart
BootstrapCard(
  header: Text('Card Title'),
  body: Text('Card content goes here'),
  footer: Row(
    children: [
      BootstrapButton(
        text: 'Action',
        variant: BootstrapButtonVariant.primary,
        onPressed: () {},
      ),
    ],
  ),
)
```

### Alerts

```dart
BootstrapAlert(
  message: 'Operation completed successfully!',
  style: BootstrapAlertStyle.success,
  onDismiss: () {
    // Handle alert dismissal
  },
)
```

### Navigation Bar

```dart
BootstrapNavbar(
  title: 'My App',
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
  actions: [
    BootstrapButton(
      text: 'Login',
      variant: BootstrapButtonVariant.outline,
      onPressed: () {},
    ),
  ],
)
```

### Modal Dialogs

```dart
BootstrapModal.show(
  context: context,
  title: 'Confirmation',
  body: Text('Are you sure you want to proceed?'),
  actions: [
    BootstrapButton(
      text: 'Cancel',
      variant: BootstrapButtonVariant.secondary,
      onPressed: () => Navigator.pop(context),
    ),
    BootstrapButton(
      text: 'Confirm',
      variant: BootstrapButtonVariant.primary,
      onPressed: () {
        // Handle confirmation
        Navigator.pop(context);
      },
    ),
  ],
);
```
## Breakpoints

The package uses Bootstrap's standard breakpoints:
- xs: 0px
- sm: 576px
- md: 768px
- lg: 992px
- xl: 1200px
- xxl: 1400px


## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
