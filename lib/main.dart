




import 'package:disenosavanzados/src/models/layout_model.dart';
import 'package:flutter/material.dart';

import 'package:disenosavanzados/src/pages/launcher_tablet_page.dart';


import 'package:provider/provider.dart';

import 'package:disenosavanzados/src/theme/theme.dart';

//import 'package:disenosavanzados/src/pages/emergency_page.dart';

import 'src/pages/launcher_page.dart';

import 'src/models/layout_model.dart';
//import 'src/pages/slider_list_page.dart';

//import 'package:disenosavanzados/src/pages/pinterest_page.dart';


//import 'package:disenosavanzados/src/pages/slideshow_page.dart';


//import 'package:disenosavanzados/src/labs/slideshow_page.dart';

//import 'package:disenosavanzados/src/pages/graficas_circulares_page.dart';


//import 'package:disenosavanzados/src/labs/circular_progress_page.dart';

// import 'package:disenosavanzados/src/pages/animaciones_page.dart';
// import 'package:disenosavanzados/src/pages/headers_page.dart';

 
void main() => runApp(

  MultiProvider(
    
   providers:[


     ChangeNotifierProvider<ThemeChanger>(create: (_)=>ThemeChanger(2)),
     ChangeNotifierProvider<LayoutModel>(create: (_)=>LayoutModel())
   ],
  
  
   child: MyApp()
)
  
  // ChangeNotifierProvider(
    
  //   create: (_) => ThemeChanger(2),
  //   child: MyApp()
    
  //   )
  
);
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
       theme: appTheme,
      title: 'Diseños App',
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          // return Container(
          //   child: LauncherPage(),
          // );

          final screenSize=MediaQuery.of(context).size;

          if(screenSize.width>500.0){


            return LauncherTabletPage();
          }else{
            
            return  LauncherPage();
        }
        },
      ),
    );
  }
}