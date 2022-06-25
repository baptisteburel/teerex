part of 'app_pages.dart';

/// used to switch pages
class Routes {
  static const home = _Paths.home;
  static const login = _Paths.login;
  static const root = _Paths.root;
  static const posts = _Paths.posts;
  static const companies = _Paths.companies;
  static const solutions = _Paths.solutions;
  static const register = _Paths.register;
}

/// contains a list of route names.
// made separately to make it easier to manage route naming
class _Paths {
  static const home = '/home';
  static const login = '/login';
  static const root = '/';
  static const posts = '/posts';
  static const register = '/register';
  static const solutions = '/solutions';
  static const companies = '/companies';
  // Example :
  // static const index = '/';
  // static const splash = '/splash';
  // static const product = '/product';
}
