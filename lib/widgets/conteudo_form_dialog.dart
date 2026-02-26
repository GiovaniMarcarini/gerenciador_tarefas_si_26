

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/tarefa.dart';

class ConteudoFormDialog extends StatefulWidget{
  final Tarefa? tarefaAtual;

  ConteudoFormDialog({Key? key, this.tarefaAtual }):super(key: key);

  ConteudoFormDialogState createState() => ConteudoFormDialogState();

}

class ConteudoFormDialogState extends State<ConteudoFormDialog>{
  final formkey = GlobalKey<FormState>();
  final descricaoController = TextEditingController();
  final prazoController = TextEditingController();
  final prazoFormat = DateFormat('dd/MM/yyyy');


  @override
  void initState() {
    super.initState();
    descricaoController.text = widget.tarefaAtual!.descricao;
    prazoController.text =widget.tarefaAtual!.prazoFormatado;
  }
  
  @override
  Widget build (BuildContext context){
    return Form(
      key: formkey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: descricaoController,
              decoration: const InputDecoration(labelText: 'Descrição'),
              validator: (String? valor){
                if (valor == null || valor.isEmpty){
                  return 'Informe a Descrição';
                }
                return null;
              }
            ),
            TextFormField(
              controller: prazoController,
              decoration: const InputDecoration(labelText:'Prazo',
              prefixIcon: IconButton(
                  onPressed: null, 
                  icon: Icon(Icons.calendar_today)
              ),
                suffixIcon: IconButton(
                    onPressed: null,
                    icon: Icon(Icons.close)
                ),
              ),
              readOnly: true,
            ),
          ],
        )
    );
  }
}
