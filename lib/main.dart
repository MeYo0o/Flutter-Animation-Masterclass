//EP1 - 10
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'pages/ep1_to_ep10/animated_container_page.dart';
// import 'pages/ep1_to_ep10/animated_opacity_page.dart';
// import 'pages/ep1_to_ep10/tween_animation_builder_page.dart';
//
// enum AnimationExample {
//   animatedContainer,
//   animatedOpacity,
//   tweenAnimationBuilder,
// }
//
// extension on AnimationExample {
//   String capitalizeFirstCharacter() {
//     final name = describeEnum(this);
//     return name.replaceRange(0, 1, name.characters.first.toUpperCase());
//   }
// }
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.indigo,
//       ),
//       home: Scaffold(
//         appBar: AppBar(title: const Text('Animations Playground')),
//         body: const AnimationExamplesList(),
//       ),
//       onGenerateRoute: (settings) {
//         switch (settings.name) {
//           case 'animatedContainer':
//             return MaterialPageRoute(
//                 builder: (_) => const AnimatedContainerPage());
//           case 'animatedOpacity':
//             return MaterialPageRoute(
//                 builder: (_) => const AnimatedOpacityPage());
//           case 'tweenAnimationBuilder':
//             return MaterialPageRoute(
//                 builder: (_) => const TweenAnimationBuilderPage());
//           default:
//             throw UnimplementedError(
//                 'Route ${settings.name} not implemented');
//         }
//       },
//     );
//   }
// }
//
// class AnimationExamplesList extends StatelessWidget {
//   const AnimationExamplesList({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemBuilder: (context, index) {
//         final example = AnimationExample.values[index];
//         final routeName = describeEnum(example);
//         debugPrint(routeName);
//         return ListTile(
//           title: Text(example.capitalizeFirstCharacter()),
//           trailing: const Icon(Icons.chevron_right),
//           onTap: () => Navigator.of(context).pushNamed(routeName),
//         );
//       },
//       itemCount: AnimationExample.values.length,
//     );
//   }
// }

//EP11 - 24
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_animations_masterclass/pages/ep11_to_ep24/stopwatch.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.dark().copyWith(
//         scaffoldBackgroundColor: Colors.black,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const AnnotatedRegion<SystemUiOverlayStyle>(
//       value: SystemUiOverlayStyle.light,
//       child: Scaffold(
//         body: Center(
//           child: Padding(
//             padding: EdgeInsets.all(32),
//             child: AspectRatio(
//               aspectRatio: 0.85,
//               child: MeYoStopWatch(),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//EP25 -
import 'package:flutter/material.dart';

import 'pages/ep25_to_ep/constants/app_assets.dart';
import 'pages/ep25_to_ep/constants/app_colors.dart';
import 'pages/ep25_to_ep/ui/home/home_page.dart';
import 'pages/ep25_to_ep/ui/theming/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppAssets.preloadSVGs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Helvetica Neue',
      ),
      home: AppTheme(
        data: AppThemeData.defaultWithSwatch(AppColors.red),
        child: HomePage(),
      ),
    );
  }
}
