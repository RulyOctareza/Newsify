import 'package:get/get.dart';
import 'package:newsify/bindings/boomark_binding.dart';
import 'package:newsify/bindings/auth_controller_bindings.dart';

import 'package:newsify/bindings/news_bindings.dart';
import 'package:newsify/bindings/search_news_bindings.dart';
import 'package:newsify/pages/contact/contact_us_page.dart';

import 'package:newsify/pages/detail/detail_page_news.dart';
import 'package:newsify/pages/news/news_page.dart';
import 'package:newsify/pages/menu/menu.dart';
import 'package:newsify/pages/onboarding/loading/loading_page.dart';
import 'package:newsify/pages/onboarding/login/login_page.dart';
import 'package:newsify/pages/onboarding/onboarding_page_one.dart';
import 'package:newsify/pages/onboarding/onboarding_page_three.dart';
import 'package:newsify/pages/onboarding/onboarding_page_two.dart';
import 'package:newsify/pages/onboarding/signup/signup_page.dart';
import 'package:newsify/pages/saved/saved_page.dart';
import 'package:newsify/pages/search/search_page.dart';
import 'package:newsify/pages/settings/setting_profile_page.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: '/',
      page: () => LoadingPage(),
      binding: AuthControllerBindings(),
    ),
    GetPage(name: '/onboarding1', page: () => OnboardingPageOne()),
    GetPage(name: '/onboarding2', page: () => OnboardingPageTwo()),
    GetPage(name: '/onboarding3', page: () => OnboardingPageThree()),
    GetPage(name: '/login', page: () => LoginPage()),
    GetPage(name: '/signup', page: () => SignUpPage()),
    GetPage(name: '/contact', page: () => ContactUsPage()),
    GetPage(
      name: '/homepage',
      page: () => NewsPage(),
      bindings: [AuthControllerBindings(), NewsBindings(), BoomarkBinding()],
    ),
    GetPage(
      name: '/menu',
      page: () => Menu(),
      binding: AuthControllerBindings(),
    ),
    GetPage(
      name: '/setting',
      page: () => SettingProfilePage(),
      bindings: [AuthControllerBindings()],
    ),
    GetPage(
      name: '/detail',
      page: () {
        final String newsUrl = Get.arguments;
        return DetailPageNews(newsUrl: newsUrl);
      },
    ),
    GetPage(name: '/saved', page: () => SavedPage()),
    GetPage(
      name: '/searchpage',
      page: () => SearchPage(),
      binding: SearchNewsBindings(),
    ),
  ];
}
