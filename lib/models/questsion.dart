class QuizQuestions{
  
  QuizQuestions({required this.question, required this.answers,required this.corcetanswer});

  final String question;
  final List<String> answers;
  final String corcetanswer;

// answers is the orginal list data
  //  make function take answer data and shuffle it

  List<String> shuffledAnswers() {
    // listof to make acopy from the original list
    // final shuffledlist=List.of(answers);
    final List<String> shuffledlist=answers;
    shuffledlist.shuffle();
    return shuffledlist;
    
  }


}