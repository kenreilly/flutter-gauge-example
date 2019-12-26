import 'dart:async';

class GaugeDriver {

	GaugeDriver() { _controller = StreamController.broadcast(); }

	StreamController _controller;

	double _current = 0.0;

	bool get maxed => (_current > 0.99);

	void listen(Function x) { _controller.stream.listen(x); }

	void drive(double x) {

		_current = maxed ? 0 : (_current + x);
		_controller.add(_current);
	}
}