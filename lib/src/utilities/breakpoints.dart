class BootstrapBreakpoints {
  static const double xs = 0;
  static const double sm = 576;
  static const double md = 768;
  static const double lg = 992;
  static const double xl = 1200;
  static const double xxl = 1400;
}

enum BootstrapScreenSize {
  xs,
  sm,
  md,
  lg,
  xl,
  xxl
}

extension BootstrapResponsive on double {
  BootstrapScreenSize get screenSize {
    if (this >= BootstrapBreakpoints.xxl) return BootstrapScreenSize.xxl;
    if (this >= BootstrapBreakpoints.xl) return BootstrapScreenSize.xl;
    if (this >= BootstrapBreakpoints.lg) return BootstrapScreenSize.lg;
    if (this >= BootstrapBreakpoints.md) return BootstrapScreenSize.md;
    if (this >= BootstrapBreakpoints.sm) return BootstrapScreenSize.sm;
    return BootstrapScreenSize.xs;
  }
} 