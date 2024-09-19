import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NetworkCircleAvathar extends StatelessWidget {
  const NetworkCircleAvathar({
    super.key,
    this.borderRadius = 37,
    required this.photoUrl,
    this.circleRadius = 40,
    this.height = 65,
    this.width = 65,
  });

  final String photoUrl;
  final double borderRadius;
  final double circleRadius;
  final double height;
  final double width;

//  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: circleRadius,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: CachedNetworkImage(
          height: height.r,
          width: width.r,
          fit: BoxFit.cover,
          imageUrl: photoUrl,
          placeholder: (context, url) => Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            height: height,
            width: width,
            child: Image.asset(
              "assets/png/placeholderImage.jpg",
              fit: BoxFit.fill,
              // width: double.infinity,
            ),
          ),
          errorWidget: (context, url, error) => const Icon(
            Icons.error_outline,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
