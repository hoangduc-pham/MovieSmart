import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailMoviePage extends StatefulWidget {
  @override
  _DetailMoviePageState createState() => _DetailMoviePageState();
}

class _DetailMoviePageState extends State<DetailMoviePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
    appBar:
        AppBar(
            foregroundColor: Colors.white,
            backgroundColor: Colors.black,
            elevation: 1,
            title: const Text(
              'Thor - thần sấm',
              style: TextStyle(fontSize: 20, color: Colors.white),
            )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/phim1.png',
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Thor - thần sấm',
                  style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text(
                  '2022 | 18+ | 1 Season | K-Drama ',
                  style: TextStyle(fontSize: 15, color: Colors.white70),
                ),
                SizedBox(height: 10),
                Text(
                  'A young woman, bullied to the point of deciding to drop out of school, plans the best way to get revenge. After becoming a primary school teacher, she takes in the son of the man who tormented her the most to enact her vengeance.',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 10),
                Text(
                  'Starring : Song Hye-kyo, Lee Do-hyun, Lim Ji-yeon',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  'Creators : Kim Eun-sook, An Gil-ho',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  'Genre : Revenge, Psychological Thriller',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ],
            ),
          )
        ],
      ),
    );}
}