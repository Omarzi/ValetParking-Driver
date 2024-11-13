import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:valetparking_driver/utils/constants/exports.dart';

part 'navigation_menu_state.dart';

class NavigationMenuCubit extends Cubit<NavigationMenuState> {
  NavigationMenuCubit() : super(NavigationMenuInitialState());

  static NavigationMenuCubit get(context) => BlocProvider.of(context);

  DioHelper dioHelper = DioHelper();

  /// Make Garage Active Or Not Function
  Future<void> makeGarageActiveOrNotFunction({required bool active, required String garageId}) async {
    emit(MakeGarageActiveOrNotLoadingState());
    try {
      final response =
      await dioHelper.putData(endPoint: '${ApiConstants.activeGarageUrl}$garageId', body: {
        'active': active,
      });

      if (response.statusCode == 200) {
        emit(MakeGarageActiveOrNotSuccessState(message: response.data['message']));
      } else if (response.statusCode == 422 || response.statusCode == 404) {
        logError(response.data['message'].toString());
        emit(MakeGarageActiveOrNotErrorState(message: response.data['message'] ?? ''));
      } else {
        logError(response.data['message'].toString());
        emit(MakeGarageActiveOrNotErrorState(message: 'Error in login'));
      }
    } catch (error) {
      logError(error.toString());
      emit(MakeGarageActiveOrNotErrorState(message: error.toString()));
    }
  }
}
