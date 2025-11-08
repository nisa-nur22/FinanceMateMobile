import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../widgets/atm_card.dart';
import '../widgets/transaction_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = [
      TransactionModel('Gym Membership', '-Rp150.000', 'Health'),
      TransactionModel('Salary', '+Rp5.000.000', 'Income'),
    ];

    final categories = [
      {"icon": Icons.favorite, "label": "Health", "color": Colors.pinkAccent},
      {"icon": Icons.event, "label": "Event", "color": Colors.purpleAccent},
      {"icon": Icons.fastfood, "label": "Food", "color": Colors.amberAccent},
      {"icon": Icons.travel_explore, "label": "Travel", "color": const Color.fromARGB(255, 39, 157, 187)},
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Finance Mate',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('My Cards',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            SizedBox(
              height: 140,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  AtmCard(
                    bank: 'Bank BRI',
                    balance: 'Rp12.500.000',
                    cardNumber: '**** 2345',
                    color1: Color(0xFFFF4B91),
                    color2: Color(0xFFF94F6D),
                    height: 120,
                    width: 220,
                  ),
                  AtmCard(
                    bank: 'Bank BCA',
                    balance: 'Rp5.350.000',
                    cardNumber: '**** 8765',
                    color1: Color(0xFF00E0FF),
                    color2: Color(0xFF00B8D4),
                    height: 120,
                    width: 220,
                  ),
                  AtmCard(
                    bank: 'Bank BNI',
                    balance: 'Rp8.240.000',
                    cardNumber: '**** 4455',
                    color1: Color(0xFFDA8CFF),
                    color2: Color(0xFF8E24AA),
                    height: 120,
                    width: 220,
                  ),
                  AtmCard(
                    bank: 'Bank MANDIRI',
                    balance: 'Rp2.940.000',
                    cardNumber: '**** 6677',
                    color1: Color(0xFFFFE57F),
                    color2: Color(0xFFFFD740),
                    height: 120,
                    width: 220,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            const Text('Categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Wrap(
              spacing: 14,
              runSpacing: 14,
              children: categories.map((cat) {
                return Container(
                  width: 80,
                  height: 85,
                  decoration: BoxDecoration(
                    color: (cat["color"] as Color).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.15),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(2, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(cat["icon"] as IconData,
                          color: cat["color"] as Color, size: 28),
                      const SizedBox(height: 8),
                      Text(
                        cat["label"] as String,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 25),
            const Text('Recent Transactions',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Column(
              children: transactions
                  .map((t) => TransactionItem(transaction: t))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
