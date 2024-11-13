
import 'package:valetparking_driver/common/managers/navigation_menu/navigation_menu_cubit.dart';
import 'package:valetparking_driver/features/auth/managers/auth_cubit.dart';
import 'package:valetparking_driver/features/get_all_orders_by_specific_garage/manager/orders_in_specific_garage_cubit.dart';
import 'package:valetparking_driver/features/home/manager/home_cubit.dart';

import '../utils/constants/exports.dart';

class ValetParkingApp extends StatelessWidget {
  const ValetParkingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LocaleCubit()),
          BlocProvider(create: (context) => AuthCubit()),
          BlocProvider(create: (context) => NavigationMenuCubit()),
          BlocProvider(create: (context) => HomeCubit()),
          BlocProvider(create: (context) => OrdersInSpecificGarageCubit()),
        ],
        child: BlocBuilder<LocaleCubit, LocaleState>(
          builder: (context, localeState) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              supportedLocales: AppLocalizationsSetup.supportedLocale,
              localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
              localeListResolutionCallback:
              AppLocalizationsSetup.localeResolutionCallback,
              locale: localeState.locale,
              theme: ThemeData(
                fontFamily: localeState.locale.languageCode == 'en' ? 'Urbanist' : 'Cairo',
              ),
              onGenerateRoute: RouteGenerator.getRoute,
              // initialRoute: VRoutesName.loginAccountRoute,
              initialRoute: VRoutesName.splashRoute,
            );
          },
        ),
      ),
    );
  }
}
