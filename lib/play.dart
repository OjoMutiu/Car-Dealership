// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
//
//
// class Play extends StatelessWidget {
//   const Play({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(child: Scaffold(
//       appBar: AppBar(
//         title: const Text('Play'),
//       ),
//        body: Column(
//          children: [
//            Text('Dey Play'),
//            SvgPicture.asset('assets/images/onboarding/image.svg',
//
//            ),
//
//          ],
//       ),
//     ));
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Play extends StatelessWidget {
  const Play({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Play'),
        ),
        body: Column(
          children: [
            const Text('Dey Play'),
            SvgPicture.asset(
              //Todo: Try svg webview and use asset from repo
              'assets/images/onboarding/image.svg',
            ),
          ],
        ),
      ),
    );
  }
}
