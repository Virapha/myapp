import 'package:flutter/material.dart';
import 'package:movie_api/movie_module/model/movie_model.dart';
import 'package:movie_api/movie_module/screen/movie_detail_screen.dart';
import 'package:movie_api/movie_module/service/movic_service.dart';



class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Screen"),
        centerTitle: true,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Center(
      child: FutureBuilder<MovieModel>(
        future: MovieService.getAPI(),
        builder: (context, snapshot){
          if(snapshot.hasError){
            return Text("Error Movie Reading: ${snapshot.error.toString()}");
          }

          if(snapshot.connectionState == ConnectionState.done){
            return _buildGridView(snapshot.data);
          }else{
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Widget _buildGridView(MovieModel? movieModel){

    if(movieModel == null){
      return SizedBox();
    }

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
      childAspectRatio: 1.3/2,
      ),
      itemCount: movieModel.results.length,
      itemBuilder: (context, index){
        return _buildItem(movieModel.results[index]);
      });
  }

  // Widget _buildItem(Result item){
  //   return InkWell(
  //     onTap: (){
  //           Navigator.of(context).push(MaterialPageRoute
  //           (builder: (context) => MovieDetailPage (item),));
  //     },
  //     child: ListTile(
  //       subtitle: Image.network(item.posterPath,
  //       fit: BoxFit.cover,
  //       ),
  //      title: Text("${item.titleOrName}"),
        
  //     ),
  //   );
  // }
  Widget _buildItem(Result item){
  return InkWell(
    onTap: (){
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MovieDetailPage(item),
      ));
    },
    child: ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            item.posterPath,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8), // Adding some space between the image and the title
          Center(
            child: Text(
              "${item.titleOrName}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

}