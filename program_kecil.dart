import 'dart:math';

bool isPrime(int n) {
  if (n <= 1) {
    return false;
  }
  for (int i = 2; i <= sqrt(n); i++) {
    if (n % i == 0) {
      return false;
    }
  }
  return true;
}

String fooBar(int n) {
  if (n % 3 == 0 && n % 5 == 0) {
    return "FooBar";
  } else if (n % 3 == 0) {
    return "Foo";
  } else if (n % 5 == 0) {
    return "Bar";
  } else {
    return n.toString();
  }
}

void main() {
  List<String> result = [];
  for (int i = 100; i >= 1; i--) {
    if (isPrime(i)) {
      continue;
    }
    result.add(fooBar(i));
  }
  
  print(result.join(", "));
}
