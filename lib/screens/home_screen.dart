import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/product_model.dart';
import '../api/mock_api.dart';
import '../providers/cart_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final mockApi = MockApi();
  // final ScrollController scrollController = ScrollController();

  final List<String> imagenesOfertas = [
    'assets/images/offers/oferta1.jpg',
    'assets/images/offers/oferta2.jpg',
    'assets/images/offers/oferta3.jpg',
    'assets/images/offers/oferta4.jpg',
  ];

  final List<List> menuSemana = [
    ['Aguacate', 'assets/images/menu_semana/aguacate.png', '1 Kilo'],
    ['Apio', 'assets/images/menu_semana/apio.png', '4 Piezas'],
    ['Brócoli', 'assets/images/menu_semana/brocoli.png', '1 Pieza'],
    ['Ciruela', 'assets/images/menu_semana/ciruela.png', '1/2 kilo'],
    ['Coliflor', 'assets/images/menu_semana/coliflor.png', '1 Pieza'],
    ['Espinaca', 'assets/images/menu_semana/espinaca.png', '1/4 Kilo'],
    ['Jitomate', 'assets/images/menu_semana/jitomate.png', '1 Kilo'],
    ['Guayaba', 'assets/images/menu_semana/guayaba.png', '1 Kilo'],
    ['Limón', 'assets/images/menu_semana/limon.png', '1/2 Kilo'],
    ['Mango', 'assets/images/menu_semana/mango.png', '1 Kilo'],
    ['Manzana', 'assets/images/menu_semana/manzana.png', '1/2 Kilo'],
    ['Melón', 'assets/images/menu_semana/melon.png', '1 Pieza'],
    ['Papa', 'assets/images/menu_semana/papa.png', '1/2 Kilo'],
    ['Piña', 'assets/images/menu_semana/piña.png', '1 Pieza'],
    ['Sandía', 'assets/images/menu_semana/sandia.png', '1/4 pieza'],
    ['Zanahoria', 'assets/images/menu_semana/zanahoria.png', '1 Kilo'],
  ];

  String getGreeting() {
    final currentHour = DateTime.now().hour;
    var greeting = "";
    if (currentHour >= 5 && currentHour < 12) {
      greeting = "¡Buenos Días!";
    } else if (currentHour >= 12 && currentHour < 19) {
      greeting = "¡Buenas Tardes!";
    } else {
      greeting = "!Buenas Noches!";
    }
    return greeting;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height * 0.2,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Image.asset(
                  imagenesOfertas[index],
                  fit: BoxFit.cover,
                );
              },
              autoplayDelay: 5000,
              duration: 1500,
              autoplay: true,
              itemCount: imagenesOfertas.length,
              pagination: SwiperPagination(
                alignment: Alignment.bottomCenter,
                builder: DotSwiperPaginationBuilder(
                    color: Colors.white, activeColor: Colors.green[900]),
              ),
              control: SwiperControl(color: Colors.green[900]),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            getGreeting(),
            style: GoogleFonts.notoSerif(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            'Nuestro Menú De La Semana',
            style: GoogleFonts.notoSerif(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Expanded(
            child: FutureBuilder(
              future: mockApi.getAllProducts(),
              builder: (context, AsyncSnapshot<List<ProductModel>> snapshot) {
                List<ProductModel> allProducts = snapshot.data ?? [];
                if (snapshot.connectionState == ConnectionState.done) {
                  return Scrollbar(
                    child: ListView.builder(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      shrinkWrap: true,
                      itemCount: allProducts.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 2.0,
                          margin: const EdgeInsets.all(1.0),
                          child: ListTile(
                            leading: Container(
                              width: size.width * 0.2,
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                // child: Image.network(
                                //   allProducts[index].image,
                                //   loadingBuilder: (context, child, progress) {
                                //     return progress == null
                                //         ? child
                                //         : const LinearProgressIndicator();
                                //   },
                                //   fit: BoxFit.contain,
                                // ),
                                child: Image(
                                  image: AssetImage(menuSemana[index][1]),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            title: Text(
                              allProducts[index].name,
                              style: const TextStyle(fontSize: 18),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            trailing: Text(menuSemana[index][2]),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              final snackBar = SnackBar(
                  content: Text(
                '¡Menú Agregado Al Carrito!',
                style: GoogleFonts.notoSerif(
                    fontSize: 22, fontWeight: FontWeight.bold),
              ));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              Provider.of<CartProvider>(context, listen: false)
                  .addMenuOfTheWeek();
            },
            child: const Text(
              '\$250.00 Agregar Al Carrito',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
