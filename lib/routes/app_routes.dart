import 'package:stsp_app/presentation/add_occupational_accident_screen/add_occupational_accident_screen.dart';
import 'package:stsp_app/presentation/add_occupational_accident_screen/binding/add_occupational_accident_binding.dart';
import 'package:stsp_app/presentation/add_construction_site_screen/add_construction_site_screen.dart';
import 'package:stsp_app/presentation/add_construction_site_screen/binding/add_construction_site_binding.dart';
import 'package:stsp_app/presentation/album_form_screen/album_form_screen.dart';
import 'package:stsp_app/presentation/album_form_screen/binding/album_form_binding.dart';
import 'package:stsp_app/presentation/album_screen/album_screen.dart';
import 'package:stsp_app/presentation/album_screen/binding/album_binding.dart';
import 'package:stsp_app/presentation/building_screen/binding/building_binding.dart';
import 'package:stsp_app/presentation/building_screen/building_screen.dart';
import 'package:stsp_app/presentation/earthquake_bulletin_screen/earthquake_bulletin_screen.dart';
import 'package:stsp_app/presentation/earthquake_bulletin_screen/binding/earthquake_bulletin_binding.dart';
import 'package:stsp_app/presentation/factory_list_screen/binding/factory_list_binding.dart';
import 'package:stsp_app/presentation/factory_list_screen/factory_list_screen.dart';
import 'package:stsp_app/presentation/home_screen/home_screen.dart';
import 'package:stsp_app/presentation/home_screen/binding/home_binding.dart';
import 'package:stsp_app/presentation/login_screen/login_screen.dart';
import 'package:stsp_app/presentation/login_screen/binding/login_binding.dart';
import 'package:stsp_app/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:stsp_app/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:get/get.dart';
import 'package:stsp_app/presentation/model_3d_screen/binding/model_3d_binding.dart';
import 'package:stsp_app/presentation/model_3d_screen/model_3d_screen.dart';

class AppRoutes {
  static String addOccupationalAccidentScreen =
      '/add_occupational_accident_screen';

  static String buildingScreen = '/building_screen';

  static String addConstructionSiteScreen = '/add_construction_site_screen';

  static String earthquakeBulletinScreen = '/earthquake_bulletin_screen';

  static String homeScreen = '/home_screen';

  static String loginScreen = '/login_screen';

  static String appNavigationScreen = '/app_navigation_screen';

  static String initialRoute = '/initialRoute';

  static String albumScreen = '/album_screen';

  static String albumFormScreen = '/album_form_screen';

  static String factoryListScreen = '/factory_list_screen';

  static String model3dScreen = '/model_3d_screen';

  static List<GetPage> pages = [
    GetPage(
      name: addOccupationalAccidentScreen,
      page: () => AddOccupationalAccidentScreen(),
      bindings: [
        AddOccupationalAccidentBinding(),
      ],
    ),
    GetPage(
      name: addConstructionSiteScreen,
      page: () => AddConstructionSiteScreen(),
      bindings: [
        AddConstructionSiteBinding(),
      ],
    ),
    GetPage(
      name: earthquakeBulletinScreen,
      page: () => EarthquakeBulletinScreen(),
      bindings: [
        EarthquakeBulletinBinding(),
      ],
    ),
    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
      bindings: [
        HomeBinding(),
      ],
    ),
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      bindings: [
        LoginBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => LoginScreen(),
      bindings: [
        LoginBinding(),
      ],
      
    ),
    GetPage(
      name: buildingScreen,
      page: () => BuildingScreen(),
      bindings: [
        BuildingBinding(),
      ],
    ),
    GetPage(
      name: albumScreen,
      page: () => AlbumScreen(),
      bindings: [
        AlbumBinding(),
      ],
    ),
    GetPage(
      name: albumFormScreen,
      page: () => AlbumFormScreen(),
      bindings: [
        AlbumFormBinding(),
      ],
    ),
    GetPage(
      name: factoryListScreen,
      page: () => FactoryListScreen(),
      bindings: [
        FactoryListBinding(),
      ],
    ),
    GetPage(
      name: model3dScreen,
      page: () => Model3DScreen(),
      bindings: [
        Model3DBinding(),
      ],
    )
  ];
}
