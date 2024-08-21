import "dart:convert";

import "package:currency/utilities/keys.dart";
import "package:flutter/material.dart";
import"package:http/http.dart" as http;

Map abbrivation={"INR":"Indian Natutional Rupee"};
Map usd_relations={"INR":83};
Get_currencies ()async
{
  var responses= await http.get(Uri.parse("https://openexchangerates.org/api/currencies.json"));
  // var responses= await http.get(Uri.parse("https://openexchangerates.org/api/latest.json?app_id="+api_key));

  final all_currencies=responses.body;
  print("all_currencies");
  print(all_currencies.runtimeType);
  String jsonString = all_currencies;
  Map<String, dynamic> data = json.decode(jsonString);

  print(data);
  print("data runtype =>");print(data.runtimeType);
  print(data["rates"].runtimeType);

  var curr=data;

  int count=1;



  curr.forEach((key, value)
    {
      print("hello");
      Drop_items_curr.add(DropdownMenuItem<String>(child: Text(" " +key+" - "+value,
          maxLines: 1, // Limit to 2 lines
          overflow: TextOverflow.ellipsis),
          value: key,
      ));
      print(count);count++;



    });

  abbrivation= data;


}



List<DropdownMenuItem> Drop_items_curr=[];
List <DropdownMenuItem>Drop_items_rates=[];
Get_rates ()async
{

  var responses= await http.get(Uri.parse("https://openexchangerates.org/api/latest.json?app_id="+api_key));

  final all_currencies=responses.body;
  print("all_currencies");
  print(all_currencies.runtimeType);
  String jsonString = all_currencies;
  Map<String, dynamic> data = json.decode(jsonString);

  print(data);
  print("data runtype =>");print(data.runtimeType);
  print(data["rates"].runtimeType);

  data.forEach((key, value)
  {
    Drop_items_rates.add(DropdownMenuItem(

      child: Container(
      width: 200,
        child: SingleChildScrollView(child: Text(key+"  "+value.toString()))),
      value: key,
    ));


  });



  usd_relations =data["rates"];

  usd_relations.forEach((key, value)
  {
    print("hello");
    Drop_items_curr.add(DropdownMenuItem<String>(child: Row(
      children: [
        Expanded(
          child: Text(key+"  "+value,
              style: TextStyle(fontSize: 12),
              maxLines: 1, // Limit to 2 lines
              overflow: TextOverflow.ellipsis),
        ),
      ],
    ),
      value: key,
    ));




  });


}


