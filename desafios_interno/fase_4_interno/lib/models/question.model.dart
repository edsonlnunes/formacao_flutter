import 'package:hive/hive.dart';

part 'question.model.g.dart';

@HiveType(typeId: 2)
class Question {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String question;
  @HiveField(2)
  final String answer;

  Question({
    required this.id,
    required this.question,
    required this.answer,
  });
}
