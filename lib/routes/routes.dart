import 'package:get/get_navigation/get_navigation.dart';
import 'package:newsify/screens/detail/detail_page_news.dart';
import 'package:newsify/screens/home/home_page.dart';
import 'package:newsify/screens/menu/menu.dart';
import 'package:newsify/screens/onboarding/loading/loading_page.dart';
import 'package:newsify/screens/onboarding/login/login_page.dart';
import 'package:newsify/screens/onboarding/onboarding_page_one.dart';
import 'package:newsify/screens/onboarding/onboarding_page_three.dart';
import 'package:newsify/screens/onboarding/onboarding_page_two.dart';
import 'package:newsify/screens/onboarding/signup/signup_page.dart';
import 'package:newsify/screens/saved/saved_page.dart';
import 'package:newsify/screens/settings/setting_profile_page.dart';

final routes = [
  GetPage(name: '/', page: () => LoadingPage()),
  GetPage(name: '/onboarding1', page: () => OnboardingPageOne()),
  GetPage(name: '/onboarding2', page: () => OnboardingPageTwo()),
  GetPage(name: '/onboarding3', page: () => OnboardingPageThree()),
  GetPage(name: '/login', page: () => LoginPage()),
  GetPage(name: '/signup', page: () => SignUpPage()),
  GetPage(name: '/homepage', page: () => HomePage()),
  GetPage(name: '/menu', page: () => Menu()),
  GetPage(name: '/setting', page: () => SettingProfilePage()),
  GetPage(name: '/detail', page: () => DetailPageNews()),
  GetPage(name: '/saved', page: () => SavedPage()),
];
