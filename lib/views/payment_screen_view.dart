import 'package:flutter/material.dart';

class PurchaseDetailsPage extends StatelessWidget {
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
            Text(
              'Data check-in: 28/05/2024',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
              Text(
              'Data check-out: 30/05/2024',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Cliente: João Silva',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 60),
            Text(
              'Itens:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text('Numero de Pessoas'),
                    trailing: Text('4'),
                  ),
                  ListTile(
                    title: Text('Tipo de Acomodação'),
                    trailing: Text('Suite Master'),
                  ),
                  ListTile(
                    title: Text('Numero de diarias'),
                    trailing: Text('3'),
                  ),
                ],
              ),
            ),
            Divider(),
            SizedBox(height: 10),
            Text(
              'Subtotal: R\$50.00',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Taxa de Serviço: R\$5.00',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Total: R\$55.00',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
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
}

void main() {
  runApp(MaterialApp(
    home: PurchaseDetailsPage(),
  ));
}
