import 'package:flutter/material.dart';
import 'home_page.dart';

class DetailPage extends StatefulWidget {
  final Coffee coffee;

  const DetailPage({super.key, required this.coffee});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectedSize = 1;

  @override
  Widget build(BuildContext context) {
    final coffee = widget.coffee;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [

          /// IMAGE
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(30)),
                child: Image.asset(
                  coffee.image,
                  height: 320,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              Positioned(
                top: 40,
                left: 20,
                child: CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back,
                        color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              )
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [

                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Text(coffee.name,
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        const Icon(Icons.star,
                            color: Colors.orange, size: 18),
                        Text(" ${coffee.rating}"),
                      ],
                    )
                  ],
                ),

                Text(coffee.subtitle,
                    style: const TextStyle(color: Colors.grey)),

                const SizedBox(height: 20),

                const Text("Description",
                    style:
                    TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),

                const Text(
                    "A cappuccino is approximately 150 ml beverage with espresso and milk foam."),

                const SizedBox(height: 20),

                const Text("Size",
                    style:
                    TextStyle(fontWeight: FontWeight.bold)),

                const SizedBox(height: 10),

                Row(
                  children: [
                    _size("S", 0),
                    _size("M", 1),
                    _size("L", 2),
                  ],
                ),
              ],
            ),
          ),

          const Spacer(),

          /// PRICE + BUTTON
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    const Text("Price",
                        style: TextStyle(color: Colors.grey)),
                    Text(coffee.price,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    const Color(0xFFB98068),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text("Buy Now"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _size(String text, int index) {
    final active = selectedSize == index;

    return GestureDetector(
      onTap: () {
        setState(() => selectedSize = index);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(
            horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: active
              ? const Color(0xFFB98068)
              : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: active ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}