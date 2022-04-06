import 'package:flutter/material.dart';

class TweenAnimationBuilderPage extends StatelessWidget {
  const TweenAnimationBuilderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TweenAnimationBuilder'),
      ),
      body: const Center(
        child: HSVColorSelector(),
      ),
    );
  }
}

class HSVColorSelector extends StatefulWidget {
  const HSVColorSelector({Key? key}) : super(key: key);

  @override
  _HSVColorSelectorState createState() => _HSVColorSelectorState();
}

class _HSVColorSelectorState extends State<HSVColorSelector> {
  double _hue = 0.0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 1500),
          height: 200,
          width: 200,
          color: HSVColor.fromAHSV(1.0, _hue, 1.0, 1.0).toColor(),
        ),
        const SizedBox(height: 40),
        TweenAnimationBuilder<double>(
          tween: Tween<double>(
            begin: 0.0,
            end: _hue,
          ),
          duration: const Duration(milliseconds: 1500),
          builder: (context, hueValue, child) {
            final hsvColor = HSVColor.fromAHSV(1.0, hueValue, 1.0, 1.0);
            return Container(
              height: 200,
              width: 200,
              color: hsvColor.toColor(),
            );
          },
        ),
        const SizedBox(height: 20),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          height: 30,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                for (double i = 0; i <= 360; i++)
                  HSVColor.fromAHSV(1.0, i, 1.0, 1.0).toColor()
              ],
              stops: [for (double i = 0; i <= 360; i++) i / 360],
            ),
          ),
        ),
        Slider(
          min: 0.0,
          max: 360.0,
          value: _hue,
          onChanged: (double newValue) {
            setState(() {
              _hue = newValue;
            });
          },
        ),
      ],
    );
  }
}
