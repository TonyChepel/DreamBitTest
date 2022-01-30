
import 'dart:async';

import 'package:dreambit_test/api/cat_api.dart';
import 'package:dreambit_test/repository/cats_data.dart';
import 'package:dio/dio.dart';

enum CatsAction{
  Fetch
}

class CatsBloc{
  final client = RestClient(Dio(BaseOptions(contentType: "application/json")));
  final _streamController = StreamController<List<CatsInfo>>();
  StreamSink<List<CatsInfo>> get _catsSink => _streamController.sink;
  Stream<List<CatsInfo>> get catsStream => _streamController.stream;


  final _eventController = StreamController<CatsAction>();

  StreamSink<CatsAction> get catsEventSink => _eventController.sink;
  Stream<CatsAction> get _catsEventStream => _eventController.stream;


  CatsBloc(){
    _catsEventStream.listen((event) async{
      if(event == CatsAction.Fetch){
     try {
        var cats = await client.getCats();
        _catsSink.add(cats);
     } on Exception catch (e) {
       _catsSink.addError("Something went wrong : $e");
     }

      }

    });
}

void dispose(){
    _streamController.close();
    _eventController.close();
}

}
