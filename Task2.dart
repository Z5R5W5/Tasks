import 'dart:io';

void main() {
  List<String> studentNames = [];
  List<List<double>> studentGrades = [];

  int numStudents = 0;
  while (true) {
    try {
      print("Enter number of students:");
      numStudents = int.parse(stdin.readLineSync()!);
      if (numStudents <= 0) throw Exception();
      break;
    } catch (e) {
      print("Invalid number, try again.");
    }
  }

  for (int i = 0; i < numStudents; i++) {
    print("\nEnter name of student ${i + 1}:");
    String name = stdin.readLineSync()!;
    studentNames.add(name);

    int numSubjects = 0;
    while (true) {
      try {
        print("Enter number of subjects:");
        numSubjects = int.parse(stdin.readLineSync()!);
        if (numSubjects <= 0) throw Exception();
        break;
      } catch (e) {
        print(" Invalid number, try again.");
      }
    }

    List<double> grades = [];
    for (int j = 0; j < numSubjects; j++) {
      while (true) {
        try {
          print("Enter grade for subject ${j + 1}:");
          double grade = double.parse(stdin.readLineSync()!);
          if (grade < 0 || grade > 100) throw Exception();
          grades.add(grade);
          break;
        } catch (e) {
          print("Invalid grade (0–100 only).");
        }
      }
    }

    studentGrades.add(grades);
  }

  while (true) {
    print("\n===== MENU =====");
    print("1. Show All Results");
    print("2. Search Student");
    print("3. Exit");

    String choice = stdin.readLineSync()!;

    if (choice == "1") {
      for (int i = 0; i < studentNames.length; i++) {
        double avg = average(studentGrades[i]);

        print("\nName: ${studentNames[i].toUpperCase()}");
        print("Average: ${avg.toStringAsFixed(2)}");
        print("Grade: ${getLetterGrade(avg)}");
      }
    } else if (choice == "2") {
      print("Enter student name to search:");
      String searchName = stdin.readLineSync()!;

      int index = studentNames.indexWhere(
        (name) => name.toLowerCase() == searchName.toLowerCase(),
      );

      if (index != -1) {
        double avg = average(studentGrades[index]);
        print("Average (rounded): ${avg.round()}");
      } else {
        print("Student not found.");
      }
    } else if (choice == "3") {
      print("Program terminated.");
      break;
    } else {
      print(" Invalid choice.");
    }
  }
}

double average(List<double> grades) {
  double sum = grades.reduce((a, b) => a + b);
  return sum / grades.length;
}

String getLetterGrade(double avg) {
  if (avg >= 85) return "A";
  if (avg >= 70) return "B";
  if (avg >= 50) return "C";
  return "F";
}
