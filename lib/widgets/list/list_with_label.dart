import 'package:flutter/material.dart';

import 'list_tile_with_pop_up.dart';

class ListItemType {
  final String value;
  final String name;
  ListItemType(this.name, this.value);
}

enum Menu { itemOne, itemTwo, itemThree, itemFour }

class ListWithLabel extends StatelessWidget {
  final List<ListItemType> items;
  final String label;
  final VoidCallback onAdd;
  final Function(String) onRemove;
  final Function(String) onEdit;
  final Function(String) onTapItem;

  const ListWithLabel({
    Key? key,
    required this.label,
    required this.items,
    required this.onAdd,
    required this.onRemove,
    required this.onEdit,
    required this.onTapItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ListTile(
            leading: Text(
              label,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            trailing: IconButton(
              onPressed: onAdd,
              icon: const Icon(Icons.add, color: Colors.white, size: 30),
            ),
          ),
        ),
        SizedBox(
          height: 300,
          child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => onTapItem(items[index].value),
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          border: const Border(
                            bottom: BorderSide(
                              width: 1,
                              color: Color.fromARGB(255, 57, 147, 238),
                            ),
                          ),
                        ),
                        child: ListTileWithPopUp(
                          item: items[index],
                          onRemove: onRemove,
                          onEdit: onEdit,
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
