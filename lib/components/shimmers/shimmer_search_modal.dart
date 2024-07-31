import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerSearch extends StatelessWidget {
  const ShimmerSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade100,
      highlightColor: Colors.grey.shade300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            height: 30,
            width: MediaQuery.of(context).size.width * .8,
          ),
          const SizedBox(height: 16),
          Container(
            color: Colors.white,
            height: 30,
            width: MediaQuery.of(context).size.width * .8,
          ),
          const SizedBox(height: 16),
          Container(
            color: Colors.white,
            height: 30,
            width: MediaQuery.of(context).size.width * .8,
          ),
          const SizedBox(height: 16),
          Container(
            color: Colors.white,
            height: 30,
            width: MediaQuery.of(context).size.width * .8,
          ),
          const SizedBox(height: 16),
          Container(
            color: Colors.white,
            height: 30,
            width: MediaQuery.of(context).size.width * .8,
          ),
        ],
      ),
    );
  }
}
