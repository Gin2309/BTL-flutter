import 'package:btl/widgets/CartProvider.dart';
import 'package:btl/widgets/CategoriesWidget.dart';
import 'package:btl/widgets/ProductList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(right: 20, left: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 30,
                    ),
                    Consumer<CartProvider>(
                      builder: (context, cart, child) {
                        return GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) => GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: GestureDetector(
                                  onTap: () {},
                                  child: DraggableScrollableSheet(
                                    initialChildSize: 0.5,
                                    minChildSize: 0.3,
                                    maxChildSize: 0.8,
                                    builder: (_, controller) => Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            child: Text(
                                              'Giỏ hàng của bạn',
                                              style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: cart.items.isEmpty
                                                ? Center(
                                                    child: Text(
                                                      'Không có sản phẩm trong giỏ',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  )
                                                : ListView.builder(
                                                    controller: controller,
                                                    itemCount:
                                                        cart.items.length,
                                                    itemBuilder: (_, index) {
                                                      final item =
                                                          cart.items[index];
                                                      return ListTile(
                                                        leading: Image.network(
                                                          item['image'],
                                                          fit: BoxFit.fitHeight,
                                                          width: 50,
                                                          height: 70,
                                                        ),
                                                        title:
                                                            Text(item['title']),
                                                        subtitle: Row(
                                                          children: [
                                                            IconButton(
                                                              icon: Icon(
                                                                  Icons.remove),
                                                              onPressed: () {
                                                                cart.decreaseQuantity(
                                                                    item['id']);
                                                              },
                                                            ),
                                                            Text(
                                                                '${item['quantity']}'),
                                                            IconButton(
                                                              icon: Icon(
                                                                  Icons.add),
                                                              onPressed: () {
                                                                cart.increaseQuantity(
                                                                    item['id']);
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                        trailing: IconButton(
                                                          icon: Icon(
                                                              Icons.delete),
                                                          onPressed: () {
                                                            cart.removeItem(
                                                                item['id']);
                                                          },
                                                        ),
                                                      );
                                                    },
                                                  ),
                                          ),
                                          if (cart.items.isNotEmpty)
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Tổng tiền:',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  // Hiển thị tổng tiền mỗi khi có thay đổi
                                                  Text(
                                                    '\$${cart.totalAmount.toStringAsFixed(2)}',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.green,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          child: badges.Badge(
                            badgeContent: Text(
                              '${cart.items.length}',
                              style: TextStyle(color: Colors.white),
                            ),
                            badgeStyle: badges.BadgeStyle(
                              badgeColor: Colors.red,
                              padding: EdgeInsets.all(7),
                            ),
                            child: Icon(
                              CupertinoIcons.cart,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              // Kết thúc header
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Chào mừng",
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Bạn muốn mua gì?",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                ),
              ),
              // Tìm kiếm
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                margin: EdgeInsets.all(15),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      width: 250,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Tìm kiếm",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.filter_list),
                  ],
                ),
              ),
              // Sản phẩm
              Container(
                padding: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CategoriesWidget(),
                    ProductList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
