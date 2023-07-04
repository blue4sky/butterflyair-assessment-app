import 'package:butterflyair_assessment_app/screens/no2_chart_screen.dart';
import 'package:butterflyair_assessment_app/screens/pm2.5_chart_screen.dart';
import 'package:butterflyair_assessment_app/screens/home_screen.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/pm_chart': (context) => const PMChartWidget(),
  '/no2_chart': (context) => const NO2ChartWidget(),
};
