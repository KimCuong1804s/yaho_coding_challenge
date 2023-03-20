import 'package:flutter/material.dart';

class LoadingProgress extends StatelessWidget {
  const LoadingProgress(this.width, this.height, {super.key});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.transparent,
      alignment: Alignment.center,
      child: const SizedBox(
        width: 100,
        height: 100,
        child: CircularProgressIndicator(
          strokeWidth: 5,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }

}