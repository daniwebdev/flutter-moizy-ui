import 'package:flutter/material.dart';
class PopupItemIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? color;

  const PopupItemIcon({Key? key, required this.icon, required this.text, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: color,
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}

class MoizyPopupMenuButton<A> extends StatelessWidget {
  final List<MoizyPopupMenuItem<A>> items;
  final Function(A) onSelected;
  final Widget? child;

  const MoizyPopupMenuButton({Key? key, this.child, required this.items, required this.onSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<A>(
      elevation: 2,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey[100]!),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      padding: EdgeInsets.zero,
      icon: child == null ? const Icon(Icons.more_vert):null,
      child: child,
      itemBuilder: (context) => items
          .map((e) => PopupMenuItem(
                value: e.value,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                child: PopupItemIcon(
                  color: e.color,
                  icon: e.icon,
                  text: e.text,
                ),
              ))
          .toList(),
      onSelected: (value) {
        onSelected(value);
      },
    );
  }
}

class MoizyPopupMenuItem<A> {
  final IconData icon;
  final String text;
  final A value;
  final Color color;

  MoizyPopupMenuItem({required this.icon, required this.text, required this.value, required this.color});
}
