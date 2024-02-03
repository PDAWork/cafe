enum Pages {
  welcome,
  home,
  itemMenu,
  profile,
  error,
}

extension AppPageExtension on Pages {
  String get screenPath {
    return switch (this) {
      Pages.welcome => '/',
      Pages.home => '/home',
      Pages.profile => 'profile',
      Pages.error => "/error",
      Pages.itemMenu => 'item_menu',
    };
  }

  String get screenName {
    return switch (this) {
      Pages.welcome => 'WELCOME',
      Pages.home => 'HOME',
      Pages.error => 'ERROR',
      Pages.itemMenu => "ITEMMENU",
      Pages.profile => 'PROFILE',
    };
  }
}
