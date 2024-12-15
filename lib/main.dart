import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double manualRating = 0;
  double textFieldRating = 0;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27.0),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(bottom: 99)),

              SizedBox(
                height: 119,
                width: 119,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.cyanAccent,
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                  strokeWidth: 15,
                ),
              ),

              Padding(padding: EdgeInsets.only(bottom: 82)),

              Text('RateRider', textAlign: TextAlign.center),

              Padding(padding: EdgeInsets.only(bottom: 16)),

              RatingBar.builder(
                initialRating: manualRating,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    manualRating = rating;
                  });
                },
              ),

              Padding(padding: EdgeInsets.only(bottom: 82)),

              SizedBox(
                width: 342,
                height: 46,
                child: ElevatedButton(
                  onPressed: () {
                    // Action for button 1
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Text('Not done',
                  style: TextStyle(color: Colors.white),),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 36)),

              SizedBox(
                width: 342,
                height: 46,
                child: ElevatedButton(
                  onPressed: () {
                    // Action for button 2
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Text('Done',
                    style: TextStyle(color: Colors.white),),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 76)),

              RatingBarIndicator(
                rating: textFieldRating,
                itemCount: 5,
                itemSize: 30.0,
                direction: Axis.horizontal,
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 42)),

              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(),
                onSubmitted: (value) {
                  setState(() {
                    textFieldRating = double.tryParse(value) ?? 0;
                  });
                },
              ),
              Padding(padding: EdgeInsets.only(bottom: 50)),
            ],
          ),
        ),
      ),
    );
  }
}

class CircleProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        value: 0.7,
        strokeWidth: 6.0,
      ),
    );
  }
}