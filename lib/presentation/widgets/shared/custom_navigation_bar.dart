import 'package:flutter/material.dart';

class CustomNavitationBar extends StatelessWidget {
  const CustomNavitationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // backgroundColor: const Color.fromARGB(255, 191, 198, 202),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_max,
            // size: 20,
          ),
          label: "Inicio",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.label_outlined,
            // size: 20,
          ),
          label: "Categorias",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite_border_outlined,
            // size: 20,
          ),
          label: "Favoritos",
        ),
      ],
    );
    // BottomNavigationBarItem(
    //   item:[

    //   icon: Icon(Icons.home),
    //   ]
    // )
    // const SizedBox(
    //     height: 350,
    //     width: double.maxFinite,
    //     child: ColoredBox(
    //       color: Colors.black26,
    //     ));
  }
}
