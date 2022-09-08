import 'package:flutter/material.dart';
import 'package:vehicle_service_app/model/car.dart';
import 'package:vehicle_service_app/ui/recentcars.dart';
import 'package:vehicle_service_app/ui/screens/preview_screen.dart';

class SearchCars extends SearchDelegate<Car>{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: ()=>query = '', icon: Icon(Icons.clear))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Car> results = recentimg.where((element) => element.name.toLowerCase().contains(query.toLowerCase())).toList();
    return ListView.builder(
      itemCount: results.length,
      itemBuilder:(_,i)=>ListTile(
        title: Text(results[i].name),
         subtitle: Text(results[i].descip),
      )
      );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Car> suggestions = recentimg.where((element) => element.name.toLowerCase().contains(query.toLowerCase())).toList();
    
    if(query.isEmpty)
    {
    return Container();
    }
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder:(_,i)=>ListTile(
        leading: Image.asset(suggestions[i].imgurl),
        title: Text(suggestions[i].name),
        subtitle: Text(suggestions[i].descip),
       
      )
      );
  }

}