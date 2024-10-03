import 'package:flutter/material.dart';
import 'package:flutter_application_1/vehicle-data.dart';
import 'package:flutter_application_1/login_page.dart'; // Pastikan untuk mengimpor halaman login Anda

class KendaraanPage extends StatelessWidget {
  final String username; // Menyimpan username

  KendaraanPage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Kendaraan'),
        backgroundColor: Colors.blueGrey[900], 
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout', 
            onPressed: () {
              // Pindah ke halaman login jika logout
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Menampilkan pesan selamat datang
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                "Selamat Datang, $username!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: vehicleList.length,
              itemBuilder: (context, index) {
                final vehicle = vehicleList[index];
                return GestureDetector(
                  onTap: () {
                    // Tampilkan detail kendaraan saat diklik
                    _showVehicleDetail(context, vehicle);
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Image.network(vehicle.imageUrls[0]),
                        Text(vehicle.name),
                        Text(vehicle.type),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
        child: const Icon(Icons.logout), 
        tooltip: 'Logout', 
      ),
    );
  }

  void _showVehicleDetail(BuildContext context, vehicle) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(vehicle.name),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(vehicle.imageUrls[0]),
              Text('Type: ${vehicle.type}'),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('Tutup'),
              onPressed: () {
                Navigator.of(context).pop(); 
              },
            ),
          ],
        );
      },
    );
  }
}
