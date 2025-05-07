import 'package:flutter/material.dart';

class BannerSlider extends StatelessWidget {
  final List<Map<String, dynamic>> banners;

  const BannerSlider({
    Key? key,
    required this.banners,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
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
              color: banner['backgroundColor'],
              borderRadius: BorderRadius.circular(16),
              // image: DecorationImage(
              //   image: AssetImage(banner['imageUrl']),
              //   fit: BoxFit.cover,
              //   alignment: Alignment.centerRight,
              // ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (banner.containsKey('discount'))
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        banner['discount'],
                        style: const TextStyle(
                          color: Color(0xFF1D4F6E),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  const SizedBox(height: 8),
                  Text(
                    banner['title'],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: banner['textColor'],
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: banner['textColor'] == Colors.white
                          ? Colors.white
                          : const Color(0xFF1D4F6E),
                      foregroundColor: banner['textColor'] == Colors.white
                          ? const Color(0xFF1D4F6E)
                          : Colors.white,
                      minimumSize: const Size(100, 30),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                    child: Text(
                      banner['buttonText'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
