
import 'package:flutter/material.dart';


import 'package:provider/provider.dart';
import 'package:disenosavanzados/src/models/slider_model.dart';

import 'package:flutter_svg/flutter_svg.dart';

class SlideShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(

      create: (_)=>SliderModel(),
      child: Scaffold(
        body: Center(
            child: Column(
          children: <Widget>[Expanded(child: _Slides()), _Dots()],
        )),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 75.0,
      //color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[_Dot(0), _Dot(1), _Dot(2)],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

   _Dot(this.index);

  @override
  Widget build(BuildContext context) {

    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      height: 20.0,
      width: 20.0,
      decoration: BoxDecoration(
        color: (pageViewIndex>=index-0.5 && pageViewIndex < index +0.5)
                ?Colors.red:Colors.grey, 
        shape: BoxShape.circle
        
      ),
    );
  }
}

//SvgPicture.asset('assets/svgs/slide-1.svg'),

class _Slides extends StatefulWidget {
  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    pageViewController.addListener(() {
      print('${pageViewController.page}');
      // Acá se actualiza el provider. La instacia de mi clase slider_MODEL

      Provider.of<SliderModel>(context,listen: false).currentPage=pageViewController.page;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose

    pageViewController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: PageView(
        controller: pageViewController,
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          _Slide('assets/svgs/slide-1.svg'),
          _Slide('assets/svgs/slide-2.svg'),
          _Slide('assets/svgs/slide-3.svg'),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String svg;
  _Slide(this.svg);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(30.0),
      child: SvgPicture.asset(svg),
    );
  }
}
