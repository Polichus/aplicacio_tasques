import 'package:aplicacio_tasques/components/boto_dialog.dart';
import 'package:flutter/material.dart';

class DialogNovaTasca extends StatelessWidget {
  final TextEditingController tecTextTasca;
  final Function()? accioGuardar;
  final Function()? accioCancerlar;

  const DialogNovaTasca({
    super.key,
    required this.tecTextTasca,
    required this.accioGuardar,
    required this.accioCancerlar,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.teal[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      content: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: tecTextTasca,
              cursorColor: Colors.orange[300],
              decoration: InputDecoration(
                hintText: "Escriu la tasca...",
                border: const OutlineInputBorder(),
                filled: true,
                fillColor: Colors.teal[100],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BotoDialog(
                  textBoto: "Guardar",
                  accioBoto: accioGuardar,
                ),
                BotoDialog(
                  textBoto: "Cancelar",
                  accioBoto: accioCancerlar,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
