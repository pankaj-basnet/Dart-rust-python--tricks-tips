void main(List<String> arguments) async {
  final streamOfLanguages = getLanguages();

  final stream2 = streamOfLanguages.asyncMap((language) {
    final futureLan = getCharacters(language);

    print(futureLan);
    return futureLan;
  });

  final futureOfLanguages = stream2.fold('', (previous, element) {
    final dotted = element.join('-');
    final added = '$previous 💻 $dotted';
    return added;
  });

  final connectedLanguages = await futureOfLanguages;
  print(connectedLanguages);
}

Stream<String> getLanguages() async* {
  yield 'rust';
  yield 'dart';
  yield 'python';
}

Future<List<String>> getCharacters(String language) async {
  final letters = <String>[];
  for (final char in language.split('')) {
    letters.add(char);
  }

  print(letters);
  return letters;
}

// Future<List<String>> getCharacters(String language) async {
//   final letters = language.split('');

//   print(letters);
//   return letters;
// }


/// OUTPUT
/// 
// [r, u, s, t]
// Instance of 'Future<List<String>>'
// [d, a, r, t]
// Instance of 'Future<List<String>>'
// [p, y, t, h, o, n]
// Instance of 'Future<List<String>>'
//  💻 r-u-s-t 💻 d-a-r-t 💻 p-y-t-h-o-n 


// D:\src_dev\flutter\DART-PYTHON-RUST--TIPS-AND-TRICKS-\code-\dartConcepts\asynchronous_generator__and__stream__asyncmap_.dart\bin\asynchronous_generator__and__stream__asyncmap_.dart
