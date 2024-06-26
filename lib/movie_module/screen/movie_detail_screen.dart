import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_api/movie_module/model/movie_model.dart';


class MovieDetailPage extends StatefulWidget {
  Result item;
  MovieDetailPage(this.item);


  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Detail"),
        centerTitle: true,
        backgroundColor: Colors.black,

      ),
      body: _buildBody(),
    );
  }


  Widget _buildBody(){
    return Container(
      child: ListView(
        children: [
          Container(
            child: Image.network(widget.item.posterPath, fit: BoxFit.cover,),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0), 
            child: Text("${widget.item.titleOrName}",
            style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.center,
            ),
          ),
          Center(
            child: RatingBar(
              allowHalfRating: true,
              initialRating: widget.item.voteAverage /2,
              itemCount: 5,
              ratingWidget: RatingWidget(
                full: Icon(Icons.star, color: Colors.yellow,),
                half: Icon(Icons.star_half, color: Colors.orange,),
                empty: Icon(Icons.star_border, color: Colors.white,),
              ),
              onRatingUpdate: (double value) {},
              ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("${widget.item.dateOnly}",
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("${widget.item.overview}",
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }





}