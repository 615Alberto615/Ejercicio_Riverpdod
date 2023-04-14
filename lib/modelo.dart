class mda {
  String? id;
  String? todoText;
  String? tipo;
  String? fecha;
  bool realizado;

  mda({
    required this.id,
    required this.todoText,
    required this.tipo,
    required this.fecha,
    required this.realizado,
  });

  static List<mda> lista() {
    return [
      mda(
        id: '1',
        todoText: 'Tarea 1',
        tipo: 'Trabajo',
        fecha: '2021-09-01',
        realizado: false,
      ),
    ];
  }
}
