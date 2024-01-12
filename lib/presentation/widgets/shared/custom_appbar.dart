import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    //Tema del color de las letras e iconos
    final colors = Theme.of(context).colorScheme;
    //Tema del estilo de las letras
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Icon(
                  Icons.movie_creation_outlined,
                  color: colors.primary,
                ),
                const SizedBox(width: 10),

                //titulo
                Text(
                  'Cinemateca',
                  style: titleStyle,
                ),

                //
                const Spacer(),
                //boton de búsqueda
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: colors.primary,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
