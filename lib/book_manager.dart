import 'package:flutterapp/file_utils.dart';

import 'books.dart';
class bookManager{
  List<Book>finishedBooks=new List<Book>(),unfinishedBooks=new List<Book>();
  List<Book>changed=new List<Book>();

  Book findByTitle(String title){

  }
  void deleteBook(Book b){

      flush();
  }
  void resetProgress(Book b){
      b.readPages=0;
      changed.add(b);
      flush();
  }
  void addProgress(Book b,int newPages){
      b.readPages+=newPages;
      changed.add(b);
      flush();
  }
  void addBook(Book nb){
    if(nb.pages==nb.readPages)
          finishedBooks.add(nb);
    else
          unfinishedBooks.add(nb);
    flush();
  }

  void printAll(){
     print('unfinished');
      for(int i=0;i<unfinishedBooks.length;i++){
          print(unfinishedBooks[i].name);
      }
      print('finished');
  }

  void flush(){
      for(int i=0;i<changed.length;i++){
          Book cur=changed[i];
          String titlu=cur.name,author=cur.author;
          int id=cur.id,pages=cur.pages,readPages=cur.readPages;
          FileUtils.saveToFile('books/$titlu.txt','$id\n"$titlu"\n"$author"\n$pages\n$readPages');
      }
      changed.clear();
  }

}