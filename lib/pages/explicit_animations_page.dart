// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ExplicitAnimationsPage extends StatefulWidget {
  const ExplicitAnimationsPage({super.key});

  @override
  State<ExplicitAnimationsPage> createState() => _ExplicitAnimationsPageState();
}

class _ExplicitAnimationsPageState extends State<ExplicitAnimationsPage>
    with TickerProviderStateMixin {
  late AnimationController _animationController1;

  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController1 = AnimationController(
      vsync: this,
      duration: Durations.medium4,
    );
    _scaleAnimation = Tween<double>(begin: 1, end: 5).animate(
      CurvedAnimation(parent: _animationController1, curve: Curves.easeInBack),
    );
  }

  @override
  void dispose() {
    _animationController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _animatedContainerExample(),
        ],
      ),
    );
  }

  Widget _animatedContainerExample() {
    return SizedBox(
      width: 500,
      child: Column(
        children: [
          ScaleTransition(
            scale: _scaleAnimation,
            child: Container(
              height: 50,
              width: 50,
              color: Colors.red,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                onPressed: () {
                  _animationController1.forward();
                },
                child: Text("forward"),
              ),
              MaterialButton(
                onPressed: () {
                  _animationController1.reverse();
                },
                child: Text("rev"),
              ),
              MaterialButton(
                onPressed: () {
                  _animationController1.stop();
                },
                child: Text("stop"),
              ),
              MaterialButton(
                onPressed: () {
                  _animationController1.reset();
                },
                child: Text("reset"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
