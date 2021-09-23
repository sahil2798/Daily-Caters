import 'package:daily_caters/constants/firebase.dart';
import 'package:daily_caters/controller/signup/auth_controller.dart';
import 'package:daily_caters/widget/navigationbar.dart';
//import 'package:daily_caters/view/Home/body.dart';
//import 'package:daily_caters/view/SignIn/SignIn.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:flutter_search_bar/flutter_search_bar.dart';

Future<void> main() async {
  //await Firebase.initializeApp();  
  WidgetsFlutterBinding.ensureInitialized();
    await initialization.then((value){
    // Get.put(AppController());
    Get.put(AuthController());
  });

 await SharedPreferences.getInstance().then((value){
   var user;
   user = value.getString('UID_daily_caters');
  
  if(user!=null){
     //final AuthController _authController = Get.find();
    // _authController.initializeUserModel(user);
  }   
     runApp(MyApp(cuser:user));
   });
  
  
}

class MyApp extends StatelessWidget {
  // const MyApp({ Key? key }) : super(key: key);
  final AuthController authController = Get.find();
  final cuser;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  MyApp({this.cuser});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: SafeArea(
        
        child: Scaffold(
          key: _scaffoldKey,
          drawer: NavigationDrawerWidget(),
          appBar: AppBar(
            backgroundColor: Color(0xff076800),
            title: Text('Daily Caters'),
            centerTitle: true,
             leading: new IconButton(
          icon: new Icon(Icons.menu),
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),
        ),
            actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                    Icons.search,
                    size: 26.0,
              ),
            )
            ),
            ],
          ),
        )
        // child:(cuser !=null )?
        //       HomeScreen():
        //      SigninPage(),          
      ),
    );
  }
 }
