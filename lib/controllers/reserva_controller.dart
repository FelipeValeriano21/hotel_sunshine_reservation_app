import 'package:get/get.dart';

class ReservaController extends GetxController {
  var checkInDate = DateTime.now().obs;
  var checkOutDate = DateTime.now().obs;
  var accommodationPreferences = ''.obs;

  void setCheckInDate(DateTime date) {
    checkInDate.value = date;
  }

  void setCheckOutDate(DateTime date) {
    checkOutDate.value = date;
  }

  void setAccommodationPreferences(String preferences) {
    accommodationPreferences.value = preferences;
  }
}
