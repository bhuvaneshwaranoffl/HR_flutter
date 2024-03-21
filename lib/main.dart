import 'package:assessment/controller/MainBottomBar/home_bottom.dart';
import 'package:assessment/controller/MainBottomBar/hrpolicies_bottom.dart';
import 'package:assessment/provider/contactJsonProvider.dart';
import 'package:assessment/provider/jsonProvider.dart';
import 'package:assessment/screens/RatesCalculation/ratesCalci.dart';
import 'package:assessment/screens/companydetails/campanyDetails.dart';
import 'package:assessment/screens/enquiry%20form/form.dart';
import 'package:assessment/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     
    
    return ScreenUtilInit(
        designSize: const Size(360, 640),
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => CategoryProvider()),
              ChangeNotifierProvider(create: (_) => ContactProvider()),
          ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Assessment app',
            theme: ThemeData(
              scaffoldBackgroundColor: scaffoldBackground,
              // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            routerConfig: _router,
          ),
        ));
  }
}

final GoRouter _router = GoRouter(initialLocation: "/home", routes: <RouteBase>[
  GoRoute(
      name: "/home",
      path: "/home",
      builder: (context, state) {
        return const BottomHomeBar();
      }),
  GoRoute(
      name: "/companyDetails",
      path: "/companyDetails",
      builder: (context, state) {
        return const CompanyDetails();
      }),
  GoRoute(
      name: "/hrPolicies",
      path: "/hrPolicies",
      builder: (context, state) {
        return const BottomHrPoliciesBar();
      }),
  GoRoute(
      name: "/ratesCalci",
      path: "/ratesCalci",
      builder: (context, state) {
        return const RatesCalculation();
      }),
  GoRoute(
      name: "/form",
      path: "/form",
      builder: (context, state) {
        return const EnquiryForm();
      }),
       
  
]);
