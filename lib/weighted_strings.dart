List<String> weightedStrings(String s, List<int> queries) {
  Set<int> weights = {};

  int calculateWeight(String char) {
    return char.runes
        .fold(0, (acc, charCode) => acc + charCode - 'a'.codeUnitAt(0) + 1);
  }

  for (int i = 0; i < s.length; i++) {
    String substring = '';
    int count = 0;

    for (int j = i; j < s.length; j++) {
      substring += s[j];
      count += calculateWeight(substring);

      weights.add(count);
    }
  }

  List<String> result =
      queries.map((query) => weights.contains(query) ? 'Yes' : 'No').toList();

  return result;
}

void main() {
  String inputString = 'abbcccd';
  List<int> queries = [1, 3, 9, 8];

  List<String> output = weightedStrings(inputString, queries);
  print('Output: $output');
}
