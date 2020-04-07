import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'file_utils.dart';
import 'books.dart';
import 'book_manager.dart';



void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bookManager bm;
  void init()async{
    String aux=await FileUtils.getFilePath;
    new Directory('$aux/books').create()
        .then((Directory directory) {
      print(directory.path);
    });
    bm=new bookManager();
    int k=0,nb=0;
    String books=await FileUtils.readFromFile("books.txt");

    while(k<books.length && books.codeUnitAt(k)>='0'.codeUnitAt(0) && books.codeUnitAt(k)<='9'.codeUnitAt(0)){
        nb=nb*10+books.codeUnitAt(k)-'0'.codeUnitAt(0);
        k++;
    }
    print(nb);
    for(int i=1;i<=nb;i++){
        String nume="";
        while(k<books.length && books.codeUnitAt(k)!='"'.codeUnitAt(0))
           k++;
        k++;
        while(k<books.length && books.codeUnitAt(k)!='"'.codeUnitAt(0)) {
            nume += books[k];
            k++;
        }
        k++;
        String content=await FileUtils.readFromFile('books/$nume.txt');
        bm.addBook(newBook(content));
    }
    bm.printAll();
  }
  @override
  Widget build(BuildContext context) {
    init();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _countx="abv";
  void _incrementCounter()async{
    _countx= await FileUtils .readFromFile('data/rib.txt');
    setState(() {
      _countx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_countx\n',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
