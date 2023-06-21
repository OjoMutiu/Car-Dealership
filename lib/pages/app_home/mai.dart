// import 'package:flutter/material.dart';
// import 'package:oloworay_autos_/widgets/default_elevated_button.dart';
//
// import '../../constants/app_colors.dart';
// import '../../constants/app_dimensions.dart';
// import '../../widgets/default_outlined_button.dart';
//
// class Mai extends StatelessWidget {
//   const Mai({Key? key}) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: EdgeInsets.symmetric(horizontal: AppDimension.getProportionateScreenHeight(10)),
//         child: Column(
//           children: [
//             Text('Devv', style: Theme.of(context).textTheme.displayLarge?.copyWith(
//               fontSize: AppDimension.font22
//             ),),
//             Text('Flutter Demo Home Page', style: TextStyle(
//               color: AppColors.primary600,
//               fontSize:  AppDimension.getProportionateScreenHeight(20),
//             ),),
//             DefaultElevatedButton(bText: 'Hey', press: () {}, height: 44,),
//             SizedBox(height: AppDimension.height12,),
//             DefaultOutlinedButton(bText: 'Sup', press: () {},),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../controllers/sign_up_controller.dart';
//
// class Home extends StatelessWidget {
//
//   @override
//   Widget build(context) {
//
//     // Instantiate your class using Get.put() to make it available for all "child" routes there.
//     final UserController c = Get.put(UserController());
//
//     return Scaffold(
//       // Use Obx(()=> to update Text() whenever count is changed.
//         appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),
//
//         // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
//         body: Center(child: ElevatedButton(
//             child: const Text("Go to Other"), onPressed: () => Get.to(Other()))),
//         floatingActionButton:
//         FloatingActionButton(child: Icon(Icons.add), onPressed: c.increment));
//   }
// }
//
// class Other extends StatelessWidget {
//   // You can ask Get to find a Controller that is being used by another page and redirect you to it.
//   final UserController c = Get.find();
//
//   @override
//   Widget build(context){
//     // Access the updated count variable
//     return Scaffold(body: Center(child: Text("${c.count}")));
//   }
// }