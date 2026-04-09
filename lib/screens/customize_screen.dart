import 'package:flutter/material.dart';
import '../models/burger.dart';
import '../utils/app_colors.dart';
import 'payment_screen.dart';

class CustomizeScreen extends StatefulWidget {
  final Burger burger;
  final int portion;

  const CustomizeScreen({super.key, required this.burger, this.portion = 1});

  @override
  State<CustomizeScreen> createState() => _CustomizeScreenState();
}

class _CustomizeScreenState extends State<CustomizeScreen> {
  late int portion;
  double spicyLevel = 0.5;

  List<String> toppings = ['Tomato', 'Onions', 'Pickles', 'Bacons'];
  List<bool> selectedToppings = [true, false, true, false];
  List<String> toppingImages = ['assets/tomato.png', 'assets/onions.png', 'assets/pickles.png', 'assets/bacons.png'];

  List<String> sides = ['Fries', 'Coleslaw', 'Salad', 'Onion'];
  List<bool> selectedSides = [true, false, false, false];
  List<String> sideImages = ['assets/fries.png', 'assets/coleslaw.png', 'assets/salad.png', 'assets/onion_rings.png'];

  @override
  void initState() {
    super.initState();
    portion = widget.portion;
  }

  double _calculateTotal() {
    // base price
    double total = widget.burger.price * portion;
    // adding some arbitrary price for toppings and sides to make it dynamic
    int extraToppings = selectedToppings.where((e) => e).length;
    int extraSides = selectedSides.where((e) => e).length;
    return total + (extraToppings * 0.5) + (extraSides * 1.5);
  }

  Widget _buildOptionCard(String name, bool isSelected, VoidCallback onTap, String iconPath) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        margin: const EdgeInsets.only(right: 15, bottom: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 5))
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(10),
                  child: Image.asset(iconPath, fit: BoxFit.contain, errorBuilder: (context, error, stackTrace) => const Icon(Icons.fastfood, color: Colors.grey)),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: AppColors.buttonDark,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          name, 
                          style: const TextStyle(color: Colors.white, fontSize: 10),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(isSelected ? Icons.remove : Icons.add, size: 10, color: Colors.white),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Burger visual
                    SizedBox(
                      width: 150,
                      height: 200,
                      child: Image.asset(
                        widget.burger.imageUrl,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Customize Your Burger to Your Tastes. Ultimate Experience',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          const SizedBox(height: 20),
                          const Text('Spicy', style: TextStyle(fontWeight: FontWeight.bold)),
                          Row(
                            children: [
                              const Text('Mild', style: TextStyle(color: Colors.green, fontSize: 10)),
                              Expanded(
                                child: Slider(
                                  value: spicyLevel,
                                  onChanged: (v) => setState(() => spicyLevel = v),
                                  activeColor: AppColors.primary,
                                  inactiveColor: Colors.grey.shade300,
                                ),
                              ),
                              const Text('Hot', style: TextStyle(color: AppColors.primary, fontSize: 10)),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text('Portion', style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Container(
                                width: 30, height: 30,
                                decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(8)),
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: const Icon(Icons.remove, color: Colors.white, size: 16),
                                  onPressed: () { if (portion > 1) setState(() => portion--); },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text('$portion', style: const TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                width: 30, height: 30,
                                decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(8)),
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: const Icon(Icons.add, color: Colors.white, size: 16),
                                  onPressed: () => setState(() => portion++),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                
                const SizedBox(height: 20),
                const Text('Toppings', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(height: 10),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: toppings.length,
                    itemBuilder: (context, index) {
                      return _buildOptionCard(
                        toppings[index],
                        selectedToppings[index],
                        () => setState(() => selectedToppings[index] = !selectedToppings[index]),
                        toppingImages[index],
                      );
                    },
                  ),
                ),
                
                const SizedBox(height: 20),
                const Text('Side options', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(height: 10),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: sides.length,
                    itemBuilder: (context, index) {
                      return _buildOptionCard(
                        sides[index],
                        selectedSides[index],
                        () => setState(() => selectedSides[index] = !selectedSides[index]),
                        sideImages[index],
                      );
                    },
                  ),
                ),
                
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                          '\$${_calculateTotal().toStringAsFixed(2)}',
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textMain),
                        )
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => PaymentScreen(orderTotal: _calculateTotal())),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      ),
                      child: const Text('ORDER NOW', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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
