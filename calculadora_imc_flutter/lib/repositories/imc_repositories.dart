import '../classes/imc.dart';

class ImcRepository{
  
  final List<Imc> _imcs = [];

  Future <void> adicionar(Imc imc) async {
    await Future.delayed(Duration(milliseconds: 300));
     _imcs.add(imc);
  }

  Future <List<Imc>> listar() async {
    await Future.delayed(Duration(milliseconds: 300));
    return _imcs;
  }

  Future <void> remove(String id) async {
    await Future.delayed(Duration(milliseconds: 300));

    _imcs.remove(
      _imcs
      .where((imc) => imc.id == id)
      .first
    );
  }
}