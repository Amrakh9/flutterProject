import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_rapp/models/category_model.dart';
import 'package:test_rapp/models/diet_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<DietModel> diets = [];

  void _getCategories() {
    categories = CategoryModel.getCategories();
    diets = DietModel.getDiets();
  }

  @override
  void initState() {
    super.initState();
    _getCategories();
  }

  @override
  Widget build(BuildContext context) {
    _getCategories();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: ListView(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _searchField(),
          const SizedBox(height: 40,),
          _categoriesSection(),
          const SizedBox(height: 40,),
          _recommendationDiet(),
          const SizedBox(height: 40,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text("Verdical List",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  //color: Colors.black
                ),
                ),
              ),
              const SizedBox(height: 15,),
              ListView.separated(
                itemCount: diets.length,
                shrinkWrap: true,
                separatorBuilder: (context, index) => const SizedBox(height: 25,),
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20
                ),
                itemBuilder: (context, index) {
                  return Container(
                    //color: Colors.blueAccent,
                    height: 115,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(diets[index].iconPath,
                        width: 65,
                        height: 65,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              diets[index].name,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.black
                              ),),

                            Text(diets[index].duration + " | " + diets[index].calories + " | " + diets[index].level,
                              style: TextStyle(
                                color: Colors.brown,
                              ),),
                          ],
                        ),
                        SvgPicture.asset('assets/icons/share-variant.svg'),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: diets[index].viewIsSelected ? [
                        BoxShadow(
                            color: Color(0xff1D1617).withOpacity(0.07),
                            offset: Offset(0, 10),
                            blurRadius: 40,
                            spreadRadius: 0
                        )
                      ] : [],
                    ),
                  );
                },
              )
            ],
          ),
          SizedBox(height: 40,),
        ],
      ),
    );
  }

  Column _recommendationDiet() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Recommendation for Diet',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 15,),
            Container(
              height: 240,
              //color: Colors.green,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(
                    left: 20,
                    right: 20
                ),
                itemCount: diets.length,
                separatorBuilder: (context, index) => SizedBox(width: 25,),
                itemBuilder: (context, index){
                  return Container(
                    //height: 50,
                    width: 210,
                    decoration: BoxDecoration(
                        color: diets[index].boxColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          child: SvgPicture.asset(diets[index].iconPath),
                        ),
                        Text(
                          diets[index].name,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.black
                        ),),

                        Text(diets[index].duration + " | " + diets[index].calories + " | " + diets[index].level,
                        style: TextStyle(
                          color: Colors.brown,
                        ),),
                        Container(
                          height: 45,
                          width: 130,
                          child: Center(
                            child: Text(
                              "View",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.black
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                diets[index].viewIsSelected ? Color(0xff9DCEFF) : Colors.black,
                                diets[index].viewIsSelected ? Color(0xff92A3FD) : Colors.black
                              ]
                            ),
                            borderRadius: BorderRadius.circular(10)
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        );
  }

  Column _categoriesSection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Category',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
            ),
            SizedBox(height: 15,),
            Container(
              height: 120,
              //color: Colors.green,
              child: ListView.separated(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20
                ),
                separatorBuilder: (context, index) => SizedBox(width: 25,),
                itemBuilder: (context, index){
                    return Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        color: categories[index].boxColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(categories[index].iconPath),
                            )
                          ),
                          Text(
                            categories[index].name,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 14
                            ),
                          )
                        ],
                      ),
                    );
                },
              ),
            )
          ],
        );
  }

  Container _searchField() {
    return Container(
          margin: EdgeInsets.only(left: 20, top: 40, right: 20),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0xff1D1617).withOpacity(0.11),
                blurRadius: 40,
                spreadRadius: 0.0
              ),

            ],
          ),

          child: TextField(
            decoration: InputDecoration(
              filled: true,
              hintText: "Search aş, dolma",
              hintStyle: TextStyle(
                fontSize: 14,
              ),
              fillColor: Colors.white,
              contentPadding: EdgeInsets.all(15),
              prefixIcon: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset('assets/icons/shark-fin.svg',
                    height: 20,
                    width: 20,
                  ),
              ),
              suffixIcon: Container(
                width: 100,
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      VerticalDivider(
                        color: Colors.black,
                        thickness: 0.1,
                        indent: 10,
                        endIndent: 10,
                      ),
                      Padding(
                          padding: const EdgeInsets.all(10),
                        child: SvgPicture.asset(
                          'assets/icons/share-variant.svg',
                          height: 20,
                          width: 20,

                        ),
                      ),
                    ],
                  ),
                ),
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none
              ),
            ),
          ),
        );
  }

  AppBar appBar() {
    return AppBar(
      title: Text('Sifarişlərim',
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    centerTitle: true,
    backgroundColor: Colors.white,
    elevation: 0.0,
    leading: GestureDetector(
    onTap: (){

    },
    child: Container(
      margin: EdgeInsets.all(14),
      alignment: Alignment.center,
      child: SvgPicture.asset (
        'assets/icons/shark-fin.svg',
        height: 20,
        width: 20,
      ),
        decoration: BoxDecoration(
          color: Colors.white,
            borderRadius: BorderRadius.circular(10)
          ),
        ),
      ),
      actions: [
      GestureDetector(
      onTap: (){

      },
    child: Container(
      margin: EdgeInsets.all(14),
      alignment: Alignment.center,
      width: 37,
      child: SvgPicture.asset(
        'assets/icons/share-variant.svg',
        height: 20,
        width: 20,
      ),
        decoration: BoxDecoration(
          color: Colors.white,
            borderRadius: BorderRadius.circular(10)
          ),
        ),
      ),],
      );
  }
}
