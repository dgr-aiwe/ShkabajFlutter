import 'package:shkabaj_flutter/src/data/repository.dart';

class BallinaViewModel {
  Repository repository = new Repository();

  void loadData() {
    repository.loadData();
    repository.loadMoti();
  }
}