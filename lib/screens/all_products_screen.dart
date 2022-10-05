import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({Key? key}) : super(key: key);

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  final TextEditingController searchTextController = TextEditingController();

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
          child: TextFormField(
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.center,
            maxLines: 1,
            style: GoogleFonts.notoSerif(
              fontSize: 20,
            ),
            controller: searchTextController,
            cursorColor: Colors.green,
            onChanged: (value) {
              setState(() {});
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 10),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.yellow, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.green, width: 1),
              ),
              hintText: 'Buscar',
              hintStyle: GoogleFonts.notoSerif(
                fontSize: 20,
              ),
              suffix: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search, color: Colors.green),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
