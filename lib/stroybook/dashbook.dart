import 'package:dashbook/dashbook.dart';
import 'package:flutter_revo_boilerplate/components/GreenContainer.dart';

class DashbookApp {
  Dashbook? _instance;
  Dashbook? get instance => _instance;

  Dashbook init () {
    if (instance == null){
      _instance = createDashbook();
    }

    return instance!;
  }

  Dashbook createDashbook() {
    final dashbook = Dashbook();

    dashbook
      .storiesOf('Container')
      .decorator(CenterDecorator())
      .add('green', (ctx) {
        return const GreenContainer();
      }
    );

    return dashbook;
  }
}