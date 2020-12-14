

import 'package:flutter/material.dart';
import 'dart:math';

class RadialProgress extends StatefulWidget {

  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorSecundario;
  final double grosorPrimario;

   RadialProgress({@required this.porcentaje,
    this.colorPrimario    = Colors.blue, 
    this.colorSecundario  = Colors.grey, 
    this.grosorSecundario = 4.0, 
    this.grosorPrimario   = 10.0,
    
  });

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin{

  AnimationController controller;
  double porcentajeAnterior;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    porcentajeAnterior=widget.porcentaje;
    controller = AnimationController(vsync: this,duration: Duration(milliseconds: 200));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  
  @override
  Widget build(BuildContext context) {

    controller.forward(from: 0.0);
    
    final diferenciaAnimar   = widget.porcentaje-porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller,
      //child: child,
      builder: (BuildContext context, Widget child) {
         return Container(

               padding: EdgeInsets.all(10.0),
        
               height: double.infinity,
               width : double.infinity,
               child: CustomPaint(
          
                    painter: _MiRadialProgress((widget.porcentaje-diferenciaAnimar)+(diferenciaAnimar*controller.value),widget.colorPrimario,
                    
                    widget.colorSecundario,widget.grosorSecundario,widget.grosorPrimario)
          
                    ),

          );
      
      },
    );

    
  }
}


class _MiRadialProgress extends CustomPainter{

 

 final porcentaje;
 final Color colorPrimario;
 final Color colorSecundario;
 final double grosorSecundario;
 final double grosorPrimario;

 _MiRadialProgress(this.porcentaje, this.colorPrimario, this.colorSecundario, this.grosorSecundario, this.grosorPrimario);

 



  @override
  void paint(Canvas canvas, Size size) {

     final Rect rect = Rect.fromCircle(

       center: Offset(0, 0),
       radius: 180.0
     );

     final gradiente = LinearGradient(colors:<Color>[

       Color(0xffC012FF),
       Color(0xff6D05E8),
       Colors.red
       

     ]);
      
      //Circulo completado
     
     final paint = Paint()
         ..strokeWidth  = grosorSecundario
         ..color        = colorSecundario
         ..style        = PaintingStyle.stroke;

     final center = Offset(size.width*0.5, size.height/2); 

     final radio = min(size.width*0.5, size.height/2);


     canvas.drawCircle(center, radio, paint);

     // Arco

     final paintArco = Paint()
         ..strokeWidth  = grosorPrimario
         //..color        = colorPrimario
         ..shader       = gradiente.createShader(rect)
         ..strokeCap    = StrokeCap.round
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