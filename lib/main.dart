import 'package:flutter/material.dart';

void main() {
  runApp(ImageRotate());
}

class ImageRotate extends StatefulWidget {
  const ImageRotate({Key? key}) : super(key: key);

  @override
  State<ImageRotate> createState() => _ImageRotateState();
}

class _ImageRotateState extends State<ImageRotate>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 8));
    animationController!.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: AnimatedBuilder(
        animation: animationController!,
        child: Container(
          child: Image.asset(
            'images/batmanlogo.png',
            fit: BoxFit.contain,
          ),
        ),
        builder: (context, child) {
          return Transform.rotate(
            angle: animationController!.value * 6.3,
            child: child,
          );
        },
      ),
    );
  }
}
