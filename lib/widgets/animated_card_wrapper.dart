import 'dart:ui';
import 'package:flutter/material.dart';

class AnimatedCardWrapper extends StatefulWidget {
  const AnimatedCardWrapper({super.key});

  @override
  State<AnimatedCardWrapper> createState() => _AnimatedCardWrapperState();
}

class _AnimatedCardWrapperState extends State<AnimatedCardWrapper> {
  final List<Map<String, dynamic>> cards = [
    {
      "bank": "Bank A",
      "balance": "Rp12.500.000",
      "number": "**** 2345",
      "gradient": [Color(0xFF6D23B6), Color(0xFFB5179E)],
    },
    {
      "bank": "Bank B",
      "balance": "Rp5.350.000",
      "number": "**** 8765",
      "gradient": [Color(0xFF00B4D8), Color(0xFF0077B6)],
    },
    {
      "bank": "Bank C",
      "balance": "Rp8.200.000",
      "number": "**** 1122",
      "gradient": [Color(0xFF4EA8DE), Color(0xFF023E8A)],
    },
    {
      "bank": "Bank D",
      "balance": "Rp3.890.000",
      "number": "**** 7788",
      "gradient": [Color(0xFFFF6D00), Color(0xFFFF8C00)],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemCount: cards.length,
      itemBuilder: (context, index) {
        final card = cards[index];
        return TweenAnimationBuilder(
          duration: Duration(milliseconds: 700 + (index * 150)),
          tween: Tween<double>(begin: 0, end: 1),
          builder: (context, value, child) {
            return Transform.scale(
              scale: value,
              child: Opacity(opacity: value, child: child),
            );
          },
          child: GestureDetector(
            onTapDown: (_) => setState(() {}),
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              width: 280,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: List<Color>.from(card['gradient']),
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: card['gradient'][0].withOpacity(0.4),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              card['bank'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            const Icon(Icons.credit_card, color: Colors.white70),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              card['balance'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              card['number'],
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
