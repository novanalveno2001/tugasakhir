import 'package:get/get.dart';
import 'package:tugasakhir/mock api/datadata.dart';
import 'package:tugasakhir/mock api/akses API.dart';
import 'package:tugasakhir/mock api/data_screen.dart';

class Controller extends GetxController {
  final Users users;
  List<Users> listUsers = [];
  Repository repository = Repository();

  getData() async {
    listUsers = await repository.getData();
  }


  var barang = 0.obs;

  Controller(this.users);

  tambahBarang() {
    return barang.value++;
  }

  removeBarang() {
    if(barang.value > 0){
      return barang.value--;
    }
  }

  sumTotal() {
    return barang.value * int.parse(users.price);

  }

}