import 'package:disenosavanzados/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SliverListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:<Widget>[

               _MainScroll(), 
               Positioned(
                 
                 bottom: -10.0,
                 right: 0.0,
                 child: _BotonNewList()
                 
                )                   

        ],
      )
     // body: _ListaTarea()
   );
  }
}

class _BotonNewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final appTheme = Provider.of<ThemeChanger>(context);
    return ButtonTheme(

      minWidth: size.width*0.9,
      height: size.height*0.1,
    
      child: RaisedButton(

        shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.0)
          )
        ),
        color:(appTheme.darkTheme) ? appTheme.currentTheme.accentColor:Color(0xffED6762),
        onPressed: (){},
        child: Text('CREATE NEW LIST',

         

         style: TextStyle(
           color: appTheme.currentTheme.scaffoldBackgroundColor,

          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 3.0
         
              ),
        
        ),
        
        ),
        
    );
           

    
  }
}

class _MainScroll extends StatelessWidget {

    final items = [
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
     _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
  
  ];






  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);
    return CustomScrollView(

      physics: BouncingScrollPhysics() ,

      slivers:<Widget> [



        // SliverAppBar(
        //   floating: true,
        //   elevation: 0.0,
        //   backgroundColor: Colors.red,
        //   title: Text('Hola mundo!!'),
        // ),

        SliverPersistentHeader(

          floating: true,
          delegate: _SliverCustomHeaderDelegate(
           
           minheight: 170.0,
           maxheight: 200.0,
           child: Container(
             
             alignment: Alignment.centerLeft,
             color: appTheme.currentTheme.scaffoldBackgroundColor,
             child: _Titulo(),
           )


          )
          
        ),

        SliverList(
          
          delegate: SliverChildListDelegate([
            
            ...items,
            SizedBox(height: 100.0)
            ])
          
      ),
      ],

    );
      
    
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {

  final double minheight;
  final double maxheight;
  final Widget child;

   _SliverCustomHeaderDelegate({
    @required this.minheight, 
    @required this.maxheight, 
    @required this.child
     });


  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
      // TODO: implement build
      return SizedBox.expand(
        child: child,
      );
    }
  
    @override
    // TODO: implement maxExtent
    double get maxExtent => (minheight > maxheight) ? minheight:maxheight;
  
    @override
    // TODO: implement minExtent
    double get minExtent => ( minheight < maxheight) ? minheight:maxheight;
  
    @override
    bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return maxheight != oldDelegate.maxheight ||
           minheight != oldDelegate.minheight ||
           child     != oldDelegate.child;
  }




}


class _Titulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);
    return Column(
        
        children:<Widget> [

           SizedBox(height: 30.0),

           Container(

              margin: EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),

              child: Text('New',style: TextStyle(

                color:(appTheme.darkTheme)? Colors.grey: Color(0xff532128),

                fontSize: 50.0),
                
              ),

           ),

           Stack(

             children:<Widget> [

               SizedBox(width: 100.0,),

               Positioned(
                  bottom: 8.0,
                  child: Container(

                           height: 8.0,
                           width: 150.0,
                           color:(appTheme.darkTheme)? Colors.grey: Color(0xffF7CDD5),
                 ),
               ),



               Container(

                  child: Text('List',
                  style: TextStyle(color: Color(0xffD93A30),fontSize: 50.0,fontWeight: FontWeight.bold),),

               ),

               

             ],
           )

        ],
        
    );
  }
}

class _ListaTarea extends StatelessWidget {


     final items = [
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
  ];


 
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder:(BuildContext context, int index) => items[index]);

     
  }
}

class _ListItem extends StatelessWidget {

  final String titulo;
  final Color color;

  const _ListItem( this.titulo, this.color) ;
 

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);
    return Container(

      alignment: Alignment.centerLeft,

      child: Text(this.titulo,style: TextStyle(
        color: Colors.white,
        fontWeight:FontWeight.bold,
        fontSize: 20.0  ),
        ),
      padding: EdgeInsets.all(20.0),
      height: 130.0,
      
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(

        color:(appTheme.darkTheme)?Colors.purpleAccent: this.color,
        borderRadius: BorderRadius.circular(30.0)

      ),
    );
  }
}


