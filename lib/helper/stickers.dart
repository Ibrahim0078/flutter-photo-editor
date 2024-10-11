class Stickers {

  List<List<String>> list(){
    return [
      emoji(),
      space(),
      text(),
    ];
  }

  List<String> emoji(){
    List<String> list = [];
    for ( int i = 1; i <= 6; i++){
      list.add('assets/stickers/emoji$i.png');
    }
    return list;
  }

  List<String> space(){
    List<String> list = [];
    for ( int i = 1; i <= 6; i++){
      list.add('assets/stickers/space$i.png');
    }
    return list;
  }

  List<String> text(){
    List<String> list = [];
    for ( int i = 1; i <= 6; i++){
      list.add('assets/stickers/text$i.png');
    }
    return list;
  }

}