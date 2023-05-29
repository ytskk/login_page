import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/controllers/controllers.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  final controller = Get.find<FaqScreenController>();

  @override
  void dispose() {
    Get.delete<FaqScreenController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'FAQ',
          style: Theme.of(context).textTheme.h3,
        ),
      ),
      body: Obx(() {
        final listFAQ = controller.faqData.value?.listFAQ;

        return Column(
          children: [
            SizedBox(
              height: 2,
              child: controller.isDataLoading.isTrue
                  ? const LinearProgressIndicator()
                  : null,
            ),
            if (listFAQ != null)
            Expanded(
              child: RefreshIndicator(
                onRefresh: controller.updateFaqData,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: padding16,
                    vertical: padding24,
                  ),
                  itemCount: controller.faqData.value?.totalFAQ,
                  itemBuilder: (context, index) {
                    return DropDownTextWidget(
                      title: listFAQ[index].question,
                      description: listFAQ[index].answer,
                    ).paddingOnly(bottom: padding16);
                  },
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
