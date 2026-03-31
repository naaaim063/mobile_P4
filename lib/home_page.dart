import 'package:flutter/material.dart';
import 'detail_page.dart';

/// ================= MODEL =================
class Coffee {
  final String name;
  final String subtitle;
  final String image;
  final String price;
  final double rating;

  Coffee({
    required this.name,
    required this.subtitle,
    required this.image,
    required this.price,
    required this.rating,
  });
}

/// ================= DATA =================
final List<Coffee> coffees = [
  Coffee(
    name: "Cappuccino",
    subtitle: "with Chocolate",
    image: "assets/images/coffee1.png",
    price: "\$4.53",
    rating: 4.5,
  ),
  Coffee(
    name: "Latte",
    subtitle: "with Milk",
    image: "assets/images/coffee2.png",
    price: "\$4.00",
    rating: 4.2,
  ),
  Coffee(
    name: "Espresso",
    subtitle: "Strong taste",
    image: "assets/images/coffee3.png",
    price: "\$3.80",
    rating: 4.7,
  ),
  Coffee(
    name: "Americano",
    subtitle: "Hot coffee",
    image: "assets/images/coffee4.png",
    price: "\$3.50",
    rating: 4.3,
  ),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),

      /// ===== BOTTOM NAV =====
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 15,
              color: Colors.black.withOpacity(0.06),
            )
          ],
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.home, color: Color(0xFFB98068)),
            Icon(Icons.favorite_border),
            Icon(Icons.shopping_bag_outlined),
            Icon(Icons.person_outline),
          ],
        ),
      ),

      body: Stack(
        children: [

          /// ===== GRADIENT HEADER =====
          Container(
            height: 300,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF1C0F0D),
                  Color(0xFF2A1A18),
                  Color(0xFFF6F6F6),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [

                /// ===== HEADER =====
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),

                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: const [
                          Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text("Location",
                                  style: TextStyle(
                                      color: Colors.white70)),
                              SizedBox(height: 4),
                              Text(
                                "West Balurghat",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          CircleAvatar(
                            backgroundImage: AssetImage(
                                'assets/images/profile.png'),
                          )
                        ],
                      ),

                      const SizedBox(height: 20),

                      /// SEARCH
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(18),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 20,
                                    offset: const Offset(0, 8),
                                    color: Colors.black
                                        .withOpacity(0.15),
                                  )
                                ],
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Search coffee",
                                  prefixIcon:
                                  const Icon(Icons.search),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(18),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: const Color(0xFFB98068),
                              borderRadius:
                              BorderRadius.circular(14),
                            ),
                            child: const Icon(Icons.tune,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                /// ===== BODY =====
                Expanded(
                  child: Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20),
                    decoration: const BoxDecoration(
                      color: Color(0xFFF6F6F6),
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(30)),
                    ),
                    child: GridView.builder(
                      itemCount: coffees.length,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 14,
                        mainAxisSpacing: 14,
                        childAspectRatio: 0.65, // 🔥 FIX OVERFLOW
                      ),
                      itemBuilder: (context, index) {
                        final coffee = coffees[index];

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    DetailPage(coffee: coffee),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.circular(18),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 12,
                                  color:
                                  Colors.black.withOpacity(0.05),
                                )
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [

                                /// IMAGE + RATING
                                Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                      const BorderRadius.vertical(
                                          top:
                                          Radius.circular(18)),
                                      child: Image.asset(
                                        coffee.image,
                                        height: 120,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),

                                    Positioned(
                                      right: 8,
                                      top: 8,
                                      child: Container(
                                        padding:
                                        const EdgeInsets.symmetric(
                                            horizontal: 6,
                                            vertical: 3),
                                        decoration: BoxDecoration(
                                          color: Colors.black54,
                                          borderRadius:
                                          BorderRadius.circular(
                                              10),
                                        ),
                                        child: Row(
                                          children: [
                                            const Icon(Icons.star,
                                                size: 14,
                                                color: Colors.orange),
                                            Text(" ${coffee.rating}",
                                                style:
                                                const TextStyle(
                                                    color:
                                                    Colors.white,
                                                    fontSize: 12))
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),

                                /// CONTENT (FIX OVERFLOW)
                                Expanded(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(coffee.name,
                                            style: const TextStyle(
                                                fontWeight:
                                                FontWeight.w600)),
                                        Text(coffee.subtitle,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey)),

                                        const Spacer(),

                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            Text(coffee.price,
                                                style:
                                                const TextStyle(
                                                    fontWeight:
                                                    FontWeight
                                                        .bold)),
                                            Container(
                                              decoration:
                                              const BoxDecoration(
                                                color:
                                                Color(0xFFB98068),
                                                shape:
                                                BoxShape.circle,
                                              ),
                                              child:
                                              const Padding(
                                                padding:
                                                EdgeInsets.all(6),
                                                child: Icon(Icons.add,
                                                    size: 16,
                                                    color:
                                                    Colors.white),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}