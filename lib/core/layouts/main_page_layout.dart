import 'package:flutter/material.dart';
import 'package:natakapp/config/router/routes.dart';
import 'package:natakapp/core/locator.dart';
import 'package:natakapp/core/service/navigation_service.dart'; // Asegúrate de que este archivo exista y esté configurado

class MainPageLayout extends StatefulWidget {
  final Widget child;

  const MainPageLayout({super.key, required this.child});

  @override
  _MainPageLayoutState createState() => _MainPageLayoutState();
}

class _MainPageLayoutState extends State<MainPageLayout> {
  int _currentIndex = 0;

  final List<String> _routes = [
    Routes.wordSearch, // Ruta para la página principal
    Routes.maze, // Ruta para la página de búsqueda
    Routes.complete, // Ruta para la página de perfil
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    locator<NavigationService>().navigateTo(_routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed:
                      () {}, // Puedes agregar una acción aquí si es necesario
                  icon: Icon(
                    Icons.ac_unit,
                    color: Colors.white,
                  ), // Cambia el icono según tu preferencia
                ),
                option(textTheme, 'Sopa de Letras', 0),
                option(textTheme, 'Laberinto', 1),
                option(textTheme, 'Completa', 2),
              ],
            ),
          ],
        ),
      ),
      body: widget.child,
    );
  }

  Widget option(TextTheme theme, String text, int index) {
    return TextButton(
      onPressed: () => _onTabTapped(index),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: _currentIndex == index ? Colors.black : Colors.transparent,
            ),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Text(
          text,
          style: theme.bodyMedium?.copyWith(
            fontWeight:
                _currentIndex == index ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
