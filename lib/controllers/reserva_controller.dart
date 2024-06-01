import 'package:get/get.dart';

class ReservaController extends GetxController {
  var nomeCompleto = ''.obs;
  var checkInDate = DateTime.now().obs;
  var checkOutDate = DateTime.now().obs;
  var numeroPessoas = ''.obs;
  var tipoQuarto = ''.obs;
  var observacao = ''.obs;

  void setNomeCompleto(String value) => nomeCompleto.value = value;
  void setCheckInDate(DateTime value) => checkInDate.value = value;
  void setCheckOutDate(DateTime value) => checkOutDate.value = value;
  void setNumeroPessoas(String value) => numeroPessoas.value = value;
  void setTipoQuarto(String value) => tipoQuarto.value = value;
  void setObservacao(String value) => observacao.value = value;
}