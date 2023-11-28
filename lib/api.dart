import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

String baseUrl = "http://127.0.0.1:8000";

class ApiService {
  Future<String> registerVehical(
      String vNo, String email, String username, String password) async {
    try {
      final response = await http.post(
          Uri.parse(
            "$baseUrl/signup/",
          ),
          body: {
            "v_no": vNo,
            "email": email,
            "username": username,
            "password": password,
          });

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.body);
        return response.body;
      } else {
        return "Not created";
      }
    } catch (e) {
      return "Error found";
    }
  }

  Future<Map<String, dynamic>> loginUser(
      String username, String password) async {
    try {
      final response = await http.post(
          Uri.parse(
            "$baseUrl/login/",
          ),
          body: {
            "username": username,
            "password": password,
          });

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        return {"username": "Not craeated"};
      }
    } catch (e) {
      return {"username": "Error"};
    }
  }

  Future<Map<String, dynamic>> getVehicalInfo(String username) async {
    try {
      Dio dio = Dio();

      final resposne = await dio.get("$baseUrl/details/", data: {
        "username": username,
      });
      final Map<String, dynamic> data = resposne.data;
      return data;
    } catch (e) {
      print(e);
      throw Exception("Not Found");
    }
  }

  Future<String> updateCreditBalance(
      String username, int amountToAdd) async {
    try {
      Dio dio = Dio();
      final response = await dio.put("$baseUrl/details/", data: {
        "username": username,
        "credit": 50,
      });
      print(response.data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data);
        return response.data;
      } else {
        return "Not created";
      }
    } catch (e) {
      print(e);
      return "Error found";
    }
  }

  Future<List> getPaymentHistory(String username) async {
    try {
      Dio dio = Dio();
      final response = await dio.get("$baseUrl/payment-history/", data: {
        "username": username,
      });

      return response.data as List;
    } catch (e) {
      print(e);
      throw Exception("Couldnt get data");
    }
  }

  Future<String> payAmout(String username, String toolBoothId) async {
    try {
      Dio dio = Dio();
      final response = await dio.post("$baseUrl/payment/", data: {
        "username": username,
        "t_id": toolBoothId,
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data);
        return response.data;
      } else {
        return "Not created";
      }
    } catch (e) {
      return "Error found";
    }
  }

  Future<Map<String,dynamic>> getAmoutToPay(String vehicalNo, String toolBoothId) async {
    try {
      Dio dio = Dio();
      final response = await dio.post("$baseUrl/toll-details/", data: {
        "v_no": vehicalNo,
        "t_id": toolBoothId,
      });

      
        print(response.data);
        return response.data;
      
      
    } catch (e) {
      throw Exception("Couldnt get data");
    }
  }
}
