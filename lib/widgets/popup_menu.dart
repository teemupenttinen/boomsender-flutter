import 'package:flutter/material.dart';

class PopupMenu extends StatefulWidget {
  final ValueChanged<int> onChange;

  const PopupMenu({
    required Key key,
    required this.onChange,
  });

  @override
  State<PopupMenu> createState() => _PopupMenuState();
}

class _PopupMenuState extends State<PopupMenu> {
  final GlobalKey _key = LabeledGlobalKey("test");
  bool isMenuOpen = false;
  Offset buttonPosition = const Offset(0, 0);
  Size buttonSize = const Size.fromRadius(10);
  OverlayEntry? _overlayEntry;

  findButton() {
    RenderBox renderBox = _key.currentContext!.findRenderObject() as RenderBox;
    buttonSize = renderBox.size;
    buttonPosition = renderBox.localToGlobal(Offset.zero);
  }

  void closeMenu() {
    _overlayEntry?.remove();
    isMenuOpen = !isMenuOpen;
  }

  void openMenu() {
    findButton();
    _overlayEntry = _overlayEntryBuilder();
    Overlay.of(context)?.insert(_overlayEntry!);
    setState(() {
      isMenuOpen = !isMenuOpen;
    });
  }

  OverlayEntry _overlayEntryBuilder() {
    return OverlayEntry(
      builder: (context) {
        return Positioned(
          top: buttonPosition.dy + buttonSize.height,
          left: buttonPosition.dx - 200,
          width: 200,
          child: Material(
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                ),
                width: 100,
                height: 200,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1, color: Colors.black))),
                      child: Row(
                        children: [
                          const Text('Close'),
                          IconButton(
                              alignment: Alignment.centerRight,
                              onPressed: closeMenu,
                              icon: const Icon(
                                Icons.close,
                                color: Colors.black,
                              )),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: closeMenu,
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                  ],
                ),
              )),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: _key,
      width: 20,
      height: 20,
      child: IconButton(
        icon: const Icon(
          Icons.menu_outlined,
          color: Colors.black,
        ),
        onPressed: openMenu,
      ),
    );
  }
}
