import 'package:flutter/material.dart';

class BannerSlider extends StatelessWidget {
  final List<Map<String, dynamic>> banners;

  const BannerSlider({
    Key? key,
    required this.banners,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (banners.isEmpty) {
      return SizedBox(
        height: 200,
        child: Center(
          child: Text(
            "No exclusive offers available",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    }

    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: banners.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          final banner = banners[index];
          return Container(
            width: MediaQuery.of(context).size.width * 0.85,
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage(banner['imageUrl']),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
