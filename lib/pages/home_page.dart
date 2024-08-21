// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import "package:currency/themes/FrostedGlassBox_with.dart";
import "package:currency/themes/Glass_container.dart";
import "package:currency/functions/fetch_data.dart";
import "package:flutter/material.dart";

import "../functions/fetch_data.dart";
import "../utilities/images.dart";

class home_Page extends StatefulWidget {
  const home_Page({super.key});

  @override
  State<home_Page> createState() => _home_PageState();
}

class _home_PageState extends State<home_Page> {

  var usd=1;
  String Currency_name="INR";
  String country1="USD";
  String country2="INR";

  var rate1=1.0;
  var rate2=83.52;


  TextEditingController r1=TextEditingController();
  TextEditingController r2=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get_currencies();
    Get_rates();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      // appBar: AppBar(title: Text("currency Convertor"),),
      body: Expanded(
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            image:DecorationImage(image: NetworkImage(img3),fit: BoxFit.cover),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20,),
                  Glass_container(theWidth: 300.0, theHeight: 260.0,
                      theChild:Column
                        (
                        children: [
                          SizedBox(height: 10,),
                          Text("USD To any currency",style: TextStyle(fontSize: 20,)),
                          Center(
                            child: Container(height: 60,width: 200,
                              child: TextField(decoration: InputDecoration(label: Text("USD")),
                                onChanged: (value){
                                int? parsedInt = int.tryParse(value);
                                if (parsedInt != null) {
                                  print("The string '$value' contains only integers.");
                                  print("Parsed integer value: $parsedInt");
                      
                      
                      
                                  // Step 2: Convert the string to an integer
                                  int intValue = int.parse(value);
                                  setState(() {
                                    usd=intValue;
                                    print(Drop_items_curr);
                                  });
                                  print("Converted integer value: $intValue");
                                } else {
                                  print("The string '$value' does not contain only integers.");
                                }
                      
                              },
                      
                      
                              ),
                            ),
                          ),
                          SizedBox(height: 30,)
                          ,
                          SizedBox(
                            width: 200,height: 60,
                            child: DropdownButton(
                              isExpanded: true,
                                padding: EdgeInsets.all(4),
                                value: Currency_name,items: Drop_items_curr, onChanged: (value){
                             setState(() {
                      
                               Currency_name=value;
                      
                             });
                      
                            }),
                          ),
                          SizedBox(height: 10,),
                          Text("$usd  USD = ${(usd*usd_relations[Currency_name]).toStringAsFixed(2)} $Currency_name",style: TextStyle(fontSize: 21),)
                        ],
                      )
                  ),
                  SizedBox(height: 20),
                  Glass_container(theWidth: 300.0, theHeight: 335.0,
                      theChild: Center(
                        child: Column(
                      
                          children: [
                            Column(
                      
                      
                      
                              children: [
                                SizedBox(height: 20,),
                                Container(
                                  width:200,
                      
                      
                                  child: DropdownButton(isExpanded: true,
                                      value: country1,
                                      items: Drop_items_curr, onChanged: (value){
                                    setState(() {
                                      country1=value;
                                    });
                                    print(country1);
                                  }),
                                ),
                      
                                IconButton(icon: Icon(Icons.swap_vert_outlined),onPressed: (){
                                  setState(() {
                                    var temp=country2;
                                    country2=country1;
                                    country1=temp;
                                    var tem2=rate1;
                                    rate1=rate2;
                                    rate2=tem2;
                                    r2.text=rate2.toString();
                                    r1.text=rate1.toStringAsFixed(2);

                                  });
                                },),
                      
                                Container(
                                  height: 60,width: 200,
                                  child: DropdownButton(
                                    isExpanded: true,
                                      value: country2,
                                      items: Drop_items_curr, onChanged: (value){
                                        setState(() {
                                          country2=value;
                                        });
                                      }),
                                ),
                      
                      
                      
                      
                      
                              ],
                            ),
                      
                            Column(
                              children: [
                                Container(width: 200,height: 60,
                                  child: TextField(
                                    controller: r1,
                                    decoration: InputDecoration(label: Text(country1)),
                                    onChanged: (value){
                                    int? parsedInt = int.tryParse(value);
                                    if (parsedInt != null) {
                                      int intValue = int.parse(value);
                                      setState(() {
                                        rate1=intValue.toDouble();
                                        double a= usd_relations[country1].toDouble();
                                        double b=usd_relations[country2].toDouble();
                      
                                        rate2=rate1* (b/a);
                      
                                        print(rate1);
                      
                                        print(Drop_items_curr);
                                      });
                                    }
                                  },),
                                ),
                                // TextField(
                                //   controller: r2,
                                //   decoration: InputDecoration(label: Text(country2)),
                                //   onChanged: (value){
                                //     int? parsedInt = int.tryParse(value);
                                //     if (parsedInt != null) {
                                //       int intValue = int.parse(value);
                                //       setState(() {
                                //         rate2=intValue.toDouble();
                                //
                                //         // rate1=intValue;
                                //         double a= usd_relations[country1];
                                //         double b=usd_relations[country2];
                                //
                                //         rate2=rate1*b/a;
                                //         print(Drop_items_curr);
                                //       });
                                //     }
                                //   },)
                      
                                SizedBox(height: 40,),
                                Text(" ${rate2.toStringAsFixed(2)} $country2 " ,style: TextStyle(fontSize: 21))
                              ],
                            )
                            ,
                      
                      
                      
                      
                      
                      
                          ],
                        ),
                      )
                  )
                      
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
