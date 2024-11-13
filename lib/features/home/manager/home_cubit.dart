import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:valetparking_driver/features/home/models/add_new_response_user_model.dart';
import 'package:valetparking_driver/features/home/models/make_order_response_model.dart';
import 'package:valetparking_driver/utils/constants/exports.dart';
import 'package:valetparking_driver/features/home/models/make_scan_response_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  DioHelper dioHelper = DioHelper();

  NewUserResponseModel addNewUserResponseModel = NewUserResponseModel();
  MakeScanResponseModel makeScanResponseModel = MakeScanResponseModel();
  MakeOrderResponseModel makeOrderResponseModel = MakeOrderResponseModel();

  /// Make Attendance In Start Function
  Future<void> makeAttendanceInStartFunction({
    required double lat,
    required double lng,
  }) async {
    emit(MakeAttendanceInStartLoadingState());
    try {
      final response = await dioHelper
          .postData(endPoint: ApiConstants.takeAttendanceStartInUrl, body: {
        "lat": lat,
        "lng": lng,
        "garageId": VCacheHelper.getString(key: CacheKeys.garageId),
      });

      if (response.statusCode == 200) {
        emit(MakeAttendanceInStartSuccessState(
            message: response.data['message']));
      } else if (response.statusCode == 422 || response.statusCode == 404) {
        logError(response.data['message'].toString());
        emit(MakeAttendanceInStartErrorState(
            message: response.data['message'] ?? ''));
      } else {
        logError(response.data['message'].toString());
        emit(MakeAttendanceInStartErrorState(
            message: 'Error in Make attendance in start'));
      }
    } catch (error) {
      logError(error.toString());
      emit(MakeAttendanceInStartErrorState());
    }
  }

  /// Make Attendance In End Function
  Future<void> makeAttendanceInEndFunction({
    required double lat,
    required double lng,
  }) async {
    emit(MakeAttendanceInEndLoadingState());
    try {
      final response = await dioHelper
          .postData(endPoint: ApiConstants.takeAttendanceEndInUrl, body: {
        "lat": lat,
        "lng": lng,
        "garageId": VCacheHelper.getString(key: CacheKeys.garageId),
      });

      if (response.statusCode == 200) {
        emit(
            MakeAttendanceInEndSuccessState(message: response.data['message']));
      } else if (response.statusCode == 422 || response.statusCode == 404) {
        logError(response.data['message'].toString());
        emit(MakeAttendanceInEndErrorState(
            message: response.data['message'] ?? ''));
      } else {
        logError(response.data['message'].toString());
        emit(MakeAttendanceInEndErrorState(
            message: 'Error in Make attendance in end'));
      }
    } catch (error) {
      logError(error.toString());
      emit(MakeAttendanceInEndErrorState());
    }
  }

  Future<void> addNewUserFunction({
    required String phone,
    required String password,
  }) async {
    emit(AddNewUserLoadingState());
    try {
      final response = await dioHelper.postData(endPoint: ApiConstants.addNewUserUrl, body: {
        'phone': phone,
        'password': password,
      });

      if(response.statusCode == 200) {
        addNewUserResponseModel = NewUserResponseModel.fromJson(response.data);
        VCacheHelper.putString(key: CacheKeys.userId, value: response.data['userData']['userId']);
        VCacheHelper.putString(key: CacheKeys.userToken, value: response.data['token']);
        emit(AddNewUserSuccessState(message: response.data['message']));
      }
      else if(response.statusCode == 422 || response.statusCode == 404) {
        logError(response.data['message'].toString());
        emit(AddNewUserErrorState(message: response.data['message'] ?? ''));
      } else {
        logError(response.data['message'].toString());
        emit(AddNewUserErrorState(message: 'Error in Add new user'));
      }
    } catch (error) {
    logError(error.toString());
    emit(AddNewUserErrorState(message: 'Error in Make attendance in end'));
    }
  }

  Future<void> makeNewOrderFunction({
    required int typeOfCar,
    // required String garageId,
    required String date,
    required bool startNow,
    required double duration,
    required double totalPrice,
    required String paymentMethod,
    required String status,
    required bool isPaid,
    required String startTime,
    required String endTime,
  }) async {
    emit(MakeNewOrderLoadingState());
    try {
      final response = await dioHelper.postDataWithToken(
        endPoint: '${ApiConstants.makeOrderUrl}${VCacheHelper.getString(key: CacheKeys.userId)}',
        token: VCacheHelper.getString(key: CacheKeys.userToken)!,
        body: {
          "typeOfCar": typeOfCar,
          "garage": VCacheHelper.getString(key: CacheKeys.garageId),
          "date": date,
          "startNow": startNow,
          "duration": duration,
          "totalPrice": totalPrice,
          "paymentMethod": paymentMethod,
          "status": status,
          "isPaid": isPaid,
          "timeRange": {
            "start": startTime,
            "end": endTime,
          },
        },
      );

      if (response.statusCode == 201) {
        makeOrderResponseModel = MakeOrderResponseModel.fromJson(response.data);
        emit(MakeNewOrderSuccessState(message: response.data['message'] ?? ''));
      } else if (response.statusCode == 422 || response.statusCode == 404) {
        emit(MakeNewOrderErrorState(message: response.data['message'] ?? ''));
      }
    } catch (error) {
      logError(error.toString());
      emit(MakeNewOrderErrorState(message: error.toString()));
    }
  }

  /// Make Scan Function
  Future<void> makeScanFunction({
    required String orderId,
  }) async {
    emit(MakeScanLoadingState());
    try {
      final response =
      await dioHelper.postData(endPoint: ApiConstants.makeScanUrl, body: {
        'orderId': orderId,
      });

      if (response.statusCode == 200) {
        makeScanResponseModel = MakeScanResponseModel.fromJson(response.data);
        emit(MakeScanSuccessState(message: response.data['message']));
      } else if (response.statusCode == 422 || response.statusCode == 404) {
        logError(response.data['message'].toString());
        emit(MakeScanErrorState(message: response.data['message'] ?? ''));
      } else {
        logError(response.data['message'].toString());
        emit(MakeScanErrorState(message: 'Error in login'));
      }
    } catch (error) {
      logError(error.toString());
      emit(MakeScanErrorState(message: error.toString()));
    }
  }
}
