//BONUS 2 – Matching Brackets
void main() {
  String text = "[{(text)}]";
  matchBracket(text);
  // matchBracket("[{(tex]}]");
  if (matchBracket(text)) {
    print("Brackets are balanced.");
  } else {
    print("Brackets are not balanced.");
  }
}

bool matchBracket(String text) {
  List<String> textArray = text.split("");
  // print(textArray);
  List<String> openBracket = ['[', '{', '('];
  List<String> closeBracket = [']', '}', ')'];
  Map<String, String> bracket = {'[': ']', '{': '}', '(': ')'};
  // print(openBracket);
  // print(closeBracket);
  // print(bracket);
  List<String> textArrayOpen = [];
  List<String> inverseClose = [];
  for (var i = 0; i < textArray.length; i++) {
    for (var j = 0; j < openBracket.length; j++) {
      if (textArray[i] == openBracket[j]) {
        textArrayOpen.add(textArray[i]);
      } else if (textArray[i] == closeBracket[j]) {
        inverseClose.add(textArray[i]);
      }
    }
  }
  List<String> textArrayClose = inverseClose.reversed.toList();
  if (textArrayClose.length != textArrayOpen.length) {
    return false;
  }
  for (var i = 0; i < textArrayOpen.length; i++) {
    if (textArrayClose[i] != bracket[textArrayOpen[i]]) {
      return false;
    }
  }
  return true;
}
