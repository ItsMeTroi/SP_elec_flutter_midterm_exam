class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Go to LTO', isDone: true ),
      ToDo(id: '02', todoText: 'Get License', isDone: true ),
      ToDo(id: '03', todoText: 'Go to school', ),
      ToDo(id: '04', todoText: 'Finish project', ),
      ToDo(id: '05', todoText: 'Study for test', ),
      ToDo(id: '06', todoText: 'Esports Duties', ),
    ];
  }
}