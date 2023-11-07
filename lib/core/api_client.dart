import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio();

  Future<Response> registerUser(Map<String, dynamic>? userData) async {
    try {
      Response response = await _dio.post(
          'http://127.0.0.1:8000/register-user', // ENDPOINT URL
          data: userData, // REQUEST BODY
          queryParameters: {'apikey': 'YOUR_API_KEY'}, // QUERY PARAMETERS
          options: Options(headers: {'X-LoginRadius-Sott': 'YOUR_SOTT_KEY'}), // HEADERS
      );
      // returns the successful json object
      return response.data;
    } on DioError catch (e) {
      // returns the error object if there is
      return e.response!.data;
    }
  }

  Future<Response> login(String email, String password) async {
    try {
      Response response = await _dio.post(
        'http://127.0.0.1:8000/login', // ENDPOINT URL
        data: {
          'email': email,
          'password': password
        },
        queryParameters: {'apikey': 'YOUR_API_KEY'},
      );
      // returns the successful user data json object
      return response.data;
    } on DioError catch (e) {
      // returns the error object if any
      return e.response!.data;
    }
  }

  Future<Response> getUserProfileData(String accessToken) async {
    try {
      Response response = await _dio.get(
        'http://127.0.0.1:8000/get-user-profile-data',
        queryParameters: {'apikey': 'YOUR_API_KEY'},
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
          },
        ),
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<Response> logout(String accessToken) async {
    try {
      Response response = await _dio.get(
        'http://127.0.0.1:8000/logout',
        queryParameters: {'apikey': 'YOUR_API_KEY'},
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
          },
        ),
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }
}
