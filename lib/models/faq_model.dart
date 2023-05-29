class FaqModel {
  FaqModel(this.locale, this.totalFAQ, this.listFAQ);

  factory FaqModel.fromJson(Map<String, dynamic> json) {
    return FaqModel(
      json['locale'] as String,
      json['totalFAQ'] as int,
      List<FaqItemModel>.from(
        (json['listFAQ'] as List<dynamic>)
            .map((item) => FaqItemModel.fromJson(item as Map<String, dynamic>)),
      ),
    );
  }

  final String locale;
  final int totalFAQ;
  final List<FaqItemModel> listFAQ;

  Map<String, dynamic> toJson() {
    return {
      'locale': locale,
      'totalFAQ': totalFAQ,
      'listFAQ': listFAQ,
    };
  }

  @override
  String toString() {
    return <String>[
      'FaqModel(',
      'locale: $locale, ',
      'totalFAQ: $totalFAQ',
      'listFAQ: $listFAQ)'
    ].join();
  }
}

class FaqItemModel {
  FaqItemModel(this.id, this.question, this.answer);

  factory FaqItemModel.fromJson(Map<String, dynamic> json) {
    return FaqItemModel(
      json['id'] as String,
      json['question'] as String,
      json['answer'] as String,
    );
  }

  final String id;
  final String question;
  final String answer;

  Map<String, dynamic> toJson() {
    return {
      'id': id, 
      'question': question,
      'answer': answer,
    };
  }

  @override
  String toString() {
    return <String>[
      'FaqItemModel(',
      'id: $id',
      'question: $question, ',
      'answer: $answer)'
    ].join();
  }
}
