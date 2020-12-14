


import 'dart:ui';

import 'package:flutter/material.dart';

import 'dart:math';


class CircularProgressPage extends StatefulWidget {
  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> with SingleTickerProviderStateMixin {

  double porcentaje      = 0.0;
  double nuevoPorcentaje = 0.0;

  AnimationController controller;

  @override
 void initState() { 

   controller = AnimationController(vsync: this,duration: Duration(milliseconds: 800));

   controller.addListener(() {
    
    //print('Valor controller: ${controller.value}');

    setState(() {
      porcentaje = lerpDouble(porcentaje, nuevoPorcentaje, controller.value);

      print('Valor controller: ${porcentaje}');
    });
    

  });
   super.initState();
   
 }

 @override
 void dispose() { 

   controller.dispose();
   
   super.dispose();
 }





  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        
        child: Icon(Icons.refresh),
        onPressed: (){
         
         porcentaje=nuevoPorcentaje;
         nuevoPorcentaje += 10;
         if(nuevoPorcentaje>100){

           nuevoPorcentaje = 0;
           porcentaje      = 0;
         }

         controller.forward(from:0.0);

         setState(() {
              
         });

        },

      
        backgroundColor: Colors.pink,
        
      ),

      body: Center(
        child: Container(

          padding: EdgeInsets.all(5.0),

          width: 300,
          height: 300,
          //color: Colors.red,
          child: CustomPaint(

           painter: _MiRadialProgress(porcentaje),

          ),
        ),
      ),
      
    );
  }
}

class _MiRadialProgress extends CustomPainter{

 

 final porcentaje;

 _MiRadialProgress(this.porcentaje);

 



  @override
  void paint(Canvas canvas, Size size) {

    
      
      //Circulo completado
     
     final paint = Paint()
         ..strokeWidth  = 4
         ..color        = Colors.grey
         ..style        = PaintingStyle.stroke;

     final center = Offset(size.width*0.5, size.height/2); 

     final radio = min(size.width*0.5, size.height/2);


     canvas.drawCircle(center, radio, paint);

     // Arco

     final paintArco = Paint()
         ..strokeWidth  = 10
         ..color        = Colors.pinkAccent
         ..style        = PaintingStyle.stroke;

     // Parte que se irá llenando

     double arcAngle = 2*pi*(porcentaje/100);  
     canvas.drawArc(

       Rect.fromCircle(center: center,radius: radio), 
       -pi/2, 
       arcAngle, 
       false, 
       paintArco
       
    );



  }
  
    @override
    bool shouldRepaint(CustomPainter oldDelegate) =>true;
    // TODO: implement shouldRepaint
    
  




}