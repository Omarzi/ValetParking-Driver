import 'package:meta/meta.dart';
import 'package:valetparking_driver/utils/constants/exports.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);

  DioHelper dioHelper = DioHelper();

  DriverDataModel driverDataModel = DriverDataModel();

  /// Login Function
  Future<void> loginFunction({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    try {
      final response =
      await dioHelper.postData(endPoint: ApiConstants.loginUrl, body: {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        emit(LoginSuccessState(message: 'Reset code sent to email. Please verify the code.'));
      } else if (response.statusCode == 422 || response.statusCode == 404) {
        logError(response.data['message'].toString());
        emit(LoginErrorState(message: response.data['message'] ?? ''));
      } else {
        logError(response.data['message'].toString());
        emit(LoginErrorState(message: 'Error in login'));
      }
    } catch (error) {
      logError(error.toString());
      emit(LoginErrorState(message: error.toString()));
    }
  }

  /// Verify Reset Code For Login Function
  Future<void> verifyResetCodeForLoginFunction({
    required String resetCode,
  }) async {
    emit(VerifyResetPasswordLoadingState());
    try {
      final response =
      await dioHelper.postData(endPoint: ApiConstants.verifyResetCodeOfLoginUrl, body: {
        'resetCode': resetCode,
      });

      if (response.statusCode == 200) {
        driverDataModel = DriverDataModel.fromJson(response.data);
        VCacheHelper.putString(key: CacheKeys.driverId, value: driverDataModel.adminData!.adminId.toString());
        VCacheHelper.putString(key: CacheKeys.garageId, value: driverDataModel.adminData!.garage!.garageId.toString());
        VCacheHelper.putString(key: CacheKeys.garageName, value: driverDataModel.adminData!.garage!.gragename.toString());
        VCacheHelper.putString(key: CacheKeys.grageDescription, value: driverDataModel.adminData!.garage!.grageDescription.toString());
        VCacheHelper.putString(key: CacheKeys.gragePricePerHoure, value: driverDataModel.adminData!.garage!.gragePricePerHoure.toString());
        VCacheHelper.putString(key: CacheKeys.lat, value: driverDataModel.adminData!.garage!.lat.toString());
        VCacheHelper.putString(key: CacheKeys.lng, value: driverDataModel.adminData!.garage!.lng.toString());
        VCacheHelper.putString(key: CacheKeys.openDate, value: driverDataModel.adminData!.garage!.openDate.toString());
        VCacheHelper.putString(key: CacheKeys.endDate, value: driverDataModel.adminData!.garage!.endDate.toString());
        VCacheHelper.putString(key: CacheKeys.token, value: driverDataModel.token.toString());
        VCacheHelper.putString(key: CacheKeys.role, value: driverDataModel.adminData!.role.toString());
        // VCacheHelper.putString(key: CacheKeys.userName, value: driverDataModel.adminData!..toString());
        VCacheHelper.putString(key: CacheKeys.email, value: driverDataModel.adminData!.email.toString());
        logSuccess(driverDataModel.adminData!.email.toString());
        emit(VerifyResetPasswordSuccessState(message: 'Reset code sent to email. Please verify the code.'));
      } else if (response.statusCode == 422 || response.statusCode == 404) {
        logError(response.data['message'].toString());
        emit(VerifyResetPasswordErrorState(message: response.data['message'] ?? ''));
      } else {
        logError(response.data['message'].toString());
        emit(VerifyResetPasswordErrorState(message: 'Error in verify'));
      }
    } catch (error) {
      emit(VerifyResetPasswordErrorState(message: error.toString()));
    }
  }

}
