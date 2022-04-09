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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animations_masterclass/pages/ep11_to_ep/stopwatch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Center(
          child: MeYoStopWatch(),
        ),
      ),
    );
  }
}
