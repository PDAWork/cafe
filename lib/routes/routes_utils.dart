enum Pages {
  welcome,
  error,
}

extension AppPageExtension on Pages {
  String get screenPath {
    return switch (this) {
      Pages.welcome => '/',
      Pages.error => "/error",
    };
  }

  String get screenName {
    return switch (this) {
      Pages.welcome => 'WELCOME',
      Pages.error => 'ERROR',
    };
  }
}
