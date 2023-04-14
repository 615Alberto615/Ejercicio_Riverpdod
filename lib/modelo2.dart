class ex {
  String? id;
  String? texto;

  ex({
    required this.id,
    required this.texto,
  });

  static List<ex> listaex() {
    return [
      ex(
        id: '1',
        texto: 'Trabajo',
      ),
      ex(
        id: '2',
        texto: 'Universidad',
      ),
    ];
  }
}
