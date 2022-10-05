import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/category_widget.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final List<List> categories = [
    ['Ver Todo', 'assets/images/categories/ver_todo.png'],
    ['Vegetales', 'assets/images/categories/vegetales.png'],
    ['Frutas', 'assets/images/categories/frutas.png'],
    [
      'Especias',
      'assets/images/categories/especias.png',
    ],
    [
      'Semillas',
      'assets/images/categories/semillas.png',
    ],
    ['Nueces', 'assets/images/categories/nueces.png'],
    ['Hierbas', 'assets/images/categories/hierbas.png'],
  ];

  // TODO: Crear un Mapa con las funciones para los elementos clickeables

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Productos',
          style:
              GoogleFonts.notoSerif(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: categories.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return CategoryWidget(
            name: categories[index][0],
            image: categories[index][1],
            function: () {},
          );
        },
      ),
    );
  }
}
