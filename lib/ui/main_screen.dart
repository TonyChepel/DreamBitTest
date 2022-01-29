import 'package:cached_network_image/cached_network_image.dart';
import 'package:dreambit_test/repository/cats_data.dart';
import 'package:dreambit_test/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';


Widget MainScreen(BuildContext context,CatsInfo cats){
  return InkWell(
    onTap: ()async{
      await Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => DetailPage(cats: cats,)));
    },
    child: ItemDecoration(cats),
  );
}


Widget ItemDecoration(CatsInfo cats){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      margin: EdgeInsets.all(12.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(color: Colors.black12,blurRadius: 5.0),
          ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
              imageUrl: cats.image?.url?? "" ,
              imageBuilder: (context,imageProvider){
                return Container(
                  height: 300.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            placeholder: (context,url) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Loading...", style: TextStyle(color: Colors.orange,fontWeight: FontWeight.w700),),
            ),
            errorWidget: (context,url,error) => Icon(Icons.error),
            ),
          SizedBox(height: 10.0,),
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(5.0)
            ),
            child: Text(cats.name ?? "none",style: TextStyle(color: Colors.white,fontSize: 16.0),),
          ),
          SizedBox(height: 8.0,),
          Linkify(
            onOpen: _onOpenLink ,
              text: "Wikipedia Link : ${cats.wikipedia_url ?? "none"}"),
          SizedBox(height: 10.0,),
          Align(
            alignment: Alignment.centerRight,
              child: Text(cats.origin ?? "none",
                style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),))
        ],
      ),
    ),
  );
}

Future<void> _onOpenLink(LinkableElement link) async{
  if(await canLaunch(link.url)){
    await launch(link.url);

  } else {
    throw  'Can not launch $link';
  }
}