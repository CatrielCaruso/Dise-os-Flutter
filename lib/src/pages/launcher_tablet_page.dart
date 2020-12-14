
import 'package:flutter/material.dart';


import 'package:disenosavanzados/src/models/layout_model.dart';
import 'package:disenosavanzados/src/pages/slideshow_page.dart';


import 'package:disenosavanzados/src/theme/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:disenosavanzados/src/routes/routes.dart';
import 'package:provider/provider.dart';

class LauncherTabletPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    final layoutModel = Provider.of<LayoutModel>(context);

    final appTheme = Provider.of<ThemeChanger>(context);
    return Scaffold(

      appBar: AppBar(
        backgroundColor: appTheme.currentTheme.accentColor,
        title: Text('Diseños en flutter-Tablet'),
      ),

      drawer: _MenuPrincipal(),
      //body: _ListaOpciones()

      body: Row(
        children: <Widget>[
          
          Container(

            child: _ListaOpciones() ,
            width: 300.0,
            height: double.infinity,
          
          ),
          Container(
            width: 1.0,
            height: double.infinity,
            color:(appTheme.darkTheme)?Colors.grey:appTheme.currentTheme.accentColor,
          ),

          Expanded(
            child: layoutModel.currentPage
            
        ),


        ],
      ),
   );
  }
}

class _ListaOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final layoutModel = Provider.of<LayoutModel>(context);

    
    
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return ListView.separated(
      
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context,i)=>Divider(
        color: appTheme.primaryColorLight,
      ), 
      itemCount: pageRoute.length,
      itemBuilder: (context,i)=>ListTile(


        leading: FaIcon(pageRoute[i].icon,color: appTheme.accentColor),
        title: Text(pageRoute[i].titulo),
        trailing: Icon(Icons.chevron_right,color:appTheme.accentColor),
        onTap: (){
          
          layoutModel.currentPage=pageRoute[i].page;

          //Navigator.push(context, MaterialPageRoute(builder: (context)=>pageRoute[i].page));
        },
      ), 
      
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

   final appTheme = Provider.of<ThemeChanger>(context);

   final accentColors=appTheme.currentTheme.accentColor;

    return Drawer(
          child: Container(
           
           child: Column(
             children: <Widget>[


               SafeArea(
                                child: Container(
                   padding: EdgeInsets.all(20.0),
                   width: double.infinity,
                   height: 200.0,
                   child: CircleAvatar(
                     backgroundColor: accentColors,
                     child: Text('CC',style: TextStyle(fontSize: 50.0),),
                   ),
                 ),
               ),

               Expanded(child: _ListaOpciones()),

               ListTile(
                  
                  leading: Icon(Icons.lightbulb_outline,color:accentColors),
                  title: Text('Dark Mode'),
                  trailing: Switch.adaptive(
                    
                    activeColor: accentColors,
                    value: appTheme.darkTheme, 
                    onChanged: (value)=>appTheme.darkTheme=value
                    
                  ),

               ),

                SafeArea(
                    
                    bottom: true,
                    top: false,
                    left: false,
                    right: false,
                    child: ListTile(
                    
                    leading: Icon(Icons.add_to_home_screen,color:accentColors),
                    title: Text('Custom Theme'),
                    trailing: Switch.adaptive(
                      
                      activeColor: accentColors,
                      value: appTheme.customTheme, 
                      onChanged: (value)=> appTheme.customTheme=value
                      
                    ),

               ),
                ),

               
             ],
           ),
      ),
    );
  }
}