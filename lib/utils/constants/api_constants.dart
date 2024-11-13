class ApiConstants {
  // static const baseUrl = 'http://192.168.1.12:8080/';
  static const baseUrl = 'https://valet-parking-back-end-production.up.railway.app/';

  static const loginUrl = 'owner/login';
  static const verifyResetCodeOfLoginUrl = 'owner/verifyResetCode';
  static const verifyOTPUrl = 'api/user/login';
  static const fillYourAccountUrl = 'api/user/register';
  static const countryUrl = 'api/country';
  static const cityUrl = 'api/city';
  static const makeScanUrl = 'driver/makeScan';
  static const servicesUrl = 'api/service';
  static const activeGarageUrl = 'driver/activeGarage/';
  static const takeAttendanceStartInUrl = 'driver/takeAttendanceStartIn';
  static const getAllOrdersUrl = 'driver/getAllOrderBySpecificGarage';
  static const takeAttendanceEndInUrl = 'driver/takeAttendancesEndIn';
  static const getSpecificOrderUrl = 'driver/getOrder/';
  static const addNewUserUrl = 'driver/addNewUser';
  static const makeOrderUrl = 'user/makeOrder/';
  static const getAllAddressesUrl = 'api/user/location';
  static const subServiceUrl = 'api/sub_service';
  static const orderUrl = 'api/user/order';
  static const faqCategoryUrl = 'api/faq-category';
  static const faqIndexUrl = 'api/faq';
  static const getProfileDataUrl = 'api/user/profile';
  static const profileDataUrl = 'api/user/update-profile';
  static const customerServicesUrl = 'api/ticket';
}