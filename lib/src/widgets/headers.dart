


import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderCuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Container(

      height: size.height*0.35,
      color: Color(0xff615AAB),
      
    );
  }
}

class HeaderBordesRedondeados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final size  = MediaQuery.of(context).size;
    
    return Container(

      height: size.height*0.35,
      
      decoration: BoxDecoration(
        color: Color(0xff615AAB),

        borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(70.0),
        bottomRight: Radius.circular(70.0)
        
      ),
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Container(

    height:double.infinity,
    width: double.infinity,
    //color: Color(0xff615AAB),
    child: CustomPaint(
      painter:_HeaderDiagonalPainter() ,
    ),
    
      );
  }
}

class _HeaderDiagonalPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
      // TODO: implement paint

      final lapiz = Paint();

      //Propiedades

      lapiz.color       = Color(0xff615AAB);
      lapiz.style       = PaintingStyle.fill;//.fill//.stroke
      lapiz.strokeWidth = 2.0;

      final path = Path();

      //dibujar con el path y el lapiz

      path.moveTo(0, size.height*0.35);
      path.lineTo(size.width,size.height*0.30 );
      path.lineTo(size.width,0 );
      path.lineTo(0,0 );
     

      canvas.drawPath(path, lapiz);


  }
  
    @override
    bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }






}


class HeaderTriangular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Container(

    height:double.infinity,
    width: double.infinity,
    //color: Color(0xff615AAB),
    child: CustomPaint(
      painter:_HeaderTriangularPainter() ,
    ),
    
      );
  }
}

class _HeaderTriangularPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
      // TODO: implement paint

      final lapiz = Paint();

      //Propiedades

      lapiz.color       = Color(0xff615AAB);
      lapiz.style       = PaintingStyle.fill;//.fill//.stroke
      lapiz.strokeWidth = 2.0;

      final path = Path();

      //dibujar con el path y el lapiz

      path.moveTo(0,0);
      path.lineTo(0,size.height);
      path.lineTo(size.width,size.height );
      
      //path.lineTo(0,0 );
     

      canvas.drawPath(path, lapiz);


  }
  
    @override
    bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }






}

class HeaderPico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Container(

      height:double.infinity,
      width: double.infinity,
      //color: Color(0xff615AAB),
      child: CustomPaint(
      painter:_HeaderPicoPainter() ,
    ),
    
    );
  }
}

class _HeaderPicoPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
      // TODO: implement paint

      final lapiz = Paint();

      //Propiedades

      lapiz.color       = Color(0xff615AAB);
      lapiz.style       = PaintingStyle.fill;//.fill//.stroke
      lapiz.strokeWidth = 20.0;

      final path = Path();

      //dibujar con el path y el lapiz

      path.moveTo(0,0);
      path.lineTo(0,size.height*0.25);
      path.lineTo(size.width*0.5,size.height*0.3);
      path.lineTo(size.width,size.height*0.25);
      path.lineTo(size.width,0);
      //path.lineTo(size.width,size.height );
      
      //path.lineTo(0,0 );
     

      canvas.drawPath(path, lapiz);


  }
  
    @override
    bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }






}


class HeaderCurvo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Container(

      height:double.infinity,
      width: double.infinity,
      //color: Color(0xff615AAB),
      child: CustomPaint(
      painter:_HeaderCurvoPainter() ,
    ),
    
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
      // TODO: implement paint

      final lapiz = Paint();

      //Propiedades

      lapiz.color       = Color(0xff615AAB);
      lapiz.style       = PaintingStyle.fill;//.fill//.stroke
      lapiz.strokeWidth = 20.0;

      final path = Path();

      //dibujar con el path y el lapiz

      path.moveTo(0,0);
      path.lineTo(0,size.height*0.20);
      path.quadraticBezierTo(size.width*0.5,size.height*0.4, size.width,size.height*0.20);
      path.lineTo(size.width,0);
      
     

      canvas.drawPath(path, lapiz);


  }
  
    @override
    bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }






}

class HeaderWave extends StatelessWidget {

 final Color color;

  const HeaderWave( {@required this.color}) ;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Container(

      height:double.infinity,
      width: double.infinity,
      //color: Color(0xff615AAB),
      child: CustomPaint(
      painter:_HeaderWavePainter(this.color) ,
    ),
    
    );
  }
}

class _HeaderWavePainter extends CustomPainter{


  final Color color;

  _HeaderWavePainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
      // TODO: implement paint

      final lapiz = Paint();

      //Propiedades

      lapiz.color       = this.color;//Color(0xff615AAB);
      lapiz.style       = PaintingStyle.fill;//.fill//.stroke
      lapiz.strokeWidth = 20.0;

      final path = Path();

      //dibujar con el path y el lapiz

      path.moveTo(0,0);
      path.lineTo(0,size.height*0.25);
      path.quadraticBezierTo(size.width*0.25,size.height*0.30, size.width*0.5,size.height*0.25);
      path.quadraticBezierTo(size.width*0.75,size.height*0.20, size.width,size.height*0.25);
      path.lineTo(size.width,0);

      
     

      canvas.drawPath(path, lapiz);


  }
  
    @override
    bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }






}

class HeaderWaveGradient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Container(

      height:double.infinity,
      width: double.infinity,
      //color: Color(0xff615AAB),
      child: CustomPaint(
      painter:_HeaderWaveGradientPainter() ,
    ),
    
    );
  }
}

class _HeaderWaveGradientPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

     final Rect rect = Rect.fromCircle(

       center: Offset(0.0, 55),
       radius: 100
     );

     final Gradient gradiente = LinearGradient(

       begin:Alignment.topCenter,
       end:Alignment.bottomCenter ,
       colors: <Color>[

         Color(0xff6D05E8),
         Color(0xffC012FF),
         Color(0xff6D05FA),


       ],

       stops: [
         
         0.2,
         0.5,
         1.0

       ]
       
      );

      // TODO: implement paint

      final lapiz = Paint()..shader=gradiente.createShader(rect);

      //Propiedades

      //lapiz.color       = Color(0xff615AAB);
      lapiz.style       = PaintingStyle.fill;//.fill//.stroke
      lapiz.strokeWidth = 20.0;

      final path = Path();

      //dibujar con el path y el lapiz

      path.moveTo(0,0);
      path.lineTo(0,size.height*0.25);
      path.quadraticBezierTo(size.width*0.25,size.height*0.30, size.width*0.5,size.height*0.25);
      path.quadraticBezierTo(size.width*0.75,size.height*0.20, size.width,size.height*0.25);
      path.lineTo(size.width,0);

      
     

      canvas.drawPath(path, lapiz);


  }
  
    @override
    bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }






}



class IconHeader extends StatelessWidget {

  final IconData icon;
  final String   titulo;
  final String   subtitulo;
  final Color    color1;
  final Color    color2;

  const IconHeader({ 

    @required this.icon, 
    @required this.titulo, 
    @required this.subtitulo, 
    this.color1 = Colors.grey, 
    this.color2 = Colors.blueGrey,
  }) ;



  @override
  Widget build(BuildContext context) {
    
    final Color colorBlanco = Colors.white.withOpacity(0.7);

    return Stack(

      children: <Widget>[
        
        _IconHeaderBackground(
          color1:this.color1,
          color2:this.color2
        ),
        Positioned(
          top:-50.0,
          left: -50.0,
          child: FaIcon(this.icon,size: 230.0,color: Colors.white.withOpacity(0.2))
        ),

        Column(
          
          
          

          children:<Widget> [

            SizedBox(

              height: 80.0,
              width: double.infinity ,
            ),

            Text( this.titulo,style: TextStyle(fontSize: 20.0,color: colorBlanco),),

            SizedBox(

              height: 20.0,
            ),

            Text(this.subtitulo,style: TextStyle(fontSize: 25.0,color: colorBlanco,fontWeight: FontWeight.bold),),

            SizedBox(

              height: 20.0,
            ),

            FaIcon(this.icon,size: 75.0,color: Colors.white)

          ],
        )

      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {

  final Color color1;
  final Color color2;
  const _IconHeaderBackground({
     @required this.color1,
     @required this.color2,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: double.infinity,
      height: 300.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft:Radius.circular(70.0) ),
        gradient: LinearGradient(

          begin:Alignment.topCenter,
          end  :Alignment.bottomCenter ,
           
           colors:<Color> [
              
              this.color1,
              this.color2,

           ]
          
        ),
      ),

    );
  }
}