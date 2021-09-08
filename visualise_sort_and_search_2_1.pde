import java.util.Random;

final int arraySize = 50;
final int maxValue = 200;

int[] array = new int[arraySize];
Random r = new Random();

// Selection sort variables
int i = 0;
int j = 0;
int minIdx = 0;
boolean finished = false;

void swap(int[] array, int i, int j) {
  int temp = array[i];
  array[i] = array[j];
  array[j] = temp;
}

void setup() {
  size(600, 300);
  background(150);
  for (int i = 0; i < arraySize; i++) {
    array[i] = r.nextInt(maxValue + 1);
  }
  
  // Selection sort code
  /*
  for (int i = 0; i < arraySize; i++) {
    int minIdx = i;
    for (int j = i; j < arraySize; j++) {
      if (array[j] < array[minIdx]) {
        minIdx = j;
      }
    }
    swap(array, i, minIdx);
  }
  */
  
}

void draw() {
  // Perform a step of selection sort
  if (!finished) {
    if (array[j] < array[minIdx]) {
      minIdx = j;  
    }
    j++;
    if (j >= arraySize) {
      swap(array, i, minIdx);
      i++;
      if (i < arraySize) {
        minIdx = i;
        j = i;
      } else {
        finished = true;
      }
    }
  }
  
  // Visualise the array
  background(150);
  int rectWidth = width / arraySize;
  for (int idx = 0; idx < arraySize; idx++) {
    if (idx < i) {
      fill(0, 255, 0);
    } else if (idx == i) {
      fill(50, 50, 255);
    } else if (idx == minIdx) {
      fill(255, 255, 0);
    } else if (idx == j) {
      fill(255, 0, 0);
    } else {
      fill(255);  
    }
    rect(idx * rectWidth, height - array[idx], rectWidth, array[idx]);
  }
}
