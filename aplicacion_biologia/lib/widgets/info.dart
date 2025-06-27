import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showThemeToggle;
  final VoidCallback? onThemeToggle;
  final bool showInfoButton;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showThemeToggle = false,
    this.onThemeToggle,
    this.showInfoButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: showInfoButton
          ? IconButton(
              icon: const Icon(Icons.info),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const AlertDialog(
                    title: Text('Información del Proyecto'),
                    content: Text(
                      'Desarrollado por: [Nombre de los investigadores y desarrolladores]\n\n'
                      'Este proyecto busca estudiar la conservación de la tarántula mexicana de terciopelo negro.',
                    ),
                  ),
                );
              },
            )
          : null,
      actions: [
        if (showThemeToggle)
          IconButton(
            icon: const Icon(Icons.wb_sunny),
            onPressed: onThemeToggle,
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
