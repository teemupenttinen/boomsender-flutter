import 'package:flutter/material.dart';

import 'list_with_label.dart';

class ListTileWithPopUp extends StatelessWidget {
  final ListItemType item;
  final Function(String) onRemove;
  final Function(String) onEdit;

  const ListTileWithPopUp({
    Key? key,
    required this.item,
    required this.onRemove,
    required this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        item.name,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.displayMedium,
      ),
      trailing: PopupMenuButton<Menu>(
        offset: const Offset(-10, 0),
        shape: const TooltipShape(),
        icon: const Icon(
          Icons.menu_outlined,
          color: Colors.black,
        ),
        color: Theme.of(context).primaryColor,
        position: PopupMenuPosition.under,
        itemBuilder: (context) => <PopupMenuEntry<Menu>>[
          PopupMenuItem(
            enabled: true,
            onTap: () {
              onRemove(item.value);
              Navigator.pop(context);
            },
            child: const SizedBox(
              width: 150,
              child: Text(
                "Delete",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const PopupMenuItem(
            height: 0,
            child: Divider(
              color: Colors.black,
            ),
          ),
          PopupMenuItem(
            enabled: true,
            onTap: () {
              onEdit(item.value);
              Navigator.pop(context);
            },
            child: const SizedBox(
              width: 150,
              child: Text(
                "Edit",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TooltipShape extends ShapeBorder {
  const TooltipShape();

  final BorderSide _side = BorderSide.none;
  final BorderRadiusGeometry _borderRadius = BorderRadius.zero;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(_side.width);

  @override
  Path getInnerPath(
    Rect rect, {
    TextDirection? textDirection,
  }) {
    final Path path = Path();

    path.addRRect(
      _borderRadius.resolve(textDirection).toRRect(rect).deflate(_side.width),
    );

    return path;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final Path path = Path();
    final RRect rrect = _borderRadius.resolve(textDirection).toRRect(rect);

    path.moveTo(0, 10);
    path.quadraticBezierTo(0, 0, 10, 0);

    // Arrow
    // path.lineTo(rrect.width - 30, 0);
    // path.lineTo(rrect.width - 20, -10);

    path.lineTo(rrect.width - 10, 0);
    path.quadraticBezierTo(rrect.width, 0, rrect.width, 10);
    path.lineTo(rrect.width, rrect.height - 10);
    path.quadraticBezierTo(
        rrect.width, rrect.height, rrect.width - 10, rrect.height);
    path.lineTo(10, rrect.height);
    path.quadraticBezierTo(0, rrect.height, 0, rrect.height - 10);

    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => RoundedRectangleBorder(
        side: _side.scale(t),
        borderRadius: _borderRadius * t,
      );
}
