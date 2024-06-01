import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_sunshine_app/controllers/reserva_controller.dart';
import 'package:intl/intl.dart'; // Import necessário para a formatação de datas

class PurchaseDetailsPage extends StatelessWidget {
  final ReservaController reservaController = Get.find(); // Busca o controlador já existente

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes da Compra'),
        backgroundColor: Color.fromARGB(255, 220, 121, 0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Reserva R12345',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Obx(() => Text(
              'Data check-in: ${DateFormat('dd/MM/yyyy').format(reservaController.checkInDate.value)}',
              style: TextStyle(fontSize: 18),
            )),
            SizedBox(height: 10),
            Obx(() => Text(
              'Data check-out: ${DateFormat('dd/MM/yyyy').format(reservaController.checkOutDate.value)}',
              style: TextStyle(fontSize: 18),
            )),
            SizedBox(height: 20),
            Obx(() => Text(
              'Cliente: ${reservaController.nomeCompleto.value}',
              style: TextStyle(fontSize: 18),
            )),
            SizedBox(height: 60),
            Text(
              'Itens:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  Obx(() => ListTile(
                    title: Text('Numero de Pessoas'),
                    trailing: Text(reservaController.numeroPessoas.value),
                  )),
                  Obx(() => ListTile(
                    title: Text('Tipo de Acomodação'),
                    trailing: Text(reservaController.tipoQuarto.value),
                  )),
                  ListTile(
                    title: Text('Numero de diarias'),
                    trailing: Obx(() => Text(((reservaController.checkOutDate.value.difference(reservaController.checkInDate.value).inDays).toString()))),
                  ),
                ],
              ),
            ),
            Divider(),
            SizedBox(height: 10),
            Obx(() => Text(
              'Subtotal: R\$${calculaSubtotal()}',
              style: TextStyle(fontSize: 18),
            )),
            Text(
              'Taxa de Serviço: R\$5.00',
              style: TextStyle(fontSize: 18),
            ),
            Obx(() => Text(
              'Total: R\$${calculaTotal()}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Lógica para confirmar a compra
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 0, 88, 195)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 50.0),
                  ),
                ),
                child: Text(
                  'Confirmar Compra',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double calculaSubtotal() {
    double precoPorDia;
    switch (reservaController.tipoQuarto.value) {
      case 'Individual':
        precoPorDia = 50.0;
        break;
      case 'Duplo':
        precoPorDia = 90.0;
        break;
      case 'Suíte':
        precoPorDia = 95.0;
        break;
      case 'Suíte Master':
        precoPorDia = 160.0;
        break;
      default:
        precoPorDia = 0.0;
        break;
    }
    int numeroDiarias = reservaController.checkOutDate.value.difference(reservaController.checkInDate.value).inDays;
    return precoPorDia * numeroDiarias;
  }

  double calculaTotal() {
    return calculaSubtotal() + 5.0; // Inclui a taxa de serviço
  }
}
