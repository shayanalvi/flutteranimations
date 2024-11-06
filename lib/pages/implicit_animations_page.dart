import 'dart:ui';
import 'package:flutter/material.dart';

class ImplicitAnimationsPage extends StatefulWidget {
  const ImplicitAnimationsPage({super.key});

  @override
  State<ImplicitAnimationsPage> createState() => _ImplicitAnimationsPageState();
}

class _ImplicitAnimationsPageState extends State<ImplicitAnimationsPage> {
  bool trigger = false;
  double blurValue = 0.01;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _animatedContainerExample(),
          _tweenAnimatedBuilderExample(),
        ],
      ),
    );
  }

  Widget _animatedContainerExample() {
    return Column(
      children: [
        AnimatedContainer(
          height: 300,
          width: 300,
          duration: Durations.long4,
          curve: Curves.easeInOutSine,
          decoration: BoxDecoration(
            color: trigger ? Colors.yellow : Colors.pink,
            border: Border.all(
              color: trigger ? Colors.green : Colors.orange,
              width: 20,
            ),
          ),
        ),
        MaterialButton(
          onPressed: () {
            setState(() {
              trigger = !trigger;
            });
          },
          child: const Text("Trigger"),
        ),
      ],
    );
  }

  Widget _tweenAnimatedBuilderExample() {
    return SizedBox(
      width: 200,
      child: Column(
        children: [
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0.01, end: blurValue),
            duration: const Duration(seconds: 8),
            builder: (BuildContext context, double? value, Widget? child) {
              return SizedBox(
                height: 100,
                width: 100,
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(
                    sigmaX: value ?? 0.01 * 40,
                    sigmaY: value ?? 0.01 * 40,
                  ),
                  child: const Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      // Use a more reliable, free image URL for testing
                      'https://picsum.photos/200/300',
                    ),
                  ),
                ),
              );
            },
          ),
          Slider(
            value: blurValue,
            min: 0.01,
            max: 10,
            onChanged: (value) {
              setState(() {
                blurValue = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
