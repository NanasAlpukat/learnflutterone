import 'dart:convert';

// import 'package:apps/models/usersModels.dart';

import 'package:get/get.dart';


class UserProvider extends GetConnect {
  final url = "http://10.0.2.2:8080/api";
  // get
  Future<Response> getDataUser(String token) async {
  
    
    print(token);

    // final url1 = "https://cd4b-140-213-35-12.ngrok.io/api/students";
    var data = get(url + '/students', headers: {
      'Authorization': 'Bearer ' + token,
      'Accept': 'applcation/json'
    });
    return data;
  }

  // post
  Future<Response> postData(
      String nama, String email, String jk, String alamat, String agama) {
    final body = jsonEncode({
      'nama': nama,
      'email': email,
      'jk': jk,
      'alamat': alamat,
      'agama': agama,
    });
    var response = post(url + '/student', body);
    // var result = jsonDecode(response.body)['data'];
    return response;
  }

  // put
  Future<Response> putData(dynamic id, String nama, String email, String jk,
      String alamat, String agama) {
    final body = jsonEncode({
      'nama': nama,
      'email': email,
      'jk': jk,
      'alamat': alamat,
      'agama': agama,
    });
    var response = put(url + '/student/' + id.toString(), body);
    // var result = jsonDecode(response.body)['data'];
    return response;
  }

  Future<Response> deleteData(dynamic id) {
    var result = delete(url + '/student/' + id.toString());
    return result;
  }
}
