import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonForm extends StatelessWidget {
  final String text;
  final Function onPressed;

  const BotonForm({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          MaterialButton(
            onPressed: () => onPressed(),
            elevation: 8,
            highlightElevation: 5,
            color: const Color.fromARGB(255, 0, 68, 48),
            shape: RoundedRectangleBorder(
              // Utiliza RoundedRectangleBorder para personalizar los bordes
              borderRadius:
                  BorderRadius.circular(5), // Establece el radio del borde
              side: const BorderSide(
                  width: 0.5), // Establece el color y el grosor del borde
            ),
            minWidth:
                MediaQuery.of(context).size.width * 0.5, // Ancho del botón
            height: 45, // Alto del botón
            child: text == "Google"
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        FontAwesomeIcons.google,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        text,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  )
                : Text(
                    text,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
          ),
        ],
      ),
    );
  }
}
