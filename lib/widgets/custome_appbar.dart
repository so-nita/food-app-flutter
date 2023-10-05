import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomeAppBar extends StatelessWidget with PreferredSizeWidget {
  String title;
  CustomeAppBar(
      {super.key, required this.title, /*this.ontap,*/ this.btnWishlist});
  // final VoidCallback? ontap;
  final Widget? btnWishlist;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(title, style: Theme.of(context).textTheme.displayMedium),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      actions: [
        btnWishlist ?? Container()
        // IconButton(
        //   onPressed: ontap,
        //   icon: const Icon(
        //     Icons.favorite_border,
        //     color: Colors.black,
        //   ),
        // )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
