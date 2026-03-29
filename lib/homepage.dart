import 'package:flutter/material.dart';
import '../DetailPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1F1F),

      body: Column(
        children: [
          /// 🔥 BAGIAN UTAMA (STACK)
          Expanded(
            child: Stack(
              children: [
                /// BACKGROUND
                Column(
                  children: [
                    Container(
                      height: 180,
                      padding: const EdgeInsets.only(
                        top: 50,
                        left: 20,
                        right: 20,
                      ),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(49, 49, 49, 88),
                            Color.fromRGBO(19, 19, 19, 100),
                          ],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // 🔑 penting
                        children: [
                          /// TEXT (KIRI)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            // 🔑 biar sejajar
                            children: const [
                              Text(
                                "Location",
                                style: TextStyle(color: Colors.white54),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "West, Balurghat",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                          /// FOTO PROFIL (KANAN)
                          ClipRect(
                            child: SizedBox(
                              width: 40,
                              height: 40,
                              child: Image.asset(
                                "assets/fotoprofile.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// BODY
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(
                          top: 60,
                          left: 20,
                          right: 20,
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(0),
                          ),
                        ),
                        child: Column(
                          children: [
                            /// CATEGORY
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                category("Cappuccino", true),
                                category("Machiato", false),
                                category("Latte", false),
                              ],
                            ),

                            const SizedBox(height: 20),

                            /// GRID
                            Expanded(
                              child: GridView.count(
                                crossAxisCount: 2,
                                crossAxisSpacing: 15,
                                mainAxisSpacing: 15,
                                childAspectRatio: 0.75,
                                children: const [
                                  CoffeeCard(
                                    title: "Cappuccino",
                                    subtitle: "with Chocolate",
                                    price: "4.53",
                                    image: "assets/coffee1.png",
                                    rating: "4.8",
                                  ),
                                  CoffeeCard(
                                    title: "Cappuccino",
                                    subtitle: "with Oat Milk",
                                    price: "3.90",
                                    image: "assets/coffee2.png",
                                    rating: "4.9",
                                  ),
                                  CoffeeCard(
                                    title: "Cappuccino",
                                    subtitle: "with Chocolate",
                                    price: "4.5",
                                    image: "assets/coffee3.png",
                                    rating: "4.5",
                                  ),
                                  CoffeeCard(
                                    title: "Cappuccino",
                                    subtitle: "with Oat Milk",
                                    price: "3.8",
                                    image: "assets/coffee4.png",
                                    rating: "4.0",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                /// 🔥 FLOATING SEARCH (DI LUAR COLUMN)
                Positioned(
                  top: 150,
                  left: 20,
                  right: 20,
                  child: Container(
                    height: 55,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.search, color: Colors.grey),
                        const SizedBox(width: 10),
                        const Expanded(
                          child: Text(
                            "Search coffee",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Color(0xFFC67C4E),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.tune, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// 🔻 BOTTOM NAV
          Container(
            height: 60,
            color: Colors.white,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.home, color: Colors.orange),
                Icon(Icons.favorite_border),
                Icon(Icons.shopping_bag_outlined),
                Icon(Icons.notifications_none),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget category(String text, bool active) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: active ? const Color(0xFFC67C4E) : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: active ? Colors.white : Colors.black54,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class CoffeeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final String image;
  final String rating;

  const CoffeeCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.image,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailPage(
              title: title,
              subtitle: subtitle,
              price: price,
              image: image,
              rating: rating,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// IMAGE
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(15),
                  ),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            /// CONTENT
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(subtitle,
                      style:
                      const TextStyle(color: Colors.grey, fontSize: 12)),
                  const SizedBox(height: 5),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\$$price",
                          style:
                          const TextStyle(fontWeight: FontWeight.bold)),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(198, 124, 78, 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.add,
                            color: Colors.white, size: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
