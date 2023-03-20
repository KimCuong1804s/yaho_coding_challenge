import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar(this.imageUrl, {super.key});

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CachedNetworkImage(
      placeholder: (context, url) => Container(
        height: 30,
        width: 30,
        color: Colors.transparent,
        alignment: Alignment.center,
        child: const CircularProgressIndicator(
          strokeWidth: 3,
          backgroundColor: Colors.white,
        ),
      ),
      imageUrl: imageUrl ?? '',
    );
  }
}
