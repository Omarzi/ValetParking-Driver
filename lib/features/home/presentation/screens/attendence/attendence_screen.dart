import 'package:geolocator/geolocator.dart';
import 'package:valetparking_driver/features/home/manager/home_cubit.dart';
import 'package:valetparking_driver/utils/constants/exports.dart';

class AttendenceScreen extends StatefulWidget {
  const AttendenceScreen({super.key});

  @override
  State<AttendenceScreen> createState() => _AttendenceScreenState();
}

class _AttendenceScreenState extends State<AttendenceScreen> {
  double? lat;
  double? lng;

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    // Check for location permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // Get the current position
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      lat = position.latitude;
      lng = position.longitude;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is MakeAttendanceInStartSuccessState) {
            FloatingSnackBar.show(
              context: context,
              message: '${AppLocalizations.of(context)!.translate('theAttendanceWasSuccessfullyCompleted')}.',
              textColor: Colors.white,
              duration: const Duration(milliseconds: 4000),
              backgroundColor: VColors.success,
            );
          } else if (state is MakeAttendanceInStartErrorState) {
            FloatingSnackBar.show(
              context: context,
              message: state.message!,
              textColor: Colors.white,
              duration: const Duration(milliseconds: 4000),
              backgroundColor: VColors.error,
            );
          } else if (state is MakeAttendanceInEndSuccessState) {
            FloatingSnackBar.show(
              context: context,
              message: '${AppLocalizations.of(context)!.translate('theWithdrawalWasSuccessfullyCompleted')}.',
              textColor: Colors.white,
              duration: const Duration(milliseconds: 4000),
              backgroundColor: VColors.success,
            );
            context.pushNamedAndRemoveUntil(VRoutesName.loginAccountRoute, predicate: (route) => false);
          } else if (state is MakeAttendanceInEndErrorState) {
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
          var attendanceCubit = HomeCubit.get(context);

          return NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  elevation: 0,
                  backgroundColor: VColors.whiteColor,
                  title: Padding(
                    padding: EdgeInsets.only(right: 24.w),
                    child: Text(
                      '${AppLocalizations.of(context)!.translate('makeAttendence')}',
                      style: VStyles.h4Bold(context),
                    ),
                  ),
                  floating: true,
                  pinned: true,
                  flexibleSpace: Container(
                    color: VColors.whiteColor,
                  ),
                ),
              ];
            },
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${AppLocalizations.of(context)!.translate('beforeYouRegisterYourAttendance')}.',
                      style: VStyles.h6Bold(context),
                      textAlign: TextAlign.center,
                    ),

                    /// Make Space
                    SizedBox(height: 48.h),

                    /// Make in start
                    MainButtonWidget(
                      centerWidgetInButton: state is MakeAttendanceInStartLoadingState
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text(
                        '${AppLocalizations.of(context)!.translate('makeRegisterMyAttendanceInStart')}',
                        style: VStyles.bodyLargeBold(context).copyWith(
                          color: VColors.whiteColor,
                        ),
                      ),
                      onTap: lat != null && lng != null
                          ? () {
                              attendanceCubit.makeAttendanceInStartFunction(
                                lat: lat!,
                                lng: lng!,
                              );
                              logSuccess(lat!.toString());
                              logSuccess(lng!.toString());
                            }
                          : null,
                      margin: EdgeInsets.zero,
                      buttonColor: VColors.primaryColor500,
                      boxShadow: [AppBoxShadows.buttonShadowOne],
                    ),

                    /// Make Space
                    SizedBox(height: 24.h),

                    /// Make in end
                    MainButtonWidget(
                      centerWidgetInButton:
                          state is MakeAttendanceInEndLoadingState
                              ? CircularProgressIndicator(color: VColors.primaryColor500)
                              : Text(
                                  '${AppLocalizations.of(context)!.translate('makeRegisterMyAttendanceInEnd')}',
                                  style: VStyles.bodyLargeBold(context).copyWith(
                                    color: VColors.primaryColor500,
                                  ),
                                ),
                      onTap: lat != null && lng != null
                          ? () {
                              attendanceCubit.makeAttendanceInEndFunction(
                                lat: lat!,
                                lng: lng!,
                              );
                            }
                          : null,
                      margin: EdgeInsets.zero,
                      buttonColor: VColors.primaryColor100,
                      boxShadow: [],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
