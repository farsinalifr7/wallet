import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:incexptracker/common/model/income_model.dart';

final incomeProvider =
    StateNotifierProvider<IncomeController, List<Income>>((ref) {
  return IncomeController([]);
});

class IncomeController extends StateNotifier<List<Income>> {
  IncomeController(super.state);

  List<Income> getIncomeList() {
    List<Income> list = [];
    return list;
  }

  void addNewIncome(Income income) {
    final list = state;
    list.add(income);
    state = [...list]; // rebuild happens here
  }

  void deleteIncome(Income income) {
    final list = state;
    list.removeWhere((element) => element.incomeId == income.incomeId);
    state = [...list]; // rebuild happens here
  }

  void updateIncome(Income income) {
    final list = state;
    final index = list.indexWhere((e) => e.incomeId == income.incomeId);
    list[index] = income;

    state = [...list]; // rebuild happens here
  }
}
