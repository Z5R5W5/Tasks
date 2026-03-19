void main() {
  // Part 1: Student Names
  Set<String> students = {"Ali", "Mona"};

  addStudent(students, "Omar");
  addStudent(students, "Ali");

  print("Students (Lambda):");
  students.forEach((s) => print(s));

  print("\nStudents (Recursion):");
  printStudentsRecursively(students.toList(), 0);

  // Spread Operator
  Set<String> newStudents = {"Sara", "Hassan"};
  students = {...students, ...newStudents};

  print("\nMerged Students:");
  students.forEach((s) => print(s));

  // Part 2: Student Courses
  Map<String, List<double>> studentCourses = {};

  addCourse(studentCourses, "Ali", "Math", 80);
  addCourse(studentCourses, "Ali", "Science", 90);
  addCourse(studentCourses, "Mona", "Math");

  print("\nAverages:");
  students.forEach((student) {
    double avg = averageGrade(studentCourses, student);
    print("$student: $avg");
  });
}

// Part 1 Functions
void addStudent(Set<String> students, String name) {
  students.add(name);
}

void printStudentsRecursively(List<String> list, int index) {
  if (index >= list.length) return;
  print(list[index]);
  printStudentsRecursively(list, index + 1);
}

// Part 2 Functions
void addCourse(
  Map<String, List<double>> map,
  String student,
  String course, [
  double grade = 0,
]) {
  map.putIfAbsent(student, () => []);
  map[student]!.add(grade);
}

double averageGrade(Map<String, List<double>> map, String student) {
  var grades = map[student];
  if (grades == null || grades.isEmpty) return 0;

  double sum = grades.reduce((a, b) => a + b);
  return sum / grades.length;
}
