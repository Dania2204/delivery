import 'package:flutter/material.dart';
import '../models/burger.dart';
import '../utils/app_colors.dart';
import 'customize_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  final Burger burger;

  const ProductDetailScreen({super.key, required this.burger});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int portion = 2;
  double spicyLevel = 0.2; // 0.0 to 1.0

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textMain),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: AppColors.textMain),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Burger Image (Hero)
                Center(
                  child: Hero(
                    tag: 'burger_${widget.burger.id}',
                    child: SizedBox(
                      height: 250,
                      child: Image.asset(
                        widget.burger.imageUrl,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 20),
                Text(
                  '${widget.burger.name} ${widget.burger.subtitle}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textMain,
                  ),
                ),
                
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.star, color: AppColors.ratingStar, size: 18),
                    const SizedBox(width: 5),
                    Text(
                      widget.burger.rating.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 15),
                    const Text('—'),
                    const SizedBox(width: 15),
                    Text('${widget.burger.timeMins} mins'),
                  ],
                ),
                
                const SizedBox(height: 20),
                Text(
                  widget.burger.description,
                  style: const TextStyle(
                    color: AppColors.textLight,
                    height: 1.5,
                  ),
                ),
                
                const SizedBox(height: 30),
                // Spicy & Portion controls
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Spicy Slider
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Spicy', style: TextStyle(fontWeight: FontWeight.w600)),
                          Row(
                            children: [
                              const Text('Mild', style: TextStyle(color: Colors.green, fontSize: 12)),
                              Expanded(
                                child: Slider(
                                  value: spicyLevel,
                                  onChanged: (v) => setState(() => spicyLevel = v),
                                  activeColor: AppColors.primary,
                                  inactiveColor: Colors.grey.shade300,
                                ),
                              ),
                              const Text('Hot', style: TextStyle(color: AppColors.primary, fontSize: 12)),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    // Portion
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Portion', style: TextStyle(fontWeight: FontWeight.w600)),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                icon: const Icon(Icons.remove, color: Colors.white, size: 18),
                                onPressed: () {
                                  if (portion > 1) setState(() => portion--);
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Text('$portion', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            ),
                            Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                icon: const Icon(Icons.add, color: Colors.white, size: 18),
                                onPressed: () => setState(() => portion++),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                
                const SizedBox(height: 30),
                
                // Bottom Price and Button
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        '\$${widget.burger.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => CustomizeScreen(burger: widget.burger, portion: portion)),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.buttonDark,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 18),
                        ),
                        child: const Text(
                          'ORDER NOW',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
