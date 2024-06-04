import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:btl/widgets/cart_provider.dart';

class CartBottomSheet extends StatelessWidget {
  const CartBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Container(
        padding: const EdgeInsets.all(16),
        width: cart.items.isEmpty ? MediaQuery.of(context).size.width : null,
        // color: Colors.white,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Giỏ hàng',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            if (cart.items.isEmpty)
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Không có sản phẩm trong giỏ hàng',
                  style: TextStyle(fontSize: 18),
                ),
              )
            else
              ...cart.items.map((item) => ListTile(
                    leading: Image.network(
                      item['image'],
                      width: 50,
                      height: 70,
                      fit: BoxFit.fitHeight,
                    ),
                    title: Text(item['title']),
                    subtitle: Text('Giá: \$${item['price']}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            cart.decreaseQuantity(item['id']);
                          },
                        ),
                        Text('${item['quantity']}'),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            cart.increaseQuantity(item['id']);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            cart.removeItem(item['id']);
                          },
                        ),
                      ],
                    ),
                  )),
            if (cart.items.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tổng tiền: \$${cart.totalAmount.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Add your payment logic here
                      },
                      child: const Text('Thanh toán'),
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
