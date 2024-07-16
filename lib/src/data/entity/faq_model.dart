import "dart:convert";

class FAQModel {
  FAQModel({required this.question, required this.answer});
  late String question;
  late String answer;
}

Faq faqFromJson(String str) => Faq.fromJson(json.decode(str));

String faqToJson(Faq data) => json.encode(data.toJson());

class Faq {

  Faq({
    this.success,
    this.data,
  });

  factory Faq.fromJson(Map<String, dynamic> json) => Faq(
    success: json["success"],
    data: json["data"] == null ? <Datum>[] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );
  final bool? success;
  final List<Datum>? data;

  Faq copyWith({
    bool? success,
    List<Datum>? data,
  }) =>
      Faq(
        success: success ?? this.success,
        data: data ?? this.data,
      );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {

  Datum({
    this.id,
    this.questionUz,
    this.questionEn,
    this.questionRu,
    this.answerUz,
    this.answerEn,
    this.answerRu,
    this.orderIndex,
    this.enable,
    this.question,
    this.answer,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    questionUz: json["questionUz"],
    questionEn: json["questionEn"],
    questionRu: json["questionRu"],
    answerUz: json["answerUz"],
    answerEn: json["answerEn"],
    answerRu: json["answerRu"],
    orderIndex: json["orderIndex"]?.toDouble(),
    enable: json["enable"],
    question: json["question"],
    answer: json["answer"],
  );
  final String? id;
  final String? questionUz;
  final String? questionEn;
  final String? questionRu;
  final String? answerUz;
  final String? answerEn;
  final String? answerRu;
  final double? orderIndex;
  final bool? enable;
  final String? question;
  final String? answer;

  Datum copyWith({
    String? id,
    String? questionUz,
    String? questionEn,
    String? questionRu,
    String? answerUz,
    String? answerEn,
    String? answerRu,
    double? orderIndex,
    bool? enable,
    String? question,
    String? answer,
  }) =>
      Datum(
        id: id ?? this.id,
        questionUz: questionUz ?? this.questionUz,
        questionEn: questionEn ?? this.questionEn,
        questionRu: questionRu ?? this.questionRu,
        answerUz: answerUz ?? this.answerUz,
        answerEn: answerEn ?? this.answerEn,
        answerRu: answerRu ?? this.answerRu,
        orderIndex: orderIndex ?? this.orderIndex,
        enable: enable ?? this.enable,
        question: question ?? this.question,
        answer: answer ?? this.answer,
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "questionUz": questionUz,
    "questionEn": questionEn,
    "questionRu": questionRu,
    "answerUz": answerUz,
    "answerEn": answerEn,
    "answerRu": answerRu,
    "orderIndex": orderIndex,
    "enable": enable,
    "question": question,
    "answer": answer,
  };
}

