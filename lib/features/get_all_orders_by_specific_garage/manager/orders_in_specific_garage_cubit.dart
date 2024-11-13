import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:valetparking_driver/features/get_all_orders_by_specific_garage/models/get_order_in_specific_garage_model.dart';
import 'package:valetparking_driver/features/get_all_orders_by_specific_garage/models/get_specific_order_model.dart';
import 'package:valetparking_driver/utils/constants/exports.dart';

part 'orders_in_specific_garage_state.dart';

class OrdersInSpecificGarageCubit extends Cubit<OrdersInSpecificGarageState> {
  OrdersInSpecificGarageCubit() : super(OrdersInSpecificGarageInitialState());

  static OrdersInSpecificGarageCubit get(context) => BlocProvider.of(context);

  DioHelper dioHelper = DioHelper();

  GetOrderInSpecificGarageModel getOrderInSpecificGarageModel = GetOrderInSpecificGarageModel();
  GetSpecificOrderModel getSpecificOrderModel = GetSpecificOrderModel();

  /// Get All Orders Function
  // Future<void> getAllOrdersFunction({required String status, required String garageId}) async {
  //   emit(OrdersInSpecificGarageLoadingState());
  //   try {
  //     final response = await dioHelper.getData(
  //       endPoint: '${ApiConstants.getAllOrdersUrl}?garage=$garageId&status=$status',
  //     );
  //
  //     if (response.statusCode == 200) {
  //       getOrderInSpecificGarageModel = GetOrderInSpecificGarageModel.fromJson(response.data);
  //       // logSuccess('${getAllOrdersModel.orderDetails!.length} ljksfdolajk');
  //       // logSuccess('${response.data}');
  //       emit(OrdersInSpecificGarageSuccessState(message: 'Get all Orders successfully'));
  //     }
  //     else if (response.statusCode == 422 || response.statusCode == 404) {
  //       emit(OrdersInSpecificGarageErrorState(message: response.data['message'] ?? ''));
  //     }
  //
  //   } catch (error) {
  //     logError(error.toString());
  //     emit(OrdersInSpecificGarageErrorState(message: error.toString()));
  //   }
  // }
  Future<void> getAllOrdersFunction({String? status, String? garageId}) async {
    emit(OrdersInSpecificGarageLoadingState());
    try {
      /// Build the query parameters dynamically based on the presence of status and garageId
      String queryParameters = '';

      if (garageId != null) {
        queryParameters += 'garage=$garageId';
      }

      if (status != null) {
        if (queryParameters.isNotEmpty) {
          queryParameters += '&';
        }
        queryParameters += 'status=$status';
      }

      /// Construct the final endpoint with query parameters (if any)
      final endPoint = queryParameters.isNotEmpty
          ? '${ApiConstants.getAllOrdersUrl}?$queryParameters'
          : ApiConstants.getAllOrdersUrl;

      final response = await dioHelper.getData(endPoint: endPoint);

      if (response.statusCode == 200) {
        getOrderInSpecificGarageModel = GetOrderInSpecificGarageModel.fromJson(response.data);
        emit(OrdersInSpecificGarageSuccessState(message: 'Get all Orders successfully'));
      } else if (response.statusCode == 422 || response.statusCode == 404) {
        emit(OrdersInSpecificGarageErrorState(message: response.data['message'] ?? ''));
      }
    } catch (error) {
      logError(error.toString());
      emit(OrdersInSpecificGarageErrorState(message: error.toString()));
    }
  }

  Future<void> getSpecificFunction({required String status, required String orderId}) async {
    emit(GetSpecificOrderLoadingState());
    try {
      final response = await dioHelper.getData(
        endPoint: '${ApiConstants.getSpecificOrderUrl}$orderId',
      );

      // logSuccess(response.data.toString());

      if (response.statusCode == 200) {
        getSpecificOrderModel = GetSpecificOrderModel.fromJson(response.data);
        emit(GetSpecificOrderSuccessState(message: 'Get specific Order successfully'));
      }
      else if (response.statusCode == 422 || response.statusCode == 404) {
        emit(GetSpecificOrderErrorState(message: response.data['message'] ?? ''));
      }

    } catch (error) {
      logError(error.toString());
      emit(GetSpecificOrderErrorState(message: error.toString()));
    }
  }
}