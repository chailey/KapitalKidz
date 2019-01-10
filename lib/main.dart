import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
void main() => runApp(MyApp());
final GlobalKey<AnimatedCircularChartState> _chartKey = new GlobalKey<AnimatedCircularChartState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: FrontPage(),
    );
  }
}

class FrontPage extends StatefulWidget {
  @override
  FrontPageState createState() => new FrontPageState();
}

class FrontPageState extends State<FrontPage> {
  Widget hamburger() {
    return new Drawer(
        child: new ListView(
      children: <Widget>[
        new DrawerHeader(
          child: new Text('Header'),
        ),
        new ListTile(
          title: new Text('Log Out'),
          onTap: () {},
        ),
        new ListTile(
          title: new Text('Parental Settings'),
          onTap: () {},
        ),
        new ListTile(
          title: new Text('Educate Me'),
          onTap: () {},
        ),
      ],
    ));
  }

  //The logo seen
  Widget logo() {
    return Column(children: [
    DecoratedBox(
    decoration: BoxDecoration(
    image: DecorationImage(
        image: AssetImage('kkidz.PNG'),
    // ...
    ),
    // ...
    ),
    )
    ]);
  }


  Widget createCircularChart()
  {
    return new AnimatedCircularChart(
      key: _chartKey,
      size: Size(200, 200),
      initialChartData: <CircularStackEntry>[
        new CircularStackEntry(
          <CircularSegmentEntry>[
            new CircularSegmentEntry(
              33.33,
              Colors.lightGreen[400],
              rankKey: 'completed',
            ),
            new CircularSegmentEntry(
              66.67,
              Colors.grey[600],
              rankKey: 'remaining',
            ),
          ],
          rankKey: 'progress',
        ),
      ],
      chartType: CircularChartType.Radial,
      percentageValues: true,
      holeLabel: '5',
      labelStyle: new TextStyle(
        color: Colors.blueGrey[600],
        fontWeight: FontWeight.bold,
        fontSize: 24.0,
      ),
    );
  }

  //The whole level status area, including the pokemon-go style bar and emoji and balance due date
  Widget levelStatus() {
    return Column(children: [
      createCircularChart()
    ]);
  }

  //The user information, including available cash, payment due, and paycheck due
  Widget userCashInfo() {
    return Column(children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Container(
          child: Text(
            "Available Cash: ",
          ),
        ),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Container(
          child: Text(
            "Payment Due: ",
          ),
        ),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Container(
          child: Text(
            "Paycheck: ",
          ),
        ),
      ),
    ]);
  }

  //The payment button
  Widget payButton() {
    return Column(children: []);
  }

  Widget creditBar() {
    return Container(
      child: LinearProgressIndicator(
        value: 0.3,
        backgroundColor: Colors.red,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KapitalKidz'),
      ),
      drawer: hamburger(),
      body: widgetList(),
    );
  }

  Widget widgetList() {
    return new Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(children: [
          logo(),
          levelStatus(),
          creditBar(),
          userCashInfo(),
          payButton()
        ]));
  }
}






