import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';

import '../model/student_model.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

addStudent(StudentModel model) {
  final box = Hive.box<StudentModel>('student_box');
  studentListNotifier.value.add(model);
  box.add(model);
  studentListNotifier.notifyListeners();
}

updateStudent(int index, StudentModel model) {
  final box = Hive.box<StudentModel>('student_box');
  studentListNotifier.value.removeAt(index);
  studentListNotifier.value.insert(index, model);
  box.putAt(index, model);
  studentListNotifier.notifyListeners();
}

removeStudent(int index) {
  final box = Hive.box<StudentModel>('student_box');
  studentListNotifier.value.removeAt(index);
  box.deleteAt(index);
  studentListNotifier.notifyListeners();
}

getAllStudent() {
  final box = Hive.box<StudentModel>('student_box');
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(box.values);
}
