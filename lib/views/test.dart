import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  final PageController _pageController = PageController();
  final List<String> menuItems = ["Page 1", "Page 2", "Page 3"];
  int currentPage = 0;

  // Fonction pour déterminer une couleur de texte basée sur le contraste avec l'arrière-plan
  Color getContrastColor(Color backgroundColor) {
    // Formule pour déterminer la luminosité relative d'une couleur
    final luminance = (0.299 * backgroundColor.red +
            0.587 * backgroundColor.green +
            0.114 * backgroundColor.blue) /
        255;

    // Si la luminance est suffisamment élevée, utilisez une couleur de texte sombre
    return luminance > 0.5 ? Colors.black : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Color(0xFF040b14); // Couleur d'arrière-plan

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Menu avec PageView"),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 50.0,
              child: DefaultTextStyle(
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: getContrastColor(
                      backgroundColor), // Couleur du texte basée sur le contraste
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: menuItems.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        _pageController.animateToPage(index,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease);
                        currentPage = index;
                      },
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        color:
                            backgroundColor, // Utilisez la couleur d'arrière-plan
                        child: Text(
                          menuItems[index],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  currentPage = index;
                },
                children: [
                  // Contenu de la Page 1
                  Container(
                    color:
                        backgroundColor, // Utilisez la couleur d'arrière-plan
                    child: Center(
                      child: Text(
                        "Contenu de la Page 1",
                        style: TextStyle(
                          color: getContrastColor(
                              backgroundColor), // Couleur du texte basée sur le contraste
                        ),
                      ),
                    ),
                  ),
                  // Contenu de la Page 2
                  Container(
                    color:
                        backgroundColor, // Utilisez la couleur d'arrière-plan
                    child: Center(
                      child: Text(
                        "Contenu de la Page 2",
                        style: TextStyle(
                          color: getContrastColor(
                              backgroundColor), // Couleur du texte basée sur le contraste
                        ),
                      ),
                    ),
                  ),
                  // Contenu de la Page 3
                  Container(
                    color:
                        backgroundColor, // Utilisez la couleur d'arrière-plan
                    child: Center(
                      child: Text(
                        "Contenu de la Page 3",
                        style: TextStyle(
                          color: getContrastColor(
                              backgroundColor), // Couleur du texte basée sur le contraste
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
