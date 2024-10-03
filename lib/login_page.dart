import 'package:flutter/material.dart';
import 'package:flutter_application_1/kendaraan.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = '';
  String password = '';
  bool isLoginSuccess = true;
  bool visible = false; // Untuk mengatur visibilitas password

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login Page'),
          backgroundColor: Colors.blueGrey[900], 
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0), 
          child: Column(
            children: [
              usernameField(),
              SizedBox(height: 16), 
              passwordField(),
              SizedBox(height: 16), 
              loginButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget usernameField() {
    return TextFormField(
      onChanged: (value) {
        username = value; 
      },
      decoration: InputDecoration(
        labelText: 'Username',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blueGrey), 
        ),
      ),
    );
  }

  Widget passwordField() {
    return TextFormField(
      onChanged: (value) {
        password = value; 
      },
      obscureText: !visible, 
      decoration: InputDecoration(
        labelText: 'Password',
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              visible = !visible; 
            });
          },
          icon: Icon(visible ? Icons.visibility : Icons.visibility_off),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blueGrey), 
        ),
      ),
    );
  }

  Widget loginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        String text = '';
        if (username == 'admin' && password == 'admin') {
          // Pindah ke KendaraanPage jika login berhasil
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => KendaraanPage(username: username), // Kirim username
            ),
          );
          setState(() {
            text = 'Login Berhasil';
            isLoginSuccess = true;
          });
        } else {
          setState(() {
            text = 'Login Gagal';
            isLoginSuccess = false;
          });
        }

        SnackBar snackBar = SnackBar(
          backgroundColor: isLoginSuccess ? Colors.green : Colors.red,
          content: Text(text),
          duration: const Duration(seconds: 3),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueGrey[800], 
        padding: const EdgeInsets.symmetric(vertical: 15), 
        textStyle: const TextStyle(fontSize: 18), 
      ),
      child: const Text('Login'),
    );
  }
}
