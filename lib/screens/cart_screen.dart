import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_flutter_store/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/cart_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<List> carrito = [
    ['Espinaca', 'assets/images/menu_semana/espinaca.png', 11.50],
    ['Jitomate', 'assets/images/menu_semana/jitomate.png', 14.00],
    ['Guayaba', 'assets/images/menu_semana/guayaba.png', 14.50],
    ['Limón', 'assets/images/menu_semana/limon.png', 25.00],
    ['Mango', 'assets/images/menu_semana/mango.png', 22.00],
    ['Manzana', 'assets/images/menu_semana/manzana.png', 18.50],
    ['Melón', 'assets/images/menu_semana/melon.png', 28.00],
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Carrito de Compras',
          style: GoogleFonts.notoSerif(fontSize: 22),
        ),
        elevation: 5,
      ),
      body: Provider.of<CartProvider>(context, listen: false).itemsCount == 0
          ? emptyCart(context)
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Tus productos',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const Text('Tienes 6 productos en tu carrito'),
                  Container(
                    color: Colors.grey,
                    width: 1,
                  ),
                  SizedBox(
                    height: size.height * 0.5,
                    child: Scrollbar(
                      thumbVisibility: true,
                      radius: const Radius.circular(50),
                      thickness: 5,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: carrito.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CartWidget(
                              name: carrito[index][0],
                              image: carrito[index][1],
                              price: carrito[index][2],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.grey,
                    width: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Total',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\$369.00',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Material(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12),
                      child: InkWell(
                        onTap: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Hacer Pedido',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget emptyCart(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // TODO: Aquí va la imagen del carrito vacío.
          // TODO: Aquí va el texto de carrito vacío.
        ],
      ),
    );
  }
}
