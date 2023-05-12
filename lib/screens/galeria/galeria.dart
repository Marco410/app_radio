import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:provider/provider.dart';

import '../../constants/Theme.dart';
import '../../share_prefs/prefs_usuario.dart';
import '../../widgets/navbar.dart';

class Galeria extends StatefulWidget {
  const Galeria();

  @override
  GaleriaState createState() => GaleriaState();
}

class GaleriaState extends State<Galeria> {
  GaleriaState();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    /* final cursoService = Provider.of<CursosService>(context); */

    final prefs = new PreferenciasUsuario();

    List<Source> images = [
      Source(image: "1.png", title: "Conoce más sobre nosotros."),
      Source(image: "2.png", title: "Conoce más sobre nosotros."),
      Source(image: "3.png", title: "Conoce más sobre nosotros."),
      Source(image: "4.png", title: "Conoce más sobre nosotros."),
      Source(image: "5.png", title: "Conoce más sobre nosotros."),
      Source(image: "6.png", title: "Conoce más sobre nosotros."),
      Source(image: "7.png", title: "Conoce más sobre nosotros."),
      Source(image: "8.png", title: "Conoce más sobre nosotros."),
      Source(image: "9.png", title: "Conoce más sobre nosotros."),
      Source(image: "10.png", title: "Conoce más sobre nosotros."),
      Source(image: "11.png", title: "Conoce más sobre nosotros."),
      Source(image: "12.png", title: "Conoce más sobre nosotros."),
      Source(image: "13.png", title: "Conoce más sobre nosotros."),
      Source(image: "14.png", title: "Conoce más sobre nosotros."),
      Source(image: "15.png", title: "Conoce más sobre nosotros."),
      Source(image: "16.png", title: "Conoce más sobre nosotros."),
      Source(image: "17.png", title: "Conoce más sobre nosotros."),
      Source(image: "18.png", title: "Conoce más sobre nosotros."),
      Source(image: "19.png", title: "Conoce más sobre nosotros."),
    ];

    List<Widget> generateImageTiles() {
      return images
          .map((e) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    child: Image.asset(
                      "assets/img/galeria/" + e.image,
                      fit: BoxFit.fitWidth,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 42,
                      child: Center(
                        child: Text(e.title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style:
                                TextStyle(color: Colors.black38, fontSize: 15)),
                      ),
                    ),
                  )
                ],
              ))
          .toList();
    }

    CarouselController buttonCarouselController = CarouselController();

    return Scaffold(
      backgroundColor: MaterialColors.bgColorScreen,
      appBar: Navbar(
        title: "Galería",
        backButton: false,
        transparent: false,
      ),
      body: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          color: MaterialColors.bgColorScreen,
          padding: EdgeInsets.only(top: 10),
          child: CarouselSlider(
              items: generateImageTiles(),
              carouselController: buttonCarouselController,
              options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  height: MediaQuery.of(context).size.height * 0.8))),
    );
  }
}

class Source {
  Source({
    required this.image,
    required this.title,
  });
  late String image;
  late String title;
}
