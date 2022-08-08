import 'package:dio/dio.dart';
import 'package:dra_project/request_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient {
  final Dio _dio = Dio();

  //final base_url = "http://3.223.85.137/disaster_reconstruction/api/";
  Future<dynamic> login(
    String email,
    String password,
  ) async {
    // var map = {'abcd': email};
    try {
      Response response = await _dio.post(
        'http://3.223.85.137/disaster_reconstruction/api/auth/login',
        // options: Options(
        //  headers: {'Authorization': 'Bearer '},
        // ),
        data: {
          'email': email,
          'password': password,
          // 'accessToken': access_token,
        },
      );
      //returns the successful user data json object
      return response;
    } on DioError catch (e) {
      //returns the error object if any
      print(e);
      return e.response;
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
      return e.response;
    }
  }

  Future<dynamic> Resend(String email) async {
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
      return e.response;
    }
  }

  ValidateOTP(String email, String otp) async {
    try {
      Response response = await _dio.get(
        'http://3.223.85.137/disaster_reconstruction/api/verify_otp',
        queryParameters: {
          'email': email,
          'otp': otp,
        },
      );
      //returns the successful user data json object
      return response;
    } on DioError catch (e) {
      //returns the error object if any

      return e.response;
    }
  }

  Future<dynamic> ResetPassword(String email, String password) async {
    try {
      Response response = await _dio.post(
        'http://3.223.85.137/disaster_reconstruction/api/change_password',
        data: {'email': email, 'password': password},
      );
      //returns the successful user data json object
      return response;
    } on DioError catch (e) {
      //returns the error object if any
      return e.response;
    }
  }

  Logout(String accesstoken) async {
    SharedPreferences.getInstance().then((value) => value.get("access"));
    try {
      Response response = await _dio.post(
        'http://3.223.85.137/disaster_reconstruction/api/logout',
        options: Options(
          headers: {'Authorization': 'Bearer $accesstoken'},
        ),
      );
      //returns the successful user data json object
      return response;
    } on DioError catch (e) {
      //returns the error object if any
      return e.response;
    }
  }

  Future<dynamic> requestinfo(
    String email,
    String password,
  ) async {
    //  var map = {'email': _formKey.text};
    try {
      Response response = await _dio.post(
        'http://3.223.85.137/disaster_reconstruction/api/assessments/store/1',
        // options: Options(
        //  headers: {'Authorization': 'Bearer '},
        // ),
        data: {
          'email': email,
          'password': password,

          // 'accessToken': access_token,
        },
      );
      //returns the successful user data json object
      return response;
    } on DioError catch (e) {
      //returns the error object if any
      print(e);
      return e.response;
    }
  }

  assessment(String accessToken) async {
    try {
      Response response = await _dio.post(
        'http://3.223.85.137/disaster_reconstruction/api/assessments/store/1',
        // queryParameters: {'apikey': ApiSecret.apiKey},
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );
      return response.data;
    } on DioError catch (e) {
      return e.response;
    }
  }

  Future<dynamic> Change_Password(String email, String password,String accesstoken) async {
    try {
      print(email);
      Response response = await _dio.post(
        'http://3.223.85.137/disaster_reconstruction/api/change_password',
        options: Options(
          headers: {'Authorization': 'Bearer $accesstoken'},
        ),
        data: {'email': email, 'password': password},
      );
      //returns the successful user data json object
      return response;
    } on DioError catch (e) {
      //returns the error object if any
      return e.response;
    }
  }
  Future<dynamic> editProfile(String email,String accesstoken,String first_name,String last_name,String mobile_no,String address,String state,String city,String pincode, ) async {
    try {
      print(email);
      Response response = await _dio.post(
        'http://3.223.85.137/disaster_reconstruction/api/user_update',
        options: Options(
          headers: {'Authorization': 'Bearer $accesstoken'},
        ),
        data: {'email': email, "first_name" : first_name,"last_name" : last_name,"mobile_no" : mobile_no, "address" : address, "state":state,"city" :city, "pincode" : pincode },
      );
      //returns the successful user data json object
      return response;
    } on DioError catch (e) {
      //returns the error object if any
      return e.response;
    }
  }
  Future<dynamic> requestinfoedit({required String web_id,required String accesstoken,required String first_name,required String address,required String island,required String phone_number,required String accessor_id,required String assement_request_id,required String status,required String flag,required String email,required String home_number,required String settlement, required String id }) async {
    try {

      print('phone_number ${assement_request_id}');




      Response response = await _dio.post(
        'http://3.223.85.137/disaster_reconstruction/api/assessments/update',
        options: Options(
          headers: {'Authorization': 'Bearer $accesstoken'},
        ),
        data: {'email': email,'str_id':id, "first_name" : first_name,"phone_number" : phone_number, "address" :address , "island":island,"accessor_id" :accessor_id, "assement_request_id" : assement_request_id,"status": status,"flag" : flag,"home_number":home_number,"settlement":settlement,"web_id":web_id },
      );
      //returns the successful user data json object
      return response;
    } on DioError catch (e) {
      //returns the error object if any
      return e.response;
    }
  }

  Future<dynamic> damagesApi(_datas, id) async {

    print("xcscdscdsfdsfsdf $_datas");

    try {
      Response response = await _dio.post(
        'http://3.223.85.137/disaster_reconstruction/api/assessments/store/${id}',
        // options: Options(
        //   headers: {'Authorization': 'Bearer $accesstoken'},
        // ),
        data: _datas,
      );
      //returns the successful user data json object
      return response;
    } on DioError catch (e) {
      //returns the error object if any
      return e.response;
    }
  }

  Future<dynamic> Comment_screen(String Comments,
      String accesstoken,String str_id) async {


    print("fsfsfsfsf $Comments  : $str_id");

    try {
      print(Comments);
      Response response = await _dio.post(
        'http://3.223.85.137/disaster_reconstruction/api/assessments/store/1',
        // options: Options(
        //   headers: {'Authorization': 'Bearer $accesstoken'},
        // ),
        data: {'additional-comment': "$Comments", 'request_id': "$str_id", 'form_type': 'create', 'step': '3' },
      );
      //returns the successful user data json object
      return response;
    } on DioError catch (e) {
      //returns the error object if any
      return e.response;
    }
  }

}
