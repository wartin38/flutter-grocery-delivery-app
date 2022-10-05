import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_flutter_store/providers/cart_provider.dart';
import 'package:my_flutter_store/providers/profile_provider.dart';
import 'theme/my_store_theme.dart';
import 'navigation.dart';
// import 'profile_screen.dart';
import 'screens/all_products_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: Consumer<ProfileProvider>(
        builder: (context, profileProvider, child) {
          profileProvider.initProvider();
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: profileProvider.light
                ? MyStoreTheme.lightThemeData()
                : MyStoreTheme.darkThemeData(),
            title: 'My Flutter Store',
            home: const Navigation(),
            routes: {
              '/VerTodosLosProductos': (context) => const AllProductsScreen(),
            },
          );
        },
      ),
    );
  }
}
