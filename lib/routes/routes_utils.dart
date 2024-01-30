enum Pages {
  welcome,
  home,
  error,
}

extension AppPageExtension on Pages {
  String get screenPath {
    return switch (this) {
      Pages.welcome => '/',
      Pages.home => '/home',
      Pages.error => "/error",
    };
  }

  String get screenName {
    return switch (this) {
      Pages.welcome => 'WELCOME',
      Pages.home => 'HOME',
      Pages.error => 'ERROR',
    };
  }
}
