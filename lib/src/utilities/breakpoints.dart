class Breakpoints {
  static const double xs = 0;
  static const double sm = 576;
  static const double md = 768;
  static const double lg = 992;
  static const double xl = 1200;
  static const double xxl = 1400;

  static bool isXs(double width) => width >= xs && width < sm;
  static bool isSm(double width) => width >= sm && width < md;
  static bool isMd(double width) => width >= md && width < lg;
  static bool isLg(double width) => width >= lg && width < xl;
  static bool isXl(double width) => width >= xl && width < xxl;
  static bool isXxl(double width) => width >= xxl;
} 