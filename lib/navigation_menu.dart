import 'package:valetparking_driver/common/managers/navigation_menu/navigation_menu_cubit.dart';
import 'package:valetparking_driver/features/get_all_orders_by_specific_garage/manager/orders_in_specific_garage_cubit.dart';
import 'package:valetparking_driver/features/get_all_orders_by_specific_garage/presentation/screens/get_all_orders_by_specific_garage_screen.dart';
import 'package:valetparking_driver/features/home/manager/home_cubit.dart';
import 'package:valetparking_driver/features/home/presentation/screens/home_screen.dart';
import 'package:valetparking_driver/features/profile/presentation/screens/profile_screen.dart';
import 'package:valetparking_driver/utils/constants/exports.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key, required this.index});

  final int index;

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int currentIndex = 0;

  @override
  void initState() {
    // ProfileCubit.get(context).getProfileDataFunction();
    OrdersInSpecificGarageCubit.get(context).getAllOrdersFunction(
      status: 'ongoing',
      garageId: VCacheHelper.getString(
        key: CacheKeys.garageId,
      ),
    );
    // BookingCubit.get(context).getAllOrdersFunction(status: 'ongoing');
    super.initState();
    currentIndex = widget.index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List tabs = [
      const HomeScreen(),
      const GetAllOrdersBySpecificGarageScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      backgroundColor: VColors.whiteColor,
      body: BlocConsumer<NavigationMenuCubit, NavigationMenuState>(
        listener: (context, state) {
          if (state is MakeGarageActiveOrNotSuccessState) {
            FloatingSnackBar.show(
              context: context,
              message: state.message!,
              textColor: Colors.white,
              duration: const Duration(milliseconds: 4000),
              backgroundColor: VColors.success,
            );
          } else if (state is MakeGarageActiveOrNotErrorState) {
            FloatingSnackBar.show(
              context: context,
              message: state.message!,
              textColor: Colors.white,
              duration: const Duration(milliseconds: 4000),
              backgroundColor: VColors.error,
            );
          }
        },
        builder: (context, state) {
          var makeActiveOrNot = NavigationMenuCubit.get(context);

          return NestedScrollView(
            physics: const BouncingScrollPhysics(),
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  elevation: 0,
                  backgroundColor: VColors.whiteColor,
                  title: Padding(
                    padding: EdgeInsets.only(right: 24.w),
                    child: Text(
                      currentIndex == 0
                          ? "${AppLocalizations.of(context)!.translate('home')}"
                          : currentIndex == 1
                              ? "${AppLocalizations.of(context)!.translate('allOrders')}"
                              : currentIndex == 2
                                  ? '${AppLocalizations.of(context)!.translate('profile')}'
                                  : '',
                      style: VStyles.h4Bold(context),
                    ),
                  ),
                  leading: Padding(
                    padding: EdgeInsets.only(left: 24.w),
                    child: SvgPicture.asset(VImages.appBarIcon, width: 32.w),
                  ),
                  floating: true,
                  pinned: true,
                  actions: [
                    GestureDetector(
                      onTap: () {
                        final RenderBox overlay = Overlay.of(context)
                            .context
                            .findRenderObject() as RenderBox;
                        showMenu(
                          context: context,
                          color: VColors.whiteColor,
                          elevation: 5.sp,
                          shadowColor: VColors.gradientPrimary100,
                          position: RelativeRect.fromRect(
                            const Offset(double.infinity, 0) &
                                const Size(80, 80),

                            /// Position the menu at the tapped location
                            Offset.zero & overlay.size,
                          ),
                          items: [
                            PopupMenuItem<String>(
                              value: 'activate',
                              child: Text('${AppLocalizations.of(context)!.translate('activate')}',
                                  style: VStyles.bodyLargeSemiBold(context)),
                            ),
                            PopupMenuItem<String>(
                              value: 'not_activate',
                              child: Text('${AppLocalizations.of(context)!.translate('notActivate')}',
                                  style: VStyles.bodyLargeSemiBold(context)),
                            ),
                          ],
                        ).then((value) {
                          /// Handle the selected value
                          if (value != null) {
                            switch (value) {
                              case 'activate':

                                /// Handle activation
                                logSuccess('true');
                                makeActiveOrNot.makeGarageActiveOrNotFunction(
                                  active: true,
                                  garageId: VCacheHelper.getString(
                                      key: CacheKeys.garageId)!,
                                );
                                break;
                              case 'not_activate':

                                /// Handle deactivation
                                logSuccess('false');
                                makeActiveOrNot.makeGarageActiveOrNotFunction(
                                  active: false,
                                  garageId: VCacheHelper.getString(
                                      key: CacheKeys.garageId)!,
                                );
                                break;
                            }
                          }
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 24.w),
                        child: SvgPicture.asset(VImages.moreIcon),
                      ),
                    ),
                  ],
                  flexibleSpace: Container(
                    color: VColors.whiteColor,
                  ),
                ),
              ];
            },
            body: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              child: tabs[currentIndex],
            ),
          );
        },
      ),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        height: 90.h,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16.r),
            topLeft: Radius.circular(16.r),
          ),
          child: Theme(
            data: ThemeData(splashColor: Colors.transparent),
            child: BottomNavigationBar(
              elevation: 0,
              backgroundColor: VColors.greyScale50,
              iconSize: 24.sp,
              type: BottomNavigationBarType.fixed,
              currentIndex: currentIndex,
              onTap: (index) => setState(() => currentIndex = index),
              enableFeedback: false,
              selectedItemColor: VColors.primaryColor500,
              unselectedItemColor: VColors.greyScale500,
              selectedLabelStyle: VStyles.bodyXSmallBold(context)
                  .copyWith(color: VColors.primaryColor500),
              unselectedLabelStyle: VStyles.bodyXSmallMedium(context)
                  .copyWith(color: VColors.greyScale500),
              showUnselectedLabels: true,
              items: [
                BottomNavigationBarItem(
                  icon: SizedBox(
                    width: 57.6.w,
                    height: 38.h,
                    child: currentIndex == 0
                        ? SvgPicture.asset(VImages.homeIconSelected,
                            colorFilter: ColorFilter.mode(
                                VColors.primaryColor500, BlendMode.srcIn),
                            fit: BoxFit.scaleDown)
                        : SvgPicture.asset(VImages.homeIconNotSelected,
                            colorFilter: ColorFilter.mode(
                                VColors.greyScale500, BlendMode.srcIn),
                            fit: BoxFit.scaleDown),
                  ),
                  label: AppLocalizations.of(context)!.translate('home')!,
                ),
                BottomNavigationBarItem(
                  icon: SizedBox(
                    width: 57.6.w,
                    height: 38.h,
                    child: currentIndex == 1
                        ? SvgPicture.asset(VImages.bookingIconSelected,
                            colorFilter: ColorFilter.mode(
                                VColors.primaryColor500, BlendMode.srcIn),
                            fit: BoxFit.scaleDown)
                        : SvgPicture.asset(VImages.bookingIconNotSelected,
                            colorFilter: ColorFilter.mode(
                                VColors.greyScale500, BlendMode.srcIn),
                            fit: BoxFit.scaleDown),
                  ),
                  label: AppLocalizations.of(context)!.translate('allOrders')!,
                ),
                BottomNavigationBarItem(
                  icon: SizedBox(
                    width: 57.6.w,
                    height: 38.h,
                    child: currentIndex == 2
                        ? SvgPicture.asset(VImages.profileIconSelected,
                            colorFilter: ColorFilter.mode(
                                VColors.primaryColor500, BlendMode.srcIn),
                            fit: BoxFit.scaleDown)
                        : SvgPicture.asset(VImages.profileIconNotSelected,
                            colorFilter: ColorFilter.mode(
                                VColors.greyScale500, BlendMode.srcIn),
                            fit: BoxFit.scaleDown),
                  ),
                  label: AppLocalizations.of(context)!.translate('profile')!,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
