import 'package:valetparking_driver/utils/constants/exports.dart';

class ChoicePassengersScreen extends StatefulWidget {
  const ChoicePassengersScreen({super.key, required this.map});

  final Map map;

  @override
  State<ChoicePassengersScreen> createState() => _ChoicePassengersScreenState();
}

class _ChoicePassengersScreenState extends State<ChoicePassengersScreen> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              elevation: 0,
              backgroundColor: VColors.whiteColor,
              title: Padding(
                padding: EdgeInsets.only(right: 24.w),
                child: Text(
                  '${AppLocalizations.of(context)!.translate('bookParkingDetails')} ${widget.map['userId']}',
                  style: VStyles.h4Bold(context),
                ),
              ),
              leading: null,
              floating: true,
              pinned: true,
              flexibleSpace: Container(
                color: VColors.whiteColor,
              ),
            ),
          ];
        },
        body: Container(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 24.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: VConstants.passengersImages.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 24.h);
                  },
                  itemBuilder: (context, index) {
                    bool isSelected = selectedIndex == index;

                    return InkWellWidget(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: EdgeInsets.symmetric(
                            vertical: 24.h, horizontal: 24.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                            color: isSelected
                                ? VColors.primaryColor500
                                : Colors.transparent,
                            width: 2.0, // Add border width
                          ),
                          boxShadow: [AppBoxShadows.cardShadowTwo],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(VConstants.passengersImages[index]),
                            SizedBox(
                              width: VDeviceUtils.getScreenWidth(context) / 2.4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(VConstants.passengersNames[index],
                                      style: VStyles.h5Bold(context)),
                                  Text(
                                    'HG 4676 FH',
                                    style: VStyles.bodyMediumMedium(context).copyWith(
                                      color: VColors.greyScale700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            AnimatedSwitcher(
                              duration: Duration(milliseconds: 300),
                              transitionBuilder:
                                  (Widget child, Animation<double> animation) {
                                return ScaleTransition(
                                    child: child, scale: animation);
                              },
                              child: Icon(
                                isSelected
                                    ? Icons.radio_button_on
                                    : Icons.radio_button_off,
                                color: VColors.primaryColor500,
                                key: ValueKey(
                                    isSelected,
                                ), /// Unique key for each state
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              /// Make Space
              SizedBox(height: 24.h),

              MainButtonWidget(
                centerWidgetInButton: Text(
                  AppLocalizations.of(context)!.translate('continue')!,
                  style: VStyles.bodyLargeBold(context).copyWith(color: VColors.whiteColor),
                ),
                onTap: () {
                  if (selectedIndex == null) {
                    /// Show a message or a Snackbar if nothing is selected
                    FloatingSnackBar.show(
                      context: context,
                      message: '${AppLocalizations.of(context)!.translate('pleaseSelectAPassengerBeforeContinuing')}.',
                      textColor: Colors.white,
                      duration: const Duration(milliseconds: 4000),
                      backgroundColor: VColors.error,
                    );
                  } else {
                    /// Proceed to the next screen
                    // logSuccess('${selectedIndex! + 1}');
                    // logSuccess('${widget.map['emailAddress']}');
                    // logSuccess('${widget.map['password']}');
                    // logSuccess('${widget.map['userId']}');

                    // logSuccess(VCacheHelper.getString(key: CacheKeys.userId).toString());
                    // logSuccess(VCacheHelper.getString(key: CacheKeys.userToken).toString());
                    // logSuccess(VCacheHelper.getString(key: CacheKeys.garageId).toString());


                    context.pushNamed(VRoutesName.choiceDataAndTimeRoute, arguments: {
                      // 'garageId': VCacheHelper.getString(key: CacheKeys.driverId),
                      // 'garageName': widget.map['garageName'].toString(),
                      // 'pricePerHour': widget.map['pricePerHour'].toString(),
                      // 'lat': widget.map['lat'].toString(),
                      // 'lng': widget.map['lng'].toString(),
                      'emailAddress': widget.map['emailAddress'],
                      'password': widget.map['password'],
                      'passengerId': '${selectedIndex! + 1}',
                      'userId': widget.map['userId'],
                    });
                  }
                },
                margin: EdgeInsets.zero,
                buttonColor: VColors.primaryColor500,
                boxShadow: [AppBoxShadows.buttonShadowOne],
              ),

              /// Make Space
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}