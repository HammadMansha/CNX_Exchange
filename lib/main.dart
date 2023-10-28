
import 'package:gnx_exchange/routes/app_pagess.dart';
import 'package:gnx_exchange/utils/libraries/app_libraries.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //await Locales.init(['en', 'urdu']);

  await initServices();

  runApp(const MyApp());
}

Future<void> initServices() async {
  await GetStorage.init();
  // bio
  AuthService auth = AuthService();
  await Get.putAsync(() => auth.init());
  // await Get.putAsync(() => bio.init());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      defaultTransition: Get.defaultTransition,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      //home: MyHomePage(),
    );
  }
}