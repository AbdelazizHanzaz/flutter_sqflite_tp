

class Story{

  final int? id;
  final String? title;
  final String? cover;

  Story({this.id, this.title, this.cover});


  Map<String, dynamic> toMap(){
    return {
        '_id' : id,
        'title' : title,
        'cover' : cover
    };
  }

  

  
}


