bool isBalanced(String s) {
  Map<String, String> bracketPairs = {'(': ')', '{': '}', '[': ']'};
  List<String> stack = [];

  for (int i = 0; i < s.length; i++) {
    String currentBracket = s[i];

    if (bracketPairs.keys.contains(currentBracket)) {
      stack.add(currentBracket);
    } else if (bracketPairs.values.contains(currentBracket)) {
      if (stack.isEmpty) {
        return false;
      }

      String lastOpenBracket = stack.removeLast();

      if (currentBracket != bracketPairs[lastOpenBracket]) {
        return false;
      }
    }
  }

  return stack.isEmpty;
}

void main() {
  String sample1 = '{[()]}';
  String sample2 = '{[(])}';
  String sample3 = '{(([])[ ])[ ]}';

  print('Sample 1: ${isBalanced(sample1) ? "YES" : "NO"}');
  print('Sample 2: ${isBalanced(sample2) ? "YES" : "NO"}');
  print('Sample 3: ${isBalanced(sample3) ? "YES" : "NO"}');
}
