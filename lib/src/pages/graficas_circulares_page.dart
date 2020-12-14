
import 'package:disenosavanzados/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:disenosavanzados/src/widgets/radial_progress.dart';
import 'package:provider/provider.dart';

class GraficasCircularesPage extends StatefulWidget {
  @override
  _GraficasCircularesPageState createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {


  double porcentaje=0.0;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        
        child: Icon(Icons.refresh),
        
        onPressed: (){
       
       
        setState(() {
          porcentaje+=10;
          if(porcentaje>100){

            porcentaje=0;
          }
        });


      }),

      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[

         Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: <Widget>[
             CustomRadialProgress(porcentaje: porcentaje,color: Colors.amber,),
             CustomRadialProgress(porcentaje: porcentaje*1.2,color: Colors.deepOrangeAccent,),
           ],
         ),

          Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: <Widget>[
             CustomRadialProgress(porcentaje: porcentaje*1.4,color: Colors.purple,),
             CustomRadialProgress(porcentaje: porcentaje*1.8,color: Colors.teal,),
           ],
         ),
        
        

        ],

        
      ),
    );
    
  }
}

class CustomRadialProgress extends StatelessWidget {
  const CustomRadialProgress({
    
    @required this.porcentaje, @required this.color,
  }) ;

  final Color color;

  final double porcentaje;

  @override
  Widget build(BuildContext context) {

    final appTheme= Provider.of<ThemeChanger>(context).currentTheme;


    return Container(

      height: 180.0,
      width : 180.0,
      //color: Colors.purple,
      child: RadialProgress(porcentaje: porcentaje,
      colorPrimario: this.color,
      colorSecundario: appTheme.textTheme.bodyText1.color,
      grosorSecundario: 20.0,
      grosorPrimario: 10.0,

      
      ),
    );
  }
}