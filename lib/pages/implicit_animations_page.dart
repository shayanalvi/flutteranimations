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
          decoration: BoxDecoration(
              color: trigger ? Colors.yellow : Colors.pink,
              border: Border.all(
                  color: trigger ? Colors.green : Colors.orange, width: 20)),
        ),
        MaterialButton(
          onPressed: () {
            setState(() {
              trigger = !trigger;
            });
          },
          child: const Text("Trigger"),
        )
      ],
    );
  }

  Widget _tweenAnimatedBuilderExample() {
    return SizedBox(
      width: 200,
      child: Column(
        children: [
          Slider(
              value: blurValue,
              min: 0.01,
              max: 10,
              onChanged: (value) {
                setState(() {
                  blurValue = value;
                });
              })
        ],
      ),
    );
  }
}
