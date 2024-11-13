import 'package:valetparking_driver/features/get_all_orders_by_specific_garage/manager/orders_in_specific_garage_cubit.dart';
import 'package:valetparking_driver/features/get_all_orders_by_specific_garage/presentation/widgets/cancelled_parking_widget.dart';
import 'package:valetparking_driver/features/get_all_orders_by_specific_garage/presentation/widgets/cancelled_widget.dart';
import 'package:valetparking_driver/features/get_all_orders_by_specific_garage/presentation/widgets/complete_widget.dart';
import 'package:valetparking_driver/features/get_all_orders_by_specific_garage/presentation/widgets/ongoing_widget.dart';
import 'package:valetparking_driver/utils/constants/exports.dart';

class GetAllOrdersBySpecificGarageScreen extends StatefulWidget {
  const GetAllOrdersBySpecificGarageScreen({super.key});

  @override
  State<GetAllOrdersBySpecificGarageScreen> createState() =>
      _GetAllOrdersBySpecificGarageScreenState();
}

class _GetAllOrdersBySpecificGarageScreenState
    extends State<GetAllOrdersBySpecificGarageScreen> {
  int selectedIndex = 0;

  final List<String> items = ['Ongoing', 'Completed', 'Cancelled'];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrdersInSpecificGarageCubit,
        OrdersInSpecificGarageState>(
      listener: (context, state) {},
      builder: (context, state) {
        var orderCubit = OrdersInSpecificGarageCubit.get(context);
        var orderItem = orderCubit.getOrderInSpecificGarageModel.orderDetails;

        return RefreshIndicator(
          onRefresh: () {
            return orderCubit.getAllOrdersFunction(status: 'ongoing');
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                /// Make Space
                SizedBox(height: 24.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    items.length,
                    (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                          selectedIndex == 0
                              ? orderCubit.getAllOrdersFunction(
                                  status: 'ongoing')
                              : selectedIndex == 1
                                  ? orderCubit.getAllOrdersFunction(
                                      status: 'completed')
                                  : orderCubit.getAllOrdersFunction(
                                      status: 'canceled');
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          // Feel free to change the curve for different animations
                          padding: EdgeInsets.symmetric(
                            vertical: 10.h,
                            horizontal: index == 1
                                ? 14.w
                                : index == 2
                                    ? 21.w
                                    : 24.w,
                          ),
                          decoration: BoxDecoration(
                            color: selectedIndex == index
                                ? VColors.primaryColor500
                                : Colors.white,
                            borderRadius: BorderRadius.circular(100.r),
                            border: Border.all(
                              color: VColors.primaryColor500,
                              width: 2.w,
                            ),
                          ),
                          child: Text(
                            items[index],
                            style: VStyles.bodyXLargeBold(context).copyWith(
                              color: selectedIndex == index
                                  ? Colors.white
                                  : VColors.primaryColor500,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                /// Make Space
                SizedBox(height: 24.h),

                selectedIndex == 2

                    /// Cancelled
                    ? Expanded(
                        child: state is OrdersInSpecificGarageLoadingState ||
                                orderItem == []
                            ? Center(
                                child: LoadingWidget(
                                    iconColor: VColors.primaryColor500),
                              )
                            : orderItem == null
                                ? Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Have an a problem in get orders items',
                                          style: VStyles.h6Bold(context),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  )
                                : orderItem!.isEmpty
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Lottie.asset(
                                            VImages.orderEmptyLottie,
                                          ),
                                          SizedBox(height: 40.h),
                                          Text('Empty cancel order ..',
                                              style: VStyles.bodyXLargeBold(context)),
                                        ],
                                      )
                                    : ListView.separated(
                                        shrinkWrap: true,
                                        padding: EdgeInsets.zero,
                                        itemBuilder: (context, index) {
                                          return CancelledWidget(
                                            pLaceImage:
                                                VImages.welBeckNorthImagePlace,
                                            placeName:
                                                orderItem[index].garage == null
                                                    ? '...'
                                                    : orderItem[index]
                                                        .garage!
                                                        .garageName
                                                        .toString(),
                                            placeDesc:
                                                orderItem[index].garage == null
                                                    ? '..'
                                                    : orderItem[index]
                                                        .garage!
                                                        .garageDescription
                                                        .toString(),
                                            placePrice:
                                                '\$ ${orderItem[index].garage == null ? '..' : orderItem[index].garage!.garageDescription}',
                                            numberOfWaiting: orderItem[index]
                                                .duration
                                                .toString(),
                                            onTap: () {
                                              VDeviceUtils.showCustomBottomSheet(
                                                  context: context,
                                                  widget:
                                                      const CancelParkingWidget());
                                            },
                                          );
                                        },
                                        separatorBuilder: (context, index) {
                                          return SizedBox(height: 20.h);
                                        },
                                        itemCount: orderItem.length,
                                      ),
                      )

                    /// Completed
                    : selectedIndex == 1
                        ? Expanded(
                            child: state
                                        is OrdersInSpecificGarageLoadingState ||
                                    orderItem == []
                                ? Center(
                                    child: LoadingWidget(
                                        iconColor: VColors.primaryColor500),
                                  )
                                : orderItem == null
                                    ? Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Have an a problem in get orders items',
                                              style: VStyles.h6Bold(context),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      )
                                    : orderItem!.isEmpty
                                        ? Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Lottie.asset(
                                                VImages.orderEmptyLottie,
                                              ),
                                              SizedBox(height: 40.h),
                                              Text('Empty completed order ..',
                                                  style:
                                                      VStyles.bodyXLargeBold(context)),
                                            ],
                                          )
                                        : ListView.separated(
                                            shrinkWrap: true,
                                            padding: EdgeInsets.zero,
                                            itemBuilder: (context, index) {
                                              return CompleteWidget(
                                                pLaceImage: VImages
                                                    .welBeckNorthImagePlace,
                                                placeName:
                                                    orderItem[index].garage ==
                                                            null
                                                        ? '..'
                                                        : orderItem[index]
                                                            .garage!
                                                            .garageName
                                                            .toString(),
                                                placeDesc:
                                                    orderItem[index].garage ==
                                                            null
                                                        ? '..'
                                                        : orderItem[index]
                                                            .garage!
                                                            .garageDescription
                                                            .toString(),
                                                placePrice:
                                                    '\$ ${orderItem[index].garage == null ? '..' : orderItem[index].garage!.garagePricePerHour}',
                                                numberOfWaiting:
                                                    orderItem[index]
                                                        .duration
                                                        .toString(),
                                                onTap: () {
                                                  // context.pushNamed(VRoutesName
                                                  //     .parkingTicketRoute);
                                                  context.pushNamed(
                                                    VRoutesName
                                                        .parkingTicketRoute,
                                                    arguments: orderItem[index]
                                                        .orderId,
                                                  );
                                                },
                                              );
                                            },
                                            separatorBuilder: (context, index) {
                                              return SizedBox(height: 20.h);
                                            },
                                            itemCount: orderItem.length,
                                          ),
                          )

                        /// Ongoing
                        : Expanded(
                            child: state
                                        is OrdersInSpecificGarageLoadingState ||
                                    orderItem == []
                                ? Center(
                                    child: LoadingWidget(
                                        iconColor: VColors.primaryColor500),
                                  )
                                : orderItem == null
                                    ? Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Have an a problem in get orders items',
                                              style: VStyles.h6Bold(context),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      )
                                    : orderItem!.isEmpty
                                        ? Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Lottie.asset(
                                                  VImages.orderEmptyLottie),
                                              SizedBox(height: 40.h),
                                              Text('Empty ongoing order ..',
                                                  style:
                                                      VStyles.bodyXLargeBold(context)),
                                            ],
                                          )
                                        : ListView.separated(
                                            shrinkWrap: true,
                                            padding: EdgeInsets.zero,
                                            itemBuilder: (context, index) {
                                              return OnGoingWidget(
                                                pLaceImage: VImages
                                                    .welBeckNorthImagePlace,
                                                placeName:
                                                    orderItem[index].garage ==
                                                            null
                                                        ? '..'
                                                        : orderItem[index]
                                                            .garage!
                                                            .garageName
                                                            .toString(),
                                                placeDesc:
                                                    orderItem[index].garage ==
                                                            null
                                                        ? '..'
                                                        : orderItem[index]
                                                            .garage!
                                                            .garageDescription
                                                            .toString(),
                                                placePrice:
                                                    '\$ ${orderItem[index].garage == null ? '..' : orderItem[index].garage!.garagePricePerHour}',
                                                numberOfWaiting:
                                                    orderItem[index]
                                                        .duration
                                                        .toString(),
                                                status: orderItem[index]
                                                            .isPaid ==
                                                        null
                                                    ? ''
                                                    : orderItem[index].isPaid!
                                                        ? 'Paid'
                                                        : 'Not Paid',
                                                onViewTimer: () {
                                                  // logSuccess(orderItem[index]
                                                  //     .timeRange!
                                                  //     .end
                                                  //     .toString());
                                                  // context.pushNamed(
                                                  //     VRoutesName.parkingTimerRoute);
                                                  context.pushNamed(
                                                    VRoutesName
                                                        .parkingTimerRoute,
                                                    arguments: {
                                                      'parkingArea':
                                                          orderItem[index]
                                                              .garage!
                                                              .garageName,
                                                      'lat': orderItem[index]
                                                          .garage!
                                                          .lat,
                                                      'lng': orderItem[index]
                                                          .garage!
                                                          .lng,
                                                      'typeCar':
                                                          orderItem[index]
                                                              .typeOfCar,
                                                      'date':
                                                          orderItem[index].date,
                                                      'duration':
                                                          orderItem[index]
                                                              .duration,
                                                      'start': orderItem[index]
                                                          .timeRange!
                                                          .start,
                                                      'end': orderItem[index]
                                                          .timeRange!
                                                          .end,
                                                    },
                                                  );
                                                },
                                                onShowTicket: () {
                                                  context.pushNamed(
                                                    VRoutesName
                                                        .parkingTicketRoute,
                                                    arguments: orderItem[index]
                                                        .orderId,
                                                  );
                                                  // logSuccess(orderItem[index]
                                                  //     .orderId
                                                  //     .toString());
                                                },
                                              );
                                            },
                                            separatorBuilder: (context, index) {
                                              return SizedBox(height: 20.h);
                                            },
                                            itemCount: orderItem.length,
                                          ),
                          ),
              ],
            ),
          ),
        );
      },
    );
  }
}
