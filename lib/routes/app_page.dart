//app_pages

import 'package:get/get.dart';
import 'package:get_solution/view/bottomNavigationPage/bottom_navigation.dart';
import 'package:get_solution/view/dashboardPage/dashboard.dart';
import 'package:get_solution/view/depositPage/add_deposit.dart';
import 'package:get_solution/view/depositPage/deposit_history.dart';
import 'package:get_solution/view/homePage/home_page.dart';
import 'package:get_solution/view/onBoardingPage/otpPage/otp_screen.dart';
import 'package:get_solution/view/ordersPage/order_screen.dart';
import 'package:get_solution/view/profilePage/favoritePage/favorite_list.dart';
import 'package:get_solution/view/profilePage/reportPage/report.dart';
import 'package:get_solution/view/profilePage/settingPage/setting.dart';
import 'package:get_solution/view/profilePage/transactionPage/transaction_history.dart';
import '../controller/binding.dart';
import '../view/onBoardingPage/loginPage/login_page.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
        name: AppRoutes.home, page: () => HomePage(), binding: HomeBinding()),
    GetPage(
        name: AppRoutes.loginPage,
        page: () => LoginScreen(),
        binding: HomeBinding()),
    GetPage(
        name: AppRoutes.otpPage,
        page: () => OtpScreen(),
        binding: HomeBinding()),
    GetPage(
        name: AppRoutes.ordersPage,
        page: () => OrderScreen(),
        binding: HomeBinding()),
    GetPage(
        name: AppRoutes.addDepositPage,
        page: () => AddDepositPage(),
        binding: HomeBinding()),
    GetPage(
        name: AppRoutes.depositHistoryPage,
        page: () => DepositHistorPage(),
        binding: HomeBinding()),
    GetPage(
        name: AppRoutes.bottomNavigationPage,
        page: () => BottomNavigationPage(),
        binding: HomeBinding()),
    GetPage(
        name: AppRoutes.transactionHistoryPage,
        page: () => PageTransactionHistory(),
        binding: HomeBinding()),
    GetPage(
        name: AppRoutes.dashBoardpage,
        page: () => DashBoard(),
        binding: HomeBinding()),
    GetPage(
        name: AppRoutes.favoriteListPage,
        page: () => FavoriteListPage(),
        binding: HomeBinding()),
    GetPage(
        name: AppRoutes.reportPage,
        page: () => ReportPage(),
        binding: HomeBinding()),
    GetPage(
        name: AppRoutes.settingPage,
        page: () => Settings(),
        binding: HomeBinding()),
  ];
}
