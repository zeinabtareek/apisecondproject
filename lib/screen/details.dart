import 'package:apisecondproject/api/service.dart';
import 'package:apisecondproject/controller/article_controller.dart';
import 'package:apisecondproject/screen/web_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key,required this.title ,required this.image ,required this.description ,required this.url,required this.category}) : super(key: key);
final String title;
final String description;
final String image;
final String url;
final String category;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ArticelController());
FetchApis fetchApis =FetchApis();
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Container(
               child: ClipRRect(
                   borderRadius: const BorderRadius.only(
                     bottomRight: Radius.circular(25.0),
                     bottomLeft: Radius.circular(25.0),
                   ),
                 child: Image.network(image,fit: BoxFit.fill,height: MediaQuery.of(context).size.height/2.5,width: double.infinity,)),
           ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const SizedBox(width: 10,),
                SizedBox(
                   width: 360,
                  child: Text(title,style: const TextStyle(fontSize: 17 ,fontWeight: FontWeight.bold,),textAlign: TextAlign.right,)),
                const SizedBox(width: 10,),
                Container(
                  color: Colors.indigo,
                  width: 5,
                  height: MediaQuery.of(context).size.height/10,
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.only(left: 8,right: 8),
              margin:const EdgeInsets.only(left: 8,right: 8),
              width: MediaQuery.of(context).size.width,
              child: Text(description ,style: TextStyle(fontSize: 15 ,height: 1.5, ),textAlign: TextAlign.right,)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(child: const Text('شاهد الخبر كاملا' ,textAlign: TextAlign.right,style: TextStyle(fontSize: 15 ,fontWeight: FontWeight.w600,decoration: TextDecoration.underline,color: Colors.blue),) ,onTap: ()
                {Get.to(WebViewScreen(url: url,));
                },),
              ),
            ),
            const Align(
                alignment: Alignment.centerRight,
                child: Text('<الاخبار الاكثر قراءه ',style: TextStyle(fontWeight: FontWeight.bold),)),

            Container(
              height: MediaQuery.of(context).size.height/3,
              // color: Colors.indigo,
              child:
              Center(
              child:
              FutureBuilder(
                        future: fetchApis.fetchdata(category),
                  builder:(BuildContext context, AsyncSnapshot<dynamic> snapshot){
                    return ListView.builder(
              shrinkWrap: true,
              physics :const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context , index) {
                return Container(
                  padding: const EdgeInsets.only( right: 5),
                  height: 100,
                  width: 200,

                    child: Wrap(
                      children: [
                   GestureDetector(
                       child: Image.network( snapshot.data[index].imageUrl.toString(),fit: BoxFit.fill,),
                      onTap: (){
                        Get.to(DetailsScreen(image: image, title: title, category: category, description: description, url: url,));
                      },
                    ),
                        Text(snapshot.data[index].title.toString(),textAlign: TextAlign.right,),
                      ],
                    ),

                );}
                  );
                }
            ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
