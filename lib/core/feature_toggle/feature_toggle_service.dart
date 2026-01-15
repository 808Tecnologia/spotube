/// A service to manage feature flags/toggles.
///
/// This allows enabling/disabling features dynamically. For the "Free-First,
/// Premium-Ready" strategy, this will be used to differentiate between
/// free and premium features.
class FeatureToggleService {
  /// A simple flag to determine if premium features are enabled.
  ///
  /// In a real-world scenario, this would be determined by a remote config,
  /// user authentication, or a license key.
  final bool isPremiumEnabled;

  FeatureToggleService({this.isPremiumEnabled = false});
}
