import 'package:valetparking_driver/utils/constants/exports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          right: 32.w,
          left: 32.w,
          bottom: 48.h,
        ),
        child: Column(
          children: [
            Text(
              '${AppLocalizations.of(context)!.translate('chooseFromFollowingScan')}',
              style: VStyles.h4Bold(context),
              textAlign: TextAlign.center,
            ),

            /// Make Space
            SizedBox(height: 24.h),

            Text(
              '${AppLocalizations.of(context)!.translate('choice')}',
              style: VStyles.h2Bold(context).copyWith(
                color: VColors.primaryColor500,
              ),
              textAlign: TextAlign.center,
            ),

            /// Make Space
            SizedBox(height: 36.h),

            /// Make Attendance Button
            MainButtonWidget(
              centerWidgetInButton: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Iconsax.finger_scan, color: Colors.white),
                  SizedBox(width: 8.w),
                  Text(
                    '${AppLocalizations.of(context)!.translate('makeAttendance')}',
                    style: VStyles.bodyLargeBold(context).copyWith(
                      color: VColors.whiteColor,
                    ),
                  ),
                ],
              ),
              onTap: () => context.pushNamed(VRoutesName.attendenceRoute),
              margin: EdgeInsets.zero,
              buttonColor: VColors.primaryColor500,
              boxShadow: [AppBoxShadows.buttonShadowOne],
            ),

            /// Make Space
            SizedBox(height: 24.h),

            /// Make Scan Button
            MainButtonWidget(
              centerWidgetInButton: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Iconsax.scan, color: Colors.white),
                  SizedBox(width: 8.w),
                  Text(
                    '${AppLocalizations.of(context)!.translate('makeScann')}',
                    style: VStyles.bodyLargeBold(context).copyWith(
                      color: VColors.whiteColor,
                    ),
                  ),
                ],
              ),
              onTap: () => context.pushNamed(VRoutesName.scanRoute),
              margin: EdgeInsets.zero,
              buttonColor: VColors.primaryColor500,
              boxShadow: [AppBoxShadows.buttonShadowOne],
            ),

            /// Make Space
            SizedBox(height: 24.h),

            /// Add new user Button
            MainButtonWidget(
              centerWidgetInButton: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Iconsax.profile_circle, color: VColors.greyScale900),
                  SizedBox(width: 8.w),
                  Text(
                    '${AppLocalizations.of(context)!.translate('addNewUser')}',
                    style: VStyles.bodyLargeBold(context).copyWith(
                      color: VColors.greyScale900,
                    ),
                  )
                ],
              ),
              onTap: () => context.pushNamed(VRoutesName.addNewUserRoute),
              margin: EdgeInsets.zero,
              buttonColor: VColors.primaryColor100,
              boxShadow: [],
            ),
          ],
        ),
      ),
    );
  }
}
