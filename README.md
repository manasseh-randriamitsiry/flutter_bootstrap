# Flutter Bootstrap

A Flutter package that provides Bootstrap-like responsive components and utilities for building beautiful and responsive Flutter applications.

This is my first package, so it's not perfect and i hope its not so bad. I'm open to suggestions and improvements.

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
  - Form validation with built-in validators
  - Form state management
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
  bootstrap_flutter: ^0.0.1
```

## Usage

### Form Validation

Create forms with built-in validation:

```dart
final formKey = GlobalKey<FormState>();
final formController = BootstrapFormController();

BootstrapForm(
  formKey: formKey,
  formController: formController,
  children: [
    BootstrapInput(
      name: 'email',
      label: 'Email',
      validator: FormValidator.email,
      formController: formController,
    ),
    BootstrapInput(
      name: 'password',
      label: 'Password',
      validator: (value) {
        if (value == null || value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
      formController: formController,
    ),
    BootstrapButton(
      text: 'Submit',
      variant: BootstrapButtonVariant.primary,
      onPressed: () {
        if (formKey.currentState!.validate()) {
          // Form is valid, handle submission
          final data = formController.values;
          print(data); // {email: user@example.com, password: ****}
        }
      },
    ),
  ],
)
```

### Grid System

Create responsive layouts using the 12-column grid system:

```dart
BootstrapRow(
  children: [
    BootstrapColumn(
      xs: 12, // Full width on extra small screens
      md: 6,  // Half width on medium screens
      child: YourWidget(),
    ),
    BootstrapColumn(
      xs: 12,
      md: 6,
      child: AnotherWidget(),
    ),
  ],
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
  name: 'username',
  label: 'Username',
  placeholder: 'Enter username',
  helperText: 'Your unique username',
  size: BootstrapInputSize.md,
  formController: formController,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Username is required';
    }
    return null;
  },
)

// Select/Dropdown
BootstrapSelect(
  name: 'country',
  label: 'Country',
  formController: formController,
  options: [
    BootstrapSelectOption(value: 'us', label: 'United States'),
    BootstrapSelectOption(value: 'uk', label: 'United Kingdom'),
  ],
)

// Radio Buttons
BootstrapRadio(
  name: 'gender',
  label: 'Gender',
  formController: formController,
  options: [
    BootstrapRadioOption(value: 'male', label: 'Male'),
    BootstrapRadioOption(value: 'female', label: 'Female'),
  ],
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

## Form Validation Utilities

Built-in validators:
```dart
// Email validation
FormValidator.email

// Required field
FormValidator.required

// Min length
FormValidator.minLength(6)

// Custom validation
(value) {
  if (condition) {
    return 'Error message';
  }
  return null;
}
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request to the [GitHub repository](https://github.com/manassehrandriamitsiry/flutter_bootstrap).

## License

This project is licensed under the MIT License - see the LICENSE file for details.
