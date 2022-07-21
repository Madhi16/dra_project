import 'package:dio/dio.dart';
class ApiClient {
  final Dio _dio = Dio();
  Future<dynamic> login(String email, String password) async {
    try {
      Response response = await _dio.post(
        'http://3.223.85.137/disaster_reconstruction/api/auth/login',
        data: {
          'email': email,
          'password': password
        },
      );
      //returns the successful user data json object
      return response;
    } on DioError catch (e) {
      //returns the error object if any
      print(e);
      return e.response!.data;
    }
  }
  Future<dynamic> ForgotPassword(String email) async {
    try {
      Response response = await _dio.post(
        'http://3.223.85.137/disaster_reconstruction/api/forgot_password',
        data: {
          'email': email,
        },
      );
      //returns the successful user data json object
      return response;
    } on DioError catch (e) {
      //returns the error object if any
      print(e);
      return e.response!.data;
    }
  }
  ValidateOTP(String email,String otp) async {
    try {
      Response response = await _dio.get(
        'http://3.223.85.137/disaster_reconstruction/api/verify_otp',
         queryParameters: {
          'email': email,
            'otp' : otp,
        },
      );
      //returns the successful user data json object
      return response;
    } on DioError catch (e) {
      //returns the error object if any


      return e.response;
    }
  }
  Future<dynamic> ResetPassword(String email,String password) async {
    try {
      Response response = await _dio.post(
        'http://3.223.85.137/disaster_reconstruction/api/change_password',
        data: {
          'email': email,
          'password': password
        },
      );
      //returns the successful user data json object
      return response;
    } on DioError catch (e) {
      //returns the error object if any
      return e.response!.data;
    }
  }
}