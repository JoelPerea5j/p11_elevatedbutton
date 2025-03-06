import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Desactiva el banner de depuración
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perea elevatedbutton'),
          centerTitle: true,
          titleTextStyle: const TextStyle(
            color: Color(0xfffbff00),
            fontSize: 20,
          ),
          backgroundColor: const Color(0xff000000),
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Mat: 22308051281272',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing:
                    2.0, // Espacio vertical muy reducido entre filas
                crossAxisSpacing:
                    2.0, // Espacio horizontal muy reducido entre columnas
                padding: const EdgeInsets.all(8.0), // Padding general
                childAspectRatio:
                    1.2, // Ajusta la relación de aspecto de los botones
                children: List.generate(8, (index) {
                  double buttonWidth = _getButtonWidth(index);
                  double buttonHeight = _getButtonHeight(index);
                  BorderRadius borderRadius = _getBorderRadius(index);
                  return Column(
                    mainAxisAlignment: MainAxisAlignment
                        .center, // Centra los botones verticalmente
                    children: [
                      const Text('Raiser button',
                          style: TextStyle(fontSize: 12)), // Texto más pequeño
                      SizedBox(
                          height:
                              4), // Espacio reducido entre el texto y el botón
                      Container(
                        width: buttonWidth,
                        height: buttonHeight,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _getButtonColor(index),
                            shape: RoundedRectangleBorder(
                              borderRadius: borderRadius,
                            ),
                          ),
                          child: index < 4
                              ? Icon(Icons.star, color: _getIconColor(index))
                              : const Text('Button'),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getButtonColor(int index) {
    List<Color> colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.yellow,
      Colors.orange,
      Colors.purple,
      Colors.pink,
      Colors.teal,
    ];
    return colors[index % colors.length];
  }

  Color _getIconColor(int index) {
    List<Color> colors = [
      Colors.white,
      Colors.black,
      Colors.blueGrey,
      Colors.brown,
    ];
    return colors[index % colors.length];
  }

  double _getButtonWidth(int index) {
    if (index < 2) {
      return 50.0; // Primera fila: botones pequeños
    } else if (index < 4) {
      return 70.0; // Segunda fila: botones un poco más grandes
    } else if (index < 6) {
      return 120.0; // Tercera fila: botones más anchos (aplastados)
    } else {
      return 80.0; // Cuarta fila: botones más pequeños que los de la segunda fila
    }
  }

  double _getButtonHeight(int index) {
    if (index < 2) {
      return 50.0; // Primera fila: botones pequeños
    } else if (index < 4) {
      return 70.0; // Segunda fila: botones un poco más grandes
    } else if (index < 6) {
      return 40.0; // Tercera fila: botones más aplastados (menos altos)
    } else {
      return 60.0; // Cuarta fila: botones más pequeños que los de la segunda fila
    }
  }

  BorderRadius _getBorderRadius(int index) {
    if (index < 2) {
      return BorderRadius.circular(25.0); // Primera fila: botones redondos
    } else if (index < 4) {
      return BorderRadius.circular(35.0); // Segunda fila: botones redondos
    } else if (index < 6) {
      return BorderRadius.circular(
          10.0); // Tercera fila: botones menos redondeados (aplastados)
    } else {
      return BorderRadius.circular(
          60.0); // Cuarta fila: botones muy redondeados
    }
  }
}
