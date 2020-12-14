
import 'package:disenosavanzados/src/theme/theme.dart';
import 'package:flutter/material.dart';





import 'package:disenosavanzados/src/widgets/headers.dart';
import 'package:provider/provider.dart';


class HeadersPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

   final accentColor = Provider.of<ThemeChanger>(context).currentTheme.accentColor;


    return Scaffold(

      body: HeaderWave(color: accentColor),

      
    );
      
    
  }
}