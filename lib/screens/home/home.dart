import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map timezone = {};

  @override
  Widget build(BuildContext context) {
    this.timezone = this.timezone.isNotEmpty
        ? this.timezone
        : ModalRoute.of(context).settings.arguments;

    String bgImage = this.timezone['isDaytime'] ? 'day.png' : 'night.png';
    Color bgColor =
        this.timezone['isDaytime'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: 150.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0.0,
                    ),
                    onPressed: () async {
                      dynamic selectedTimezone =
                          await Navigator.pushNamed(context, '/location');
                      setState(() {
                        this.timezone = {
                          'time': selectedTimezone['time'],
                          'location': selectedTimezone['location'],
                          'flag': selectedTimezone['flag'],
                          'isDaytime': selectedTimezone['isDaytime'],
                        };
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.edit_location),
                        Text('Edit location'),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      this.timezone['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  this.timezone['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
