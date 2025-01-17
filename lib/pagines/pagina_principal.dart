import 'package:aplicacio_tasques/components/dialog_nova_tasca.dart';
import 'package:aplicacio_tasques/components/item_tasca.dart';
import 'package:flutter/material.dart';

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  List tasquesLlista = [
    {"titol": "Tasca 1", "valor": false},
    {"titol": "Tasca 2", "valor": false},
    {"titol": "Tasca 3", "valor": false},
  ];

  TextEditingController tecTextTasca = TextEditingController();

  void accioGuardar(){
    setState(() {
      tasquesLlista.add({
        "titol": tecTextTasca.text,
        "valor": false,
      });
    });
    accioCancerlar();
  }
  void accioCancerlar(){
    Navigator.of(context).pop();
    tecTextTasca.clear();
  }

  void canviaCheckbox(int posLista) {
    setState(() {
      tasquesLlista[posLista]["valor"] = !tasquesLlista[posLista]["valor"];
    });
  }

  void accioEsborrarTasca(int posLista) {
    setState(() {
      tasquesLlista.removeAt(posLista);
    });
  }

  void crearNovaTasca() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogNovaTasca(
          tecTextTasca: tecTextTasca,
          accioGuardar: accioGuardar,
          accioCancerlar: accioCancerlar,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],

      //AppBar
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("App Tasques"),
        foregroundColor: Colors.orange[200],
      ),

      //FloatingActionButton
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal[300],
        shape: const CircleBorder(),
        onPressed: crearNovaTasca,
        child: Icon(
          Icons.add,
          color: Colors.orange[200],
        ),
      ),

      //Body
      body: ListView.builder(
        itemCount: tasquesLlista.length,
        itemBuilder: (context, index) {
          return ItemTasca(
            textTasca: tasquesLlista[index]["titol"],
            valorChekbox: tasquesLlista[index]["valor"],
            canviarValorCheckbox: (valor) => canviaCheckbox(index),
            esborraTasca: (valor) => accioEsborrarTasca(index),
          );
        },
      ),
    );
  }
}
