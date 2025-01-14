import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ItemTasca extends StatelessWidget {
  final String textTasca;
  final bool valorChekbox;
  final Function(bool?)? canviarValorCheckbox;
  final  Function(BuildContext)? esborraTasca;

  const ItemTasca({
    super.key,
    required this.textTasca,
    required this.valorChekbox,
    required this.canviarValorCheckbox,
    required this.esborraTasca,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(10),
              onPressed: esborraTasca,
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.teal[300],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                //Chekbox
                Checkbox(
                  activeColor: Colors.teal[200],
                  checkColor: Colors.orange[200],
                  side: BorderSide(
                    color: Colors.orange[200]!,
                    width: 2,
                  ),
                  value: valorChekbox,
                  onChanged: canviarValorCheckbox,
                ),

                //Text
                Text(
                  textTasca,
                  style: TextStyle(
                    color: Colors.orange[200],
                    decoration: valorChekbox
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationColor: Colors.orange[200],
                    decorationThickness: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
