import 'dart:math';

class RandomUtils {
  int getRandomNumber(int min, int max) {
    final random = Random();
    return min + random.nextInt((max + 1) - min);
  }
}
