import 'question.dart';

class QuizBrain {
  int _questionnum = 0;
  List<Question> _questionbank = [
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('flutter is the best technology.', true),
    Question('A slug\'s blood is green.', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];
  void nextquestion() {
    if (_questionnum < _questionbank.length - 1) {
      _questionnum++;
    }
    print(_questionnum);
    print(_questionbank.length);
  }

  String getQuetionText() {
    return _questionbank[_questionnum].questiontext;
  }

  bool getcorrectAnswer() {
    return _questionbank[_questionnum].questionanswer;
  }

  bool isfinished() {
    if (_questionnum >= _questionbank.length - 1) {
      print('Now returning true');
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionnum = 0;
  }
}
