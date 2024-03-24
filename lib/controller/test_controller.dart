import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/core/constant/connection_status.dart';
import 'package:ecommerceapp/data/datasources/remote/test_data.dart';
import 'package:get/get.dart';

class TestController extends GetxController {
  late ConnectionStatus _connectionStatus;

  get getStatus => _connectionStatus;

   List data = [];
  // dynamic data;
   TestData testData = TestData(crud: Get.find());

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
    
  }

   getData() async{
    _connectionStatus = ConnectionStatus.LOADING;

    final response = await testData.postData();

    if (response is ConnectionStatus) {
      _connectionStatus = cast<ConnectionStatus>(response)  ;
    } else{
      print('=========================================+++++++++=============');
      print(response);
     // data = response;
      _connectionStatus = ConnectionStatus.SUCCESS;
       data.addAll(response);
      // if (response['status'] == FAILURE_RESPONSE) {
      //   _connectionStatus = ConnectionStatus.FAILURE;
      // } else {
      //   _connectionStatus = ConnectionStatus.SUCCESS;
      //   data.addAll(response['data']);
      // }
    }
    update();
  }
}
