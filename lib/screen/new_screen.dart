import 'package:apisecondproject/api/service.dart';
import 'package:apisecondproject/controller/article_controller.dart';
import 'package:apisecondproject/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'details.dart';

class NewsScreen extends StatefulWidget {
  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> with SingleTickerProviderStateMixin {

  final List<Tab> tabs =[
     const Tab(text: 'business',),
     const Tab(text: 'entertainment',),
     const Tab(text: 'general',),
     const Tab(text: 'health',),
     const Tab(text: 'science',),
     const Tab(text: 'sports',),
     const Tab(text: 'technology',),
  ];
  final controller = Get.put(ArticelController());
 late TabController  _tabController ;


  @override
  void initState(){
    super.initState();
    _tabController=TabController(length: tabs.length, vsync: this);
  }
  @override
  void dispose(){
    super.dispose();
    _tabController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exact News',style: const TextStyle(fontSize: 30),),
        backgroundColor: Colors.indigo,
        bottom:  TabBar(
          onTap: (index){
            controller.fetchArticels(tabs[index].text!);
          },
          isScrollable: true,
          unselectedLabelColor: Color(0xffBDBDBD),
          labelColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: tabs,
          indicator: ShapeDecoration(
              gradient: LinearGradient(colors: [Colors.indigo,Colors.white10]),
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(5),

              )),
          controller: _tabController,
          indicatorColor: Color(0xffBDBDBD),

        ),
      ),
      body:  TabBarView(

        controller: _tabController,
          children: tabs.map((tab) {

            return Center(
              child:Obx(()=>controller.articalesList.isEmpty?const Center(child: CircularProgressIndicator()):
                  ListView.builder(
                shrinkWrap: true,
                itemCount: controller.articalesList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      controller.fetchCategoryName(tab.text.toString());
                      Get.to(DetailsScreen(
                        title: controller.articalesList[index].title.toString(),
                        description: controller.articalesList[index].description.toString(),
                        image: controller.articalesList[index].imageUrl.toString(),
                        url:controller.articalesList[index].url.toString(),
                        category: tab.text.toString(),
                        // category:controller.articalesListByCat[index].c

                      ));
                    },
                    child: Container(
                        padding:
                        const EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 10),
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: [
                                  Color(0xFFFFFFFF),
                                  Color(0xB0E7E9E7),
                                ],
                                begin: Alignment(0.2, 0.0),
                                end: Alignment(1.0, 0.0),
                                tileMode: TileMode.clamp),
                            borderRadius: BorderRadius.circular(20)),
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.start,
                          alignment: WrapAlignment.start,
                          children: [
                            Image.network(
                              // controller.articalesList[index].imageUrl
                              controller.articalesList[index].imageUrl
                                  .toString() ==
                                  'null'
                                  ? controller.articalesList[2].imageUrl
                                  .toString()
                                  : controller.articalesList[index].imageUrl
                                  .toString(),
                              fit: BoxFit.fill,
                              width: MediaQuery.of(context).size.width / 1,
                              height: MediaQuery.of(context).size.height / 4,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(controller.articalesList[index].title
                                        .toString(),),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Wrap(
                                      crossAxisAlignment: WrapCrossAlignment.start,
                                      alignment: WrapAlignment.start,
                                      children: [
                                        Text(
                                          controller.articalesList[index].description
                                              .toString() ==
                                              'null'
                                              ? ''
                                              : controller
                                              .articalesList[index].description
                                              .toString(),
                                          style: const TextStyle(
                                              fontSize: 12.0,
                                              color: Color(0xff465bd8),
                                              fontWeight: FontWeight.bold),
                                        )
                                        // Text(controller.articalesListByCat[index].title
                                        //     .toString()),
                                      ],
                                    ),
                                  ],
                                ))
                          ],
                        )),
                  );
                },
              )

              ) );
          } ).toList())
    );
  }

}

