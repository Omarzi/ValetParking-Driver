import 'package:valetparking_driver/features/home/manager/home_cubit.dart';
import 'package:valetparking_driver/utils/constants/exports.dart';

class ReviewSummaryScreen extends StatefulWidget {
  const ReviewSummaryScreen({super.key, required this.data});

  final Map data;

  // final String paymentMethod;

  @override
  State<ReviewSummaryScreen> createState() => _ReviewSummaryScreenState();
}

class _ReviewSummaryScreenState extends State<ReviewSummaryScreen> {
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
                  '${AppLocalizations.of(context)!.translate('reviewSummary')}',
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
        body: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is MakeNewOrderSuccessState) {
              context.pushNamedAndRemoveUntil(
                VRoutesName.parkingTicketRoute,
                // arguments: state.makeOrderResponseModel,
                predicate: (route) => false,
                arguments: HomeCubit.get(context).makeOrderResponseModel.order!.orderId,
              );
              FloatingSnackBar.show(
                context: context,
                message: state.message!,
                textColor: Colors.white,
                duration: const Duration(milliseconds: 4000),
                backgroundColor: VColors.success,
              );
            } else if (state is MakeNewOrderErrorState) {
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
            var makeOrderCubit = HomeCubit.get(context);

            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 24.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 24.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [AppBoxShadows.cardShadowTwo],
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Column(
                        children: [
                          /// Parking Name
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width:
                                    VDeviceUtils.getScreenWidth(context) / 3.8,
                                child: Text(
                                  '${AppLocalizations.of(context)!.translate('parkingArea')}',
                                  style: VStyles.bodyMediumSemiBold(context).copyWith(
                                    color: VColors.greyScale700,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width:
                                    VDeviceUtils.getScreenWidth(context) / 2.5,
                                child: Text(
                                  VCacheHelper.getString(
                                              key: CacheKeys.garageName) !=
                                          null
                                      ? '${VCacheHelper.getString(key: CacheKeys.garageName)![0].toUpperCase()}${VCacheHelper.getString(key: CacheKeys.garageName)!.substring(1).toLowerCase()}'
                                      : '',
                                  style: VStyles.bodyLargeBold(context),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ],
                          ),

                          /// Make Space
                          SizedBox(height: 20.h),

                          /// Parking Address
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width:
                                    VDeviceUtils.getScreenWidth(context) / 3.8,
                                child: Text(
                                  '${AppLocalizations.of(context)!.translate('address')}',
                                  style: VStyles.bodyMediumSemiBold(context).copyWith(
                                    color: VColors.greyScale700,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width:
                                    VDeviceUtils.getScreenWidth(context) / 2.5,
                                child: Text(
                                  '${VCacheHelper.getString(key: CacheKeys.lat)} - ${VCacheHelper.getString(key: CacheKeys.lng)}',
                                  style: VStyles.bodyLargeBold(context),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ],
                          ),

                          /// Make Space
                          SizedBox(height: 20.h),

                          /// Vehicle
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width:
                                    VDeviceUtils.getScreenWidth(context) / 3.8,
                                child: Text(
                                  '${AppLocalizations.of(context)!.translate('vehicle')}',
                                  style: VStyles.bodyMediumSemiBold(context).copyWith(
                                    color: VColors.greyScale700,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width:
                                    VDeviceUtils.getScreenWidth(context) / 2.5,
                                child: Text(
                                  widget.data['typeOfCar'] == '1'
                                      ? 'Small car'
                                      : widget.data['typeOfCar'] == '2'
                                          ? 'Big car'
                                          : widget.data['typeOfCar'] == '3'
                                              ? 'MotoCycle'
                                              : 'Bycle',
                                  style: VStyles.bodyLargeBold(context),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ],
                          ),

                          /// Make Space
                          SizedBox(height: 20.h),

                          /// Date
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width:
                                    VDeviceUtils.getScreenWidth(context) / 3.8,
                                child: Text(
                                  '${AppLocalizations.of(context)!.translate('date')}',
                                  style: VStyles.bodyMediumSemiBold(context).copyWith(
                                    color: VColors.greyScale700,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width:
                                    VDeviceUtils.getScreenWidth(context) / 2.5,
                                child: Text(
                                  widget.data['date'],
                                  style: VStyles.bodyLargeBold(context),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ],
                          ),

                          /// Make Space
                          SizedBox(height: 20.h),

                          /// Date
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width:
                                    VDeviceUtils.getScreenWidth(context) / 3.8,
                                child: Text(
                                  '${AppLocalizations.of(context)!.translate('duration')}',
                                  style: VStyles.bodyMediumSemiBold(context).copyWith(
                                    color: VColors.greyScale700,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width:
                                    VDeviceUtils.getScreenWidth(context) / 2.5,
                                child: Text(
                                  '${widget.data['duration']} hours',
                                  style: VStyles.bodyLargeBold(context),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ],
                          ),

                          /// Make Space
                          SizedBox(height: 20.h),

                          /// Date
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width:
                                    VDeviceUtils.getScreenWidth(context) / 3.8,
                                child: Text(
                                  '${AppLocalizations.of(context)!.translate('hours')}',
                                  style: VStyles.bodyMediumSemiBold(context).copyWith(
                                    color: VColors.greyScale700,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width:
                                    VDeviceUtils.getScreenWidth(context) / 2.5,
                                child: Text(
                                  '${widget.data['startTime']} - ${widget.data['endTime']}',
                                  style: VStyles.bodyLargeBold(context),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    /// Make Space
                    SizedBox(height: 24.h),

                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 24.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [AppBoxShadows.cardShadowTwo],
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Column(
                        children: [
                          /// Amount
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width:
                                    VDeviceUtils.getScreenWidth(context) / 3.8,
                                child: Text(
                                  '${AppLocalizations.of(context)!.translate('amount')}',
                                  style: VStyles.bodyMediumSemiBold(context).copyWith(
                                    color: VColors.greyScale700,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width:
                                    VDeviceUtils.getScreenWidth(context) / 2.5,
                                child: Text(
                                  '\$ ${widget.data['totalPrice'] == 0 ? widget.data['pricePerHour'] : widget.data['totalPrice']}',
                                  style: VStyles.bodyLargeBold(context),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ],
                          ),

                          /// Make Space
                          SizedBox(height: 20.h),

                          /// Taxes & Fees
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width:
                                    VDeviceUtils.getScreenWidth(context) / 3.8,
                                child: Text(
                                  '${AppLocalizations.of(context)!.translate('taxesFees')}',
                                  style: VStyles.bodyMediumSemiBold(context).copyWith(
                                    color: VColors.greyScale700,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width:
                                    VDeviceUtils.getScreenWidth(context) / 2.5,
                                child: Text(
                                  'kwd 0.8',
                                  style: VStyles.bodyLargeBold(context),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ],
                          ),

                          /// Make Space
                          SizedBox(height: 22.h),

                          Container(height: 1.4.h, color: VColors.greyScale200),

                          /// Make Space
                          SizedBox(height: 20.h),

                          /// Total
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width:
                                    VDeviceUtils.getScreenWidth(context) / 3.8,
                                child: Text(
                                  '${AppLocalizations.of(context)!.translate('total')}',
                                  style: VStyles.bodyMediumSemiBold(context).copyWith(
                                    color: VColors.greyScale700,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width:
                                    VDeviceUtils.getScreenWidth(context) / 2.5,
                                child: Text(
                                  '\$ ${widget.data['totalPrice'] == 0 || widget.data['totalPrice'] == null ? widget.data['pricePerHour'] : widget.data['totalPrice']}',
                                  style: VStyles.bodyLargeBold(context),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    /// Make Space
                    SizedBox(height: 20.h),

                    /// Payment Method
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 24.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [AppBoxShadows.cardShadowTwo],
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.data['paymentMethod'],
                              style: VStyles.h6Bold(context)),
                          Text(
                            '${AppLocalizations.of(context)!.translate('payment')}',
                            style: VStyles.bodyLargeSemiBold(context).copyWith(
                              color: VColors.primaryColor500,
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// Make Space
                    SizedBox(height: 44.h),

                    MainButtonWidget(
                      centerWidgetInButton: state is MakeNewOrderLoadingState
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text(
                              AppLocalizations.of(context)!
                                  .translate('continue')!,
                              style: VStyles.bodyLargeBold(context).copyWith(
                                color: VColors.whiteColor,
                              ),
                            ),
                      onTap: () {
                        logWarning(VCacheHelper.getString(key: CacheKeys.userToken)!);
                        makeOrderCubit.makeNewOrderFunction(
                          typeOfCar: int.parse(widget.data['typeOfCar']),
                          date: widget.data['date'],
                          startNow: widget.data['startNow'],
                          duration: widget.data['duration'],
                          totalPrice: widget.data['totalPrice'],
                          paymentMethod: widget.data['paymentMethod'] == '💸 Cash' ? 'cash' : widget.data['paymentMethod'] == '🎫 VISA' ? 'visa' : 'wallet',
                          status: 'ongoing',
                          isPaid: widget.data['isPaid'],
                          startTime: widget.data['startTime'],
                          endTime: widget.data['endTime'],
                        );
                        logSuccess(int.parse(widget.data['typeOfCar']).toString());
                        logSuccess(widget.data['date']);
                        logSuccess(widget.data['startNow'].toString());
                        logSuccess(widget.data['duration'].toString());
                        logSuccess(widget.data['totalPrice'].toString());
                        logSuccess(widget.data['paymentMethod'] == '💸 Cash' ? 'cash' : widget.data['paymentMethod'] == '🎫 VISA' ? 'visa' : 'wallet');
                        logSuccess(widget.data['isPaid'].toString());
                        logSuccess(widget.data['startTime']);
                        logSuccess(widget.data['endTime']);
                        // context.pushNamed(VRoutesName.parkingTicketRoute);
                      },
                      margin: EdgeInsets.zero,
                      buttonColor: VColors.primaryColor500,
                      boxShadow: [AppBoxShadows.buttonShadowOne],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
