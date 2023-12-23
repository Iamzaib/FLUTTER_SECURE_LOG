import 'package:get/get.dart';
import 'package:securelog/Presentation/Pages/app_start_up.dart';
import 'package:securelog/presentation/pages/app_entry.dart';
import 'package:securelog/presentation/pages/appendices/conversion_table.dart';
import 'package:securelog/presentation/pages/appendices/discription_of_person.dart';
import 'package:securelog/presentation/pages/appendices/fire_prevention.dart';
import 'package:securelog/presentation/pages/appendices/first_aid.dart';
import 'package:securelog/presentation/pages/appendices/main_appendices.dart';
import 'package:securelog/presentation/pages/appendices/national_use_of_force_framework.dart';
import 'package:securelog/presentation/pages/appendices/note_taking.dart';
import 'package:securelog/presentation/pages/appendices/patrols.dart';
import 'package:securelog/presentation/pages/appendices/phonetic_alphabet.dart';
import 'package:securelog/presentation/pages/appendices/power_of_citizen_arrest.dart';
import 'package:securelog/presentation/pages/appendices/ten_codes.dart';
import 'package:securelog/presentation/pages/appendices/whimis.dart';
import 'package:securelog/presentation/pages/bottom_nav_bar.dart';
import 'package:securelog/presentation/pages/company_report.dart';
import 'package:securelog/presentation/pages/home.dart';
import 'package:securelog/presentation/pages/splash_screen.dart';
import 'package:securelog/presentation/pages/update_profile.dart';
import 'package:securelog/presentation/widgets/company_report_details.dart';

class AppRoutes {
  static const String getAuth = '/';
  static const String bottomNavBar = '/bottomnavbar';
  static const String appStartUp = '/appstartup';
  static const String home = '/home';
  static const String appEntry = '/appentry';
  static const String reportDetails = '/reportdetails';
  static const String updateProfile = '/updateprofile';
  static const String companyReports = '/companyreports';

  //Appendencies
  static const String appendices = '/appendices';
  static const String noteTaking = '/noteTaking';
  static const String descriptionOfPerson = '/discription';
  static const String conversionTable = '/conversion';
  static const String tenCodes = '/tencodes';
  static const String phonetic = '/phonetic';
  static const String patrols = '/patrols';
  static const String fireProvention = '/fireProvention';
  static const String whimis = '/whimis';
  static const String nationalForceFramwork = '/nationalforceframwork';
  static const String citizenArrest = '/citizenArrest';
  static const String firstAid = '/firstAid';

  static final routes = [
    GetPage(name: getAuth, page: () => const SplashScreen()),
    GetPage(name: appStartUp, page: () => const StartUpScreen()),
    GetPage(name: bottomNavBar, page: () => const BotttomNavBarScreen()),
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(name: appEntry, page: () => const AppEntry()),
    GetPage(name: reportDetails, page: () => DetailScreen()),
    GetPage(name: updateProfile, page: () => const UpdateScreen()),
    GetPage(name: companyReports, page: () => const CompanyReportScreen()),

    //Appendencies
    GetPage(name: appendices, page: () => const AppendicesMain()),
    GetPage(name: noteTaking, page: () => const NoteTaking()),
    GetPage(name: descriptionOfPerson, page: () => const DiscriptionOfPerson()),
    GetPage(name: conversionTable, page: () => const ConversionTable()),
    GetPage(
        name: tenCodes,
        page: () => const TenCodes(
              tenCodes: '',
            )),
    GetPage(name: phonetic, page: () => const PhoneticAlphabit()),
    GetPage(name: patrols, page: () => const Patrols()),
    GetPage(name: fireProvention, page: () => const FireProvention()),
    GetPage(name: whimis, page: () => const Whimis()),
    GetPage(
        name: nationalForceFramwork, page: () => const NationalForceFramwork()),
    GetPage(name: citizenArrest, page: () => const PowerOfCitizenArrest()),
    GetPage(name: firstAid, page: () => const FirstAid()),
  ];
}
