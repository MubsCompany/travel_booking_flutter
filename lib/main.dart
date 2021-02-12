import 'package:flutter/material.dart';
import 'package:travel_booking_flutter/users/home.dart';

import 'admin/admin_home.dart';
import 'helpers/route_generator.dart';
import 'main/login.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  var login = prefs.getString('login');
  var role = prefs.getString('role');
  print(login);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: (() {
        if(login == null){
          return LoginPage();
        }else{
          if(role == "admin"){
            return AdminHomePage();
          }else{
            return MyHomePage();
          }
        }
        // your code here
      }()),
      // initialRoute: '/Login',
      onGenerateRoute: RouteGenerator.generateRoute,
    ),
  );
}
