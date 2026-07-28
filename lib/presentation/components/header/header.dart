import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leadingIcon;
  final Widget? title;
  final Widget? lastIcon;
  final double height;

  const AppHeader({
    super.key,
    this.leadingIcon,
    this.title,
    this.lastIcon,
    this.height = kToolbarHeight,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,

      automaticallyImplyLeading: false,

      leading: leadingIcon,

      titleSpacing: 0,
      centerTitle: true,

      title: title != null ? Center(child: title) : null,

      actions: lastIcon != null
          ? [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),

                child: Center(child: lastIcon!),
              ),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
