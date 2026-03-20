

import 'package:teste/database/database_provider.dart';
import 'package:teste/model/tarefa.dart';

class TarefaDao{
  final dbProvider = DatabaseProvider.instace;

  Future<bool> Salvar(Tarefa tarefa) async {
    final db = await dbProvider.database;
    final valores = tarefa.toMap();
    if(tarefa.id == null){
      tarefa.id = await db.insert(Tarefa.NOME_TABELA, valores);
      return true;
    }else{
      final registrosAtualizados = await db.update(
        Tarefa.NOME_TABELA, valores,
        where: '${Tarefa.CAMPO_ID} = ?', whereArgs: [tarefa.id]
      );
      return registrosAtualizados > 0;
    }
  }

}