// ignore_for_file: unused_local_variable, use_super_parameters, prefer_const_declarations, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_maps_adv/models/reporte.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TableAlertsSeguridad extends StatelessWidget {
  const TableAlertsSeguridad({Key? key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final itemCount = 9;
    final crossAxisCount = screenWidth > 600 ? 4 : 3;
    final mainAxisSpacing = screenWidth > 600 ? 16.0 : 80.0;
    final crossAxisSpacing = screenWidth > 600 ? 10.0 : 80.0;
    final itemWidth = (screenWidth - (crossAxisCount + 1) * crossAxisSpacing) / crossAxisCount;
    final itemHeight = itemWidth + 80; // Ajusta la altura del contenedor según el tamaño de la imagen y el texto

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: mainAxisSpacing,
        crossAxisSpacing: crossAxisSpacing,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        final items = [
          Reporte(
            tipo: "Robo a casa",
            icon: "robo-a-casa.svg",
            color: "58b368",
          ),
          Reporte(
            tipo: "Robo a persona",
            icon: "robo-a-persona.svg",
            color: "2C3E50",
          ),
          Reporte(
            tipo: "Robo de vehiculo",
            icon: "robo-de-vehiculo.svg",
            color: "9C27B0",
          ),
          Reporte(
            tipo: "Accidente de tránsito",
            icon: "accidente.svg",
            color: "3498DB",
          ),
          Reporte(
            tipo: "Emergencia de salud",
            icon: "emergencia-de-ambulancia.svg",
            color: "E74C3C",
          ),
          Reporte(
            tipo: "Emergencia de bomberos",
            icon: "emergencia-de-bomberos.svg",
            color: "FFBC3B",
          ),
          Reporte(
            tipo: "Drogas",
            icon: "drogas.svg",
            color: "E67F22",
          ),
          Reporte(
            tipo: "Actividad sospechosa",
            icon: "actividad-sospechosa.svg",
            color: "2980B9",
          ),
          Reporte(
            tipo: "Prueba",
            icon: "prueba.svg",
            color: "6D6D6D",
          ),
        ];

        final reporte = items[index];

        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => Navigator.pushNamed(context, 'reporte', arguments: reporte),
          child: PhysicalModelCircleContainer(
            icon: reporte.icon,
            text: reporte.tipo,
            color: Color(int.parse('0xFF${reporte.color}')),
            itemWidth: itemWidth,
            itemHeight: itemHeight,
          ),
        );
      },
    );
  }
}

class PhysicalModelCircleContainer extends StatelessWidget {
  final String icon;
  final String text;
  final Color color;
  final double itemWidth;
  final double itemHeight;

  const PhysicalModelCircleContainer({
    Key? key,
    required this.icon,
    required this.text,
    required this.color,
    required this.itemWidth,
    required this.itemHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Column(
        children: [
          PhysicalModel(
            elevation: 4,
            shape: BoxShape.circle,
            color: color,
            child: Container(
              alignment: Alignment.center,
              width: itemWidth,
              height: itemWidth,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 4),
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                "assets/alertas/$icon",
                fit: BoxFit.cover,
                width: itemWidth * 0.6,
                colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
