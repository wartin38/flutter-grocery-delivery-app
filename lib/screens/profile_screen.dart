import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/profile_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
        builder: (context, profileProvider, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            '¡Hola Martín!',
            style: GoogleFonts.notoSerif(
                fontSize: 22, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                leading: const Icon(
                  Icons.home,
                  size: 18,
                ),
                onTap: () {},
                title: Text(
                  'Dirección de Entrega',
                  style: GoogleFonts.notoSerif(fontSize: 18),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.home_work,
                  size: 18,
                ),
                onTap: () {},
                title: Text(
                  'Direcciones Adicionales',
                  style: GoogleFonts.notoSerif(fontSize: 18),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.email,
                  size: 18,
                ),
                onTap: () {},
                title: Text(
                  'Mi Correo Electrónico',
                  style: GoogleFonts.notoSerif(fontSize: 18),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.delivery_dining,
                  size: 18,
                ),
                onTap: () {},
                title: Text(
                  'Mis Pedidos',
                  style: GoogleFonts.notoSerif(fontSize: 18),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.phone,
                  size: 18,
                ),
                onTap: () {},
                title: Text(
                  'Contacto Mandadito',
                  style: GoogleFonts.notoSerif(fontSize: 18),
                ),
              ),
              SwitchListTile(
                secondary: Icon(
                    profileProvider.light ? Icons.light_mode : Icons.dark_mode),
                title: Text(
                  profileProvider.light ? 'Tema Claro' : 'Tema Obscuro',
                  style: GoogleFonts.notoSerif(fontSize: 18),
                ),
                activeColor: Colors.green,
                value: profileProvider.light,
                onChanged: (value) {
                  Provider.of<ProfileProvider>(context, listen: false)
                      .setLightTheme(value);
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
