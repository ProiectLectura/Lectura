import 'package:path_provider/path_provider.dart';
import 'dart:io';

class FileUtils{
  static Future<String> get getFilePath async{
      final directory=await getApplicationDocumentsDirectory();
      return directory.path;
  }

  static Future<File> getFile(String fileName) async{
      final path=await getFilePath;


      return File('$path/$fileName');
  }
  static Future<File> saveToFile(String fileName,String data) async{
    final file=await getFile(fileName);
    return file.writeAsString(data);
  }
  static Future<String> readFromFile(String fileName)async{
    try{
        final file=await getFile(fileName);
        String fileContents=await file.readAsString();
        return fileContents;
    }catch(e){
      return  "";
    }
  }

}

void saveText(String fileName,String text)async{
  await FileUtils.saveToFile(fileName,text);
}
