class Book{

  int id;
  String name;
  String author;
  int pages;
  int readPages;

  Book(Book nb){
    id=nb.id;
    name=nb.name;
    pages=nb.pages;
    readPages=nb.readPages;
  }

  Book.fromEmpty(){
    id=0;
    name="";
    author="";
    pages=0;
    readPages=0;
  }
  double getProgress(){
    return (readPages/pages)*100;
  }
}

Book newBook(String fileContent){
  Book auxb=new Book.fromEmpty();
  int aux=0,ind=0;
  String straux="";
  while(fileContent.codeUnitAt(ind)>='0'.codeUnitAt(0) && fileContent.codeUnitAt(ind)<='9'.codeUnitAt(0) && ind<fileContent.length){
      int cif=fileContent.codeUnitAt(ind)-'0'.codeUnitAt(0);
      aux=aux*10+cif;
      ind++;
  }
  auxb.id=aux;
  while(fileContent.codeUnitAt(ind)!='"'.codeUnitAt(0) && ind<fileContent.length)
      ind++;
  ind++;
  while(fileContent.codeUnitAt(ind)!='"'.codeUnitAt(0) && ind<fileContent.length){
      straux+=fileContent[ind];
      ind++;
  }
  auxb.name=straux;
  straux="";
  ind++;
  while(fileContent.codeUnitAt(ind)!='"'.codeUnitAt(0) && ind<fileContent.length)
    ind++;
  ind++;
  while(fileContent.codeUnitAt(ind)!='"'.codeUnitAt(0) && ind<fileContent.length){
    straux+=fileContent[ind];
    ind++;
  }
  auxb.author=straux;
  ind++;
  while(fileContent.codeUnitAt(ind)<'0'.codeUnitAt(0) || fileContent.codeUnitAt(ind)>'9'.codeUnitAt(0))
      ind++;
  aux=0;
  while(fileContent.codeUnitAt(ind)>='0'.codeUnitAt(0) && fileContent.codeUnitAt(ind)<='9'.codeUnitAt(0) && ind<fileContent.length){
    int cif=fileContent.codeUnitAt(ind)-'0'.codeUnitAt(0);
    aux=aux*10+cif;
    ind++;
  }
  auxb.pages=aux;
  while(fileContent.codeUnitAt(ind)<'0'.codeUnitAt(0) || fileContent.codeUnitAt(ind)>'9'.codeUnitAt(0))
    ind++;
  aux=0;
  while(ind<fileContent.length && fileContent.codeUnitAt(ind)>='0'.codeUnitAt(0) && fileContent.codeUnitAt(ind)<='9'.codeUnitAt(0)){
    int cif=fileContent.codeUnitAt(ind)-'0'.codeUnitAt(0);
    aux=aux*10+cif;
    ind++;
  }
  auxb.readPages=aux;
  return auxb;
}

