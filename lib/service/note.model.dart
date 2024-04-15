class NoteModel{
  final int id;
  final String description;

  NoteModel({required this.id, required this.description});

  NoteModel.fromMap(Map<String, dynamic> item):
      id=item["id"], description=item["description"];

  Map<String, Object> toMap(){
    return {'id':id, 'description':description};
  }
}