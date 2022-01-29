import 'package:dreambit_test/controller/cats_bloc.dart';
import 'package:dreambit_test/repository/cats_data.dart';
import 'package:dreambit_test/ui/main_screen.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final catsBloc = CatsBloc();

  @override
  void initState() {
    catsBloc.catsEventSink.add(CatsAction.Fetch);
    super.initState();
  }

  @override
  void dispose() {
    catsBloc.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[300],
      appBar: AppBar(title: Text("Cats",
        style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: StreamBuilder<List<CatsInfo>>(
        stream: catsBloc.catsStream,
        builder: (context,snapshot){
          if(snapshot.hasData){
            final List<CatsInfo>? catsData = snapshot.data;
            return ListView.builder(
                itemCount: catsData!.length,
                itemBuilder: (context,index){
                  return MainScreen(context, catsData[index]);

            });
          }  else if(snapshot.hasError){
            print("Error Data");
          }
          else if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator( backgroundColor: Colors.white,));
          } else{
            return Center(child: Text("No Cats Data",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30.0),),);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
