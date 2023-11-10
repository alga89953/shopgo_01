import 'package:flutter/material.dart';
//import 'package:flare_flutter/flare_actor.dart';

class SplashScreen extends StatefulWidget {
  final Widget? child;
  const SplashScreen({super.key, this.child});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => widget.child!),
          (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 28, 75, 30),
      body: Center(
        child: Text(
          "Bienvenido a ShopGo",
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// // //

// class SplashScreen extends StatefulWidget {
//   final Widget? child;

//   const SplashScreen({super.key, this.child});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     Future.delayed(Duration(seconds: 3), () {
//       Navigator.pushAndRemoveUntil(
//           context,
//           MaterialPageRoute(builder: (context) => widget.child!),
//           (route) => false);
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 28, 75, 30),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               height: 150,
//               width: 150,
//               child: FlareActor(
//                 "assets/your_animation.flr", // Reemplaza con la ruta de tu archivo de animación Flare
//                 animation:
//                     "your_animation_name", // Reemplaza con el nombre de la animación en tu archivo Flare
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               "Bienvenido a ShopGo",
//               style: TextStyle(
//                 color: Colors.blue,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
