import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/movie_provider.dart';

class MyListScreen extends StatefulWidget{
  const MyListScreen({Key? key}): super(key: key);

  @override
  State<MyListScreen> createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen>{
  @override
  Widget build(BuildContext context) {
    final myList = context.watch<MovieProvider>().myList;

    return Scaffold(
      appBar: AppBar(title: Text("My List ${myList.length}"),),
      //ListView.builder
      body: ListView.builder(
        itemCount: myList.length,
        itemBuilder: (_,index){
          //Object of class Movie for myList items via index
          final currentMovie = myList[index];
          //Card
          return Card(
            key: ValueKey(currentMovie.title),
            elevation: 4,
            //ListTile
            child: ListTile(
              title: Text(currentMovie.title),
              subtitle: Text(currentMovie.runtime ?? ""),
              //Trailing: icon
              trailing: TextButton(
                child: const Text(
                  "Remove",
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: (){
                  context.read<MovieProvider>().removeFromList(currentMovie);
                },
              )
            )
            
          );
        }
      ),
    );
  }

}
