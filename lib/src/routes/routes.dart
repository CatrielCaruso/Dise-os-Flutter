








import 'package:flutter/material.dart';

import 'package:disenosavanzados/src/pages/slider_list_page.dart';
import 'package:disenosavanzados/src/pages/pinterest_page.dart';
import 'package:disenosavanzados/src/pages/graficas_circulares_page.dart';
import 'package:disenosavanzados/src/challenge/cuadrado_animado_page.dart';
import 'package:disenosavanzados/src/pages/slideshow_page.dart';
import 'package:disenosavanzados/src/pages/emergency_page.dart';
import 'package:disenosavanzados/src/pages/headers_page.dart';


import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final pageRoute = <_Routes>[

   _Routes(FontAwesomeIcons.slideshare,'SlideShow',SlideshowPage()),
   _Routes(FontAwesomeIcons.ambulance, 'Emergencia', EmergencyPage()),
   _Routes(FontAwesomeIcons.heading, 'Emcabezados', HeadersPage()),
   _Routes(FontAwesomeIcons.peopleCarry, 'Cuadro animado', CuadradoAnimadoPage()),
   _Routes(FontAwesomeIcons.circleNotch, 'Barra progreso', GraficasCircularesPage()),
   _Routes(FontAwesomeIcons.pinterest, 'Pinterest', PinterestPage()),
   _Routes(FontAwesomeIcons.mobile, 'Slivers', SliverListPage()),


];





class _Routes{

  final IconData icon;
  final String titulo;
  final Widget page;

  _Routes(this.icon, this.titulo, this.page);

}