import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_sunshine_app/controllers/reserva_controller.dart';
import 'package:hotel_sunshine_app/views/payment_screen_view.dart';
import 'package:intl/intl.dart'; // Import necessário para a formatação de datas

class ReservaPage extends StatefulWidget {
  @override
  _ReservaPageState createState() => _ReservaPageState();
}

class _ReservaPageState extends State<ReservaPage> {
  final ReservaController reservaController = Get.put(ReservaController()); // Inicializa o controlador

  String? _selectedItem2;
  List<String> _items2 = ['1', '2', '3', '4', '5'];

  String? _selectedRadioItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reserva de Acomodações'),
        backgroundColor: Color.fromARGB(255, 220, 121, 0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => reservaController.setNomeCompleto(value),
              decoration: InputDecoration(
                labelText: 'Seu nome completo',
              ),
            ),
            SizedBox(height: 20),
            Obx(() => ListTile(
              title: Text('Data de Check-in: ${DateFormat('dd/MM/yyyy').format(reservaController.checkInDate.value)}'),
              trailing: Icon(Icons.keyboard_arrow_down),
              onTap: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: reservaController.checkInDate.value,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2101),
                );
                if (picked != null && picked != reservaController.checkInDate.value) {
                  reservaController.setCheckInDate(picked);
                }
              },
            )),
            Obx(() => ListTile(
              title: Text('Data de Check-out: ${DateFormat('dd/MM/yyyy').format(reservaController.checkOutDate.value)}'),
              trailing: Icon(Icons.keyboard_arrow_down),
              onTap: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: reservaController.checkOutDate.value,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2101),
                );
                if (picked != null && picked != reservaController.checkOutDate.value) {
                  reservaController.setCheckOutDate(picked);
                }
              },
            )),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: DropdownButton<String>(
                  hint: Text("Qual o numero de pessoas"),
                  value: _selectedItem2,
                  onChanged: (value) {
                    setState(() {
                      _selectedItem2 = value;
                    });
                    reservaController.setNumeroPessoas(value!);
                  },
                  items: _items2.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Center(child: Text(item)),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text("Escolha o tipo de quarto:", style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Column(
              children: [
                RadioListTile<String>(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Quarto Individual - R\$50.00/dia"),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Quarto Individual"),
                                content: Text("Informações sobre o Quarto Individual."),
                                actions: [
                                  TextButton(
                                    child: Text("Fechar"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Icon(Icons.info_outline),
                      ),
                    ],
                  ),
                  value: "Individual",
                  groupValue: _selectedRadioItem,
                  onChanged: (value) {
                    setState(() {
                      _selectedRadioItem = value;
                    });
                    reservaController.setTipoQuarto(value!);
                  },
                ),
                RadioListTile<String>(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Quarto Duplo - R\$90.00/dia"),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Quarto Duplo"),
                                content: Text("Informações sobre o Quarto Duplo."),
                                actions: [
                                  TextButton(
                                    child: Text("Fechar"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Icon(Icons.info_outline),
                      ),
                    ],
                  ),
                  value: "Duplo",
                  groupValue: _selectedRadioItem,
                  onChanged: (value) {
                    setState(() {
                      _selectedRadioItem = value;
                    });
                    reservaController.setTipoQuarto(value!);
                  },
                ),
                RadioListTile<String>(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Suíte - R\$95.00/dia"),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Suíte"),
                                content: Text("Informações sobre a Suíte."),
                                actions: [
                                  TextButton(
                                    child: Text("Fechar"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Icon(Icons.info_outline),
                      ),
                    ],
                  ),
                  value: "Suíte",
                  groupValue: _selectedRadioItem,
                  onChanged: (value) {
                    setState(() {
                      _selectedRadioItem = value;
                    });
                    reservaController.setTipoQuarto(value!);
                  },
                ),
                RadioListTile<String>(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Suíte Master - R\$160.00/dia"),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Suíte Master"),
                                content: Text("Informações sobre a Suíte Master."),
                                actions: [
                                  TextButton(
                                    child: Text("Fechar"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Icon(Icons.info_outline),
                      ),
                    ],
                  ),
                  value: "Suíte Master",
                  groupValue: _selectedRadioItem,
                  onChanged: (value) {
                    setState(() {
                      _selectedRadioItem = value;
                    });
                    reservaController.setTipoQuarto(value!);
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            TextField(
              onChanged: (value) => reservaController.setObservacao(value),
              decoration: InputDecoration(
                labelText: 'Alguma Observação ',
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Confirmação de Reserva"),
                      content: Text("Caso deseje prosseguir você será levado até a tela de pagamento"),
                      actions: [
                        TextButton(
                          child: Text("Cancelar"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text("Confirmar"),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PurchaseDetailsPage()),
                            );
                          },
                        ),
                      ],
                    );
                  },
                );
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
              child: Text('Confirmar Reserva', style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
