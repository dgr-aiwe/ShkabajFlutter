import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPlaceholder extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor: Colors.grey,
            enabled: true,
            child: Container(
              height: 250,
              width: double.infinity,
              color: Colors.white,
            )
            ),
        )
      ],
    );
  }
}