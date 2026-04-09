import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'success_dialog.dart';

class PaymentScreen extends StatefulWidget {
  final double orderTotal;

  const PaymentScreen({super.key, required this.orderTotal});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int _selectedPayment = 0; // 0 for Credit, 1 for Debit
  bool _saveCard = true;

  @override
  Widget build(BuildContext context) {
    double taxes = 0.3;
    double delivery = 1.5;
    double total = widget.orderTotal + taxes + delivery;

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Order summary',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text('Order', style: TextStyle(color: AppColors.textLight)),
                Text('\$${widget.orderTotal.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold)),
              ]),
              const SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text('Taxes', style: TextStyle(color: AppColors.textLight)),
                Text('\$$taxes', style: const TextStyle(fontWeight: FontWeight.bold)),
              ]),
              const SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text('Delivery fees', style: TextStyle(color: AppColors.textLight)),
                Text('\$$delivery', style: const TextStyle(fontWeight: FontWeight.bold)),
              ]),
              const Divider(height: 30, thickness: 1),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text('Total:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text('\$${total.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ]),
              const SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text('Estimated delivery time:'),
                const Text('15 - 30mins', style: TextStyle(fontWeight: FontWeight.bold)),
              ]),
              
              const SizedBox(height: 40),
              const Text(
                'Payment methods',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              
              // Credit Card
              GestureDetector(
                onTap: () => setState(() => _selectedPayment = 0),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: _selectedPayment == 0 ? AppColors.buttonDark : AppColors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
                        child: const Icon(Icons.credit_card, color: Colors.orange), // dummy mastercard icon
                      ),
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Credit card', style: TextStyle(color: _selectedPayment == 0 ? Colors.white : AppColors.textMain, fontWeight: FontWeight.bold)),
                          Text('5105 **** **** 0105', style: TextStyle(color: _selectedPayment == 0 ? Colors.grey.shade400 : AppColors.textLight, fontSize: 12)),
                        ],
                      ),
                      const Spacer(),
                      Icon(
                        _selectedPayment == 0 ? Icons.check_circle : Icons.circle_outlined,
                        color: _selectedPayment == 0 ? Colors.white : Colors.grey,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              
              // Debit Card
              GestureDetector(
                onTap: () => setState(() => _selectedPayment = 1),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: _selectedPayment == 1 ? AppColors.buttonDark : AppColors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
                        child: const Icon(Icons.credit_card, color: Colors.blue), // dummy visa icon
                      ),
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Debit card', style: TextStyle(color: _selectedPayment == 1 ? Colors.white : AppColors.textMain, fontWeight: FontWeight.bold)),
                          Text('3566 **** **** 0505', style: TextStyle(color: _selectedPayment == 1 ? Colors.grey.shade400 : AppColors.textLight, fontSize: 12)),
                        ],
                      ),
                      const Spacer(),
                      Icon(
                        _selectedPayment == 1 ? Icons.check_circle : Icons.circle_outlined,
                        color: _selectedPayment == 1 ? Colors.white : Colors.grey,
                      )
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                    value: _saveCard,
                    onChanged: (v) => setState(() => _saveCard = v ?? true),
                    activeColor: AppColors.primary,
                  ),
                  const Text('Save card details for future payments', style: TextStyle(color: AppColors.textLight, fontSize: 12))
                ],
              ),
              
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Total price', style: TextStyle(color: AppColors.textLight)),
                      Text(
                        '\$${total.toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textMain),
                      )
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const SuccessDialog();
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonDark,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    child: const Text('Pay Now', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  )
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
