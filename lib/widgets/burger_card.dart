import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../models/burger.dart';
import '../screens/product_detail_screen.dart';

class BurgerCard extends StatefulWidget {
  final Burger burger;

  const BurgerCard({super.key, required this.burger});

  @override
  State<BurgerCard> createState() => _BurgerCardState();
}

class _BurgerCardState extends State<BurgerCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
         Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => ProductDetailScreen(burger: widget.burger)),
         );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              Expanded(
                child: Center(
                  child: Hero(
                    tag: 'burger_${widget.burger.id}',
                    child: Image.asset(
                      widget.burger.imageUrl,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.fastfood, size: 50, color: Colors.grey),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              
              // Name
              Text(
                widget.burger.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppColors.textMain,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                widget.burger.subtitle,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.textLight,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              
              const SizedBox(height: 8),
              
              // Rating and Heart
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.star, color: AppColors.ratingStar, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        widget.burger.rating.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => setState(() => isFavorite = !isFavorite),
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border, 
                      color: isFavorite ? AppColors.primary : AppColors.textMain, 
                      size: 20
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
