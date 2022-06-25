import 'package:flutter_svg/flutter_svg.dart';
import 'package:ptirex/app/companies/companies.dart';
import 'package:ptirex/app/home/home.dart';
import 'package:ptirex/app/login/login.dart';
import 'package:ptirex/app/posts/posts.dart';
import 'package:ptirex/app/register/register.dart';
import 'package:ptirex/app/solutions/solutions.dart';
import 'package:ptirex/main.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

part 'app_routes.dart';

/// contains all configuration pages
class AppPages {
  /// when the app is opened, this page will be the first to be shown
  static const initial = Routes.root;

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _Paths.login:
        return GetPageRoute(
          settings: settings,
          page: () => const LoginScreen(),
          binding: LoginBinding(),
          transition: Transition.noTransition,
        );
      case _Paths.home:
        return GetPageRoute(
          settings: settings,
          page: () => HomeScreen(),
          binding: HomeBinding(),
          transition: Transition.noTransition,
        );
      case _Paths.root:
        return GetPageRoute(
          settings: const RouteSettings(name: _Paths.home),
          page: () => HomeScreen(),
          binding: HomeBinding(),
          transition: Transition.noTransition,
        );
      case _Paths.register:
        return GetPageRoute(
          settings: const RouteSettings(name: _Paths.register),
          page: () => RegisterScreen(),
          binding: RegisterBinding(),
          transition: Transition.noTransition,
        );
      case _Paths.posts:
        return GetPageRoute(
          settings: const RouteSettings(name: _Paths.posts),
          page: () => PostsScreen(),
          binding: PostsBinding(),
          transition: Transition.noTransition,
        );
      case _Paths.companies:
        return GetPageRoute(
          settings: const RouteSettings(name: _Paths.companies),
          page: () => CompaniesScreen(),
          binding: CompaniesBinding(),
          transition: Transition.noTransition,
        );
      case _Paths.solutions:
        return GetPageRoute(
          settings: const RouteSettings(name: _Paths.solutions),
          page: () => SolutionsScreen(),
          binding: SolutionsBinding(),
          transition: Transition.noTransition,
        );
    }
    return GetPageRoute(
      settings: settings,
      page: () => Padding(
        padding: const EdgeInsets.all(20),
        child: Align(
          alignment: Alignment.center,
          child: SvgPicture.asset(
            "assets/svg/404.svg",
          ),
        ),
      ),
      transition: Transition.noTransition,
    );
  }
}
