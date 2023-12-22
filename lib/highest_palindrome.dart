String highestPalindrome(String s, int k) {
  if (s.isEmpty) {
    return '-1';
  }

  List<int> diffIndices = [];
  int start = 0;
  int end = s.length - 1;

  while (start < end) {
    if (s[start] != s[end]) {
      diffIndices.add(start);
    }
    start++;
    end--;
  }

  if (diffIndices.length > k) {
    return '-1';
  }

  start = 0;
  end = s.length - 1;

  while (start <= end) {
    if (s[start] != s[end]) {
      if (k > 0) {
        s = s.replaceRange(start, start + 1, '9');
        s = s.replaceRange(end, end + 1, '9');
        k--;
      } else {
        int diffStart = diffIndices.first;
        int diffEnd = diffIndices.last;

        if (k >= 2 && (start == diffStart || end == diffEnd)) {
          s = s.replaceRange(start, start + 1, '9');
          s = s.replaceRange(end, end + 1, '9');
          k -= 2;
        }
      }
    }

    start++;
    end--;
  }

  return s;
}

void main() {
  String inputString = '3943';
  int k = 1;

  String output = highestPalindrome(inputString, k);

  print('Output: $output');
}
