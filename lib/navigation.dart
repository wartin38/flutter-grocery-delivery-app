import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_store/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'screens/products_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/profile_screen.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int selectedIndex = 0;

  static List<Widget> pages = [
    const HomeScreen(),
    const ProductsScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  void _onElementTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cartProvider, child) {
      return SafeArea(
        child: Scaffold(
          body: pages[selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            elevation: 10.0,
            type: BottomNavigationBarType.fixed,
            unselectedFontSize: 15,
            showSelectedLabels: false,
            currentIndex: selectedIndex,
            selectedItemColor: Colors.green[900],
            onTap: _onElementTapped,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  selectedIndex == 0 ? Icons.home_filled : Icons.home_outlined,
                ),
                label: 'Inicio',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  selectedIndex == 1
                      ? Icons.soup_kitchen
                      : Icons.soup_kitchen_outlined,
                ),
                label: 'Productos',
              ),
              BottomNavigationBarItem(
                icon: Badge(
                  showBadge: cartProvider.itemsCount == 0 ? false : true,
                  toAnimate: true,
                  animationType: BadgeAnimationType.scale,
                  shape: BadgeShape.circle,
                  position: BadgePosition.topEnd(top: -10, end: -10),
                  badgeColor: Colors.green,
                  borderRadius: BorderRadius.circular(8.0),
                  badgeContent: Text(
                    cartProvider.itemsCount.toString(),
                    style: const TextStyle(color: Colors.black),
                  ),
                  child: Icon(
                    selectedIndex == 2
                        ? Icons.shopping_cart
                        : Icons.shopping_cart_outlined,
                  ),
                ),
                label: 'Carrito',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  selectedIndex == 3 ? Icons.person : Icons.person_outline,
                ),
                label: 'Mi Perfil',
              ),
            ],
          ),
        ),
      );
    });
  }
}
