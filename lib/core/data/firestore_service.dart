import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:workoutday/core/domain/entities/entities/the_exercise.dart';
import 'package:workoutday/core/domain/entities/entities/the_gymnastic.dart';
import 'package:workoutday/core/domain/entities/entities/the_program.dart';
import 'package:workoutday/core/domain/entities/entities/the_workout.dart';


class DatabaseService {

  static FirebaseAuth _auth = FirebaseAuth.instance;
  String uid = '';
  String programId = '';
  String workoutId = '';

  final CollectionReference _userCollection = FirebaseFirestore.instance.collection('userData');
  final CollectionReference _programsCollection = FirebaseFirestore.instance.collection('userData').doc(_auth.currentUser!.uid.toString()).collection('programs');
  final CollectionReference _workoutCollection = FirebaseFirestore.instance.collection('userData').doc(_auth.currentUser!.uid.toString()).collection('workouts');
        CollectionReference exercisesCollection(){
    final CollectionReference _exercisesCollection = FirebaseFirestore.instance.collection('userData').doc(_auth.currentUser!.uid.toString()).collection('programs')
        .doc(programId).collection('exercises');
    return _exercisesCollection;
  }
   CollectionReference gymnasticCollection(){
    final CollectionReference _gymnasticCollection = FirebaseFirestore.instance.collection('userData').doc(_auth.currentUser!.uid.toString()).collection('workouts')
        .doc(workoutId).collection('gymnastics');
    return _gymnasticCollection;
  }


  DatabaseService();
// Конструктор принимающий uid пользователя для авторизации
  DatabaseService.user({required this.uid});
// Конструктор принимающий имя программы для метода exercisesCollection
  DatabaseService.programs({required this.programId});
// Конструктор принимающий имя программы для метода gymnasticCollection
  DatabaseService.workouts({required this.workoutId});


//------------------------------------------------------------

Future updateUserData(String userEmail) async {
  return await _userCollection.doc(uid).set({
    'userEmail': userEmail,
  });
}
// Возвращает из БД список программ
List<TheProgram> listOfPrograms(QuerySnapshot snapshot) {
  return snapshot.docs.map((doc){
    return TheProgram(name: doc.get('name') ?? 'Error name', id: doc.id);
  }).toList();
}
  //getter стрима, возвращает лист с текущими программами из бд
  Stream<List<TheProgram>> get programs {
    return _programsCollection.snapshots()
        .map((listOfPrograms));
  }
// Добавление программы в БД
  Future addProgram(String nameOfProgram) async{
    return await _programsCollection.doc().set({
      'name': nameOfProgram,
    });
  }
  // Удаление программы из БД
  Future deleteProgram(String idOfProgram) async {
    return await _programsCollection.doc(idOfProgram).delete();
  }


//-------------------------------------------------------------------------




// Возвращает из БД список упражнений
  List<TheExercise> listOfExercise(QuerySnapshot snapshot) {
  return snapshot.docs.map((doc) {
   return TheExercise(name: doc.get('name') ?? '', id: doc.id);
  }).toList();
}

//getter стрима, возвращает лист с текущими упражнениями из бд
  Stream<List<TheExercise>> get exercises {
    return exercisesCollection().snapshots()
        .map((listOfExercise));
  }


// Добавление упражнения в БД
  Future addExercise(String nameOfExercise) async {
    return await exercisesCollection().doc().set(
      {
        'name': nameOfExercise,
      });
  }

  // Удаление упражнения в БД
  Future deleteExercise(String idOfExercise) async{
    return await exercisesCollection().doc(idOfExercise).delete();
  }



  //------------------------------------------------------------------





  // Добавление тренировки в БД
  Future addWorkout(nameOfWorkout, dateOfWorkout, bool isDone) async{
    return await _workoutCollection.doc().set({
      'name': nameOfWorkout,
      'date': dateOfWorkout,
      'isDone': isDone,
    });
  }

  // Возвращает из БД список тренировок
  List<TheWorkout> listOfWorkouts(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return TheWorkout(id: doc.id, name: doc.get('name') ?? 'Error name', date: doc.get('date'), isDone: doc.get('isDone'));
    }).toList();
  }

   //getter стрима, возвращает лист с текущими тренировками из бд
  Stream<List<TheWorkout>> get workouts {
    return _workoutCollection.snapshots()
        .map((listOfWorkouts));
  }
  // Удаление тренировки из БД
  Future deleteWorkout(String idOfWorkout) async {
    return await _programsCollection.doc(idOfWorkout).delete();
  }


  //----------------------------------------------------------


 // Добавление воркаут упражнения
  Future addGymnastic(String name) async {
    return await gymnasticCollection().doc().set(
        {'name': name
        });
  }
// Добавление воркаут упражнения
  Future deleteGymnastic(String idOfGymnastic) async {
    return await gymnasticCollection().doc(idOfGymnastic).delete();
  }

  // Возвращает из БД список тренировок
  List<TheGymnastic> listOfGymnastic(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return TheGymnastic(name: doc.get('name') ?? 'Error name');
    }).toList();
  }

  Stream<List<TheGymnastic>> get gymnastic {
    return gymnasticCollection().snapshots()
        .map((listOfGymnastic));
  }

}





