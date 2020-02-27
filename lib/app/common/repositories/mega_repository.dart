import 'package:flutter_lottery/app/common/repositories/repository.dart';

class MegaRepository implements Repository {
  int gameNumber = 2222;
  double nextPot = 200000000.0;
  List<int> numbers = [7, 20, 38, 43, 45, 53];
}
