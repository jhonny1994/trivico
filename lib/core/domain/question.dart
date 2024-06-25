class Question {
  Question({
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
    required this.allAnswers,
    this.solved = false,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    final incorrectAnswers = (json['incorrect_answers'] as List<dynamic>).map((x) => x as String).toList();
    final allAnswers = incorrectAnswers + [json['correct_answer'] as String]
      ..shuffle();

    return Question(
      question: json['question'] as String,
      correctAnswer: json['correct_answer'] as String,
      incorrectAnswers: incorrectAnswers,
      allAnswers: allAnswers,
    );
  }

  final List<String> allAnswers;
  final String correctAnswer;
  final List<String> incorrectAnswers;
  final String question;
  final bool solved;

  Question copyWith({
    String? question,
    String? correctAnswer,
    List<String>? incorrectAnswers,
    List<String>? allAnswers,
    bool? solved,
  }) =>
      Question(
        question: question ?? this.question,
        correctAnswer: correctAnswer ?? this.correctAnswer,
        incorrectAnswers: incorrectAnswers ?? this.incorrectAnswers,
        allAnswers: allAnswers ?? this.allAnswers,
        solved: solved ?? this.solved,
      );
}
