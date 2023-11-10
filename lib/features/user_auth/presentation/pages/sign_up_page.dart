import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopgo_01/features/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:shopgo_01/features/user_auth/presentation/pages/login_page.dart';
import 'package:shopgo_01/features/user_auth/presentation/widgets/form_container_widget.dart';
import 'package:shopgo_01/global/common/toast.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool isSigningUp = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Es el encabezado
      /*appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Registrar"),
      ),*/
      backgroundColor: const Color.fromARGB(255, 28, 75, 30),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Registrarse",
                style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 30,
              ),
              FormContainerWidget(
                controller: _usernameController,
                hintText: "Nombre",
                isPasswordField: false,
              ),
              SizedBox(
                height: 10,
              ),
              FormContainerWidget(
                controller: _emailController,
                hintText: "Correo",
                isPasswordField: false,
              ),
              SizedBox(
                height: 10,
              ),
              FormContainerWidget(
                controller: _passwordController,
                hintText: "Contraseña",
                isPasswordField: true,
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  _signUp();
                },
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: isSigningUp
                          ? CircularProgressIndicator(
                              color: Colors.blue,
                            )
                          : Text(
                              "Registarse",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Ya tienes una cuenta?"),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                            (route) => false);
                      },
                      child: Text(
                        "Iniciar  sesión",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _signUp() async {
    setState(() {
      isSigningUp = true;
    });

    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    setState(() {
      isSigningUp = false;
    });
    if (user != null) {
      showToast(message: "Se ha creado correctamente");
      Navigator.pushNamed(context, "/home");
    } else {
      showToast(message: "A courrido un error");
    }
  }
}
