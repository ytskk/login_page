import 'package:get/get.dart';
import 'package:training_and_testing/api/bonuses_api.dart';
import 'package:training_and_testing/models/models.dart';

class FaqScreenController extends GetxController {
  FaqScreenController(this._bonusesApi);

  final BonusesApi? _bonusesApi;
  final faqData = Rx<FaqModel?>(null);
  final isDataLoading = Rx<bool>(false);
  
  @override
  void onInit(){
    updateFaqData();
    super.onInit();
  }

  Future<void> updateFaqData() async {
    isDataLoading.value = true;

    faqData.value = await _bonusesApi?.apiGetRequests.getFAQ();

    isDataLoading.value = false;
  }
}
