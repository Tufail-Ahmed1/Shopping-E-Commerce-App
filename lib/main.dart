import 'package:practise_app/packages/packages.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  await Hive.openBox('cart_box');
  await Hive.openBox('fav_box');
  runApp(
      MultiProvider(
       providers: [
         ChangeNotifierProvider(create: (context) => MainScreenProvider()),
         ChangeNotifierProvider(create: (context)=>ProductProvider()),
         ChangeNotifierProvider(create: (context) => FavouriteProvider()),
         ChangeNotifierProvider(create: (context) => CartProvider()),
       ],
      child:const MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return  MaterialApp(
          title: 'ECommerce App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
          ),
          home: const RegistrationPage(),
        );

      },
    );
  }
}
