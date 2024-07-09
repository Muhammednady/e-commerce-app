import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/core/constant/connection_status.dart';
import 'package:http/http.dart' as http;

Future<Either<ConnectionStatus, Map>> addRequestWithImageOne(
      url, data, File? image,
      [String? namerequest]) async {
    namerequest ??= "files";

    var uri = Uri.parse(url);
    var request = http.MultipartRequest("POST", uri);
    request.headers.addAll({});  //{} = _headers

    if (image != null) {
      var length = await image.length();
      var stream = http.ByteStream(image.openRead());
      stream.cast();
      var multipartFile = http.MultipartFile(namerequest, stream, length,
          filename: basename(image.path));
      request.files.add(multipartFile);
    }

    // add Data to request
    data.forEach((key, value) {
      request.fields[key] = value;
    });
    // add Data to request
    // Send Request
    var myrequest = await request.send();
    // For get Response Body
    var response = await http.Response.fromStream(myrequest);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      Map responsebody = jsonDecode(response.body);
      return Right(responsebody);
    } else {
      var serverfailure;
      return  Left(StatusRequest.serverfailure as ConnectionStatus);
    }
  }
  
  class _myheaders {
  }
  
  enum StatusRequest {
   serverfailure}
  
  basename(path) {
  }
   //194 -- 193 - categories part 3 ( frontend ) ( Admin App)

 // to send image in api 
 //use multipartfile in mutlipartRequest in  http 