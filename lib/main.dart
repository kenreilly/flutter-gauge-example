import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show debugDefaultTargetPlatformOverride;
import 'package:flutter_gauge_example/gauge/animated-gauge.dart';
import 'package:flutter_gauge_example/gauge/gauge-driver.dart';

void main() {

	debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
	runApp(GaugeDemo());
}

class GaugeDemo extends StatelessWidget {
	
	static const String _title = 'Flutter Gauge Example';

	@override
	Widget build(BuildContext context) {

		return MaterialApp(
			title: _title,
			theme: ThemeData(primarySwatch: Colors.indigo),
			home: MainPage(title: _title),
		);
	}
}

class MainPage extends StatefulWidget {

	MainPage({Key key, this.title}) : super(key: key);
	final String title;

	@override
	_MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

	GaugeDriver _driver = GaugeDriver();

	@override
	initState() {

		super.initState();
		_driver.listen((x) => setState(() { }) );
	}

	@override
	Widget build(BuildContext context) {
   
		return Scaffold(
			appBar: AppBar( title: Text(widget.title) ),
			backgroundColor: Colors.black,
			body: Center(child: AnimatedGauge(driver: _driver)),
			floatingActionButton: FloatingActionButton(
				onPressed: () => _driver.drive(1/10),
				child: Icon(_driver.maxed ? Icons.settings_backup_restore : Icons.offline_bolt),
				tooltip: _driver.maxed ? 'Reset' : 'Drive',
			), 
		);
	}
}