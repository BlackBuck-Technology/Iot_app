class ApiConstants {

  //For Login, Registration and Forgot/update password
  static const String baseUrl =
      "https://iot-backend-production-5190.up.railway.app/api/v1";
  static const String registerEndpoint = '/auth/register';
  static const String loginEndpoint = '/auth/login';
  static const String forgotPasswordEndpoint = '/auth/forgot-password';
  static const String updatePasswordEndpoint = '/auth/update-password';

  //For KYC
  static const String baseUrlForKyc =
      "https://iot-backend-production-5190.up.railway.app/api/v1/kyc";
  static const String kycStatusEndpoint = "/me";
  static const String saveKycPersonalEndpoint = "/personal";
  static const String saveKycCitizenshipEndpoint = "/citizenship";
  static const String saveKycLicenseEndpoint = "/license";
  static const String saveKycVehicleEndpoint = "/vehicle";
  static const String submitKyc = '/submit';
}
