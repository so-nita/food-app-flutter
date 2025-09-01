import 'package:flutter/material.dart';

class CustomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? btnWishlist;

  const CustomeAppBar({
    super.key,
    required this.title,
    this.btnWishlist,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(
        title,
        style: Theme.of(context).textTheme.displayMedium,
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      actions: [
        btnWishlist ?? Container(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
