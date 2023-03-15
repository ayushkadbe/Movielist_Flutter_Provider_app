import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/movie_provider.dart';
import 'my_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var movies = context.watch<MovieProvider>().movies;
    var myList = context.watch<MovieProvider>().myList;

    return Scaffold(
      appBar: AppBar(title: const Text('Movie List Provider')),
      body: Padding(padding: const EdgeInsets.all(15),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            //RED FAVOURITES BUTTON WITH ICON, TITLE, TEXT & NAVIGATOR
            ElevatedButton.icon(
              onPressed:() { Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MyListScreen(),
                ),
              );
              },
              icon: const Icon(Icons.favorite),
              label: Text("Go to my list (${myList.length})",
                style: const TextStyle(fontSize: 20),),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 20),
              ),
            ),

            //SPACE
            const SizedBox(height: 15,),

            //CONVERT DATA SOURCE INTO WIDGETS i.e ListView into ListView.builder()
            Expanded(
              child: ListView.builder(
                itemCount: movies.length,
                itemBuilder:(_,index){
                  //Object of Movies Class to access movies list item via index
                  final currentMovie = movies[index];

                  //Card
                  return Card(
                    //ValueKey class: assigns value to itself
                    key: ValueKey(currentMovie.title),
                    color: Color.fromARGB(255, 178, 255, 89),
                    elevation: 4,

                    //ListTile
                    child: ListTile(
                      title: Text(currentMovie.title),
                      subtitle: Text(currentMovie.runtime ?? "No information"),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: myList.contains(currentMovie) ? Colors.red : Colors.white,
                          size: 30
                        ),
                        onPressed:(){
                          if(!myList.contains(currentMovie)){
                            context
                              .read<MovieProvider>()
                              .addToList(currentMovie);
                          }else{
                              context
                              .read<MovieProvider>()
                              .removeFromList(currentMovie);
                          }
                        }
                      ),
                    )
                  );
                }
                )
            )
            
          ],
        )
      )
    );
  }
}
