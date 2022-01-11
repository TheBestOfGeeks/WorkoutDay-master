import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:workoutday/core/domain/entities/entities/the_exercise.dart';
import 'package:workoutday/core/domain/entities/entities/the_gymnastic.dart';
import 'package:workoutday/core/domain/entities/entities/the_program.dart';
import 'package:workoutday/core/domain/entities/entities/the_set.dart';
import 'package:workoutday/core/domain/entities/entities/the_workout.dart';


class DatabaseService {

  static FirebaseAuth _auth = FirebaseAuth.instance;
  String uid = '';
  String programId = '';
  String workoutId = '';
  String gymnasticId = '';
  String setId = '';

  // обращение к коллекции users
  final CollectionReference _userCollection = FirebaseFirestore.instance.collection('userData');
  // обращение к коллекции programs
  final CollectionReference _programsCollection = FirebaseFirestore.instance.collection('userData').doc(_auth.currentUser!.uid.toString()).collection('programs');
  // обращение к коллекции workouts
  final CollectionReference _workoutCollection = FirebaseFirestore.instance.collection('userData').doc(_auth.currentUser!.uid.toString()).collection('workouts');
  // обращение к коллекции exercises
        CollectionReference exercisesCollection(){
    final CollectionReference _exercisesCollection = FirebaseFirestore.instance.collection('userData').doc(_auth.currentUser!.uid.toString()).collection('programs')
        .doc(programId).collection('exercises');
    return _exercisesCollection;}
  // обращение к коллекции gymnastics
   CollectionReference gymnasticCollection(){
    final CollectionReference _gymnasticCollection = _workoutCollection.doc(workoutId).collection('gymnastics');
    return _gymnasticCollection;}
// обращение к коллекции sets
  CollectionReference setsCollection() {
    final CollectionReference _setsCollection =   gymnasticCollection().doc(gymnasticId).collection('sets');
    return _setsCollection;
  }

  DatabaseService.empty();
// Конструктор принимающий uid пользователя для авторизации
  DatabaseService.user({required this.uid});
// Конструктор для методов exercises
  DatabaseService.exercises({required this.programId});
// Конструктор для методов gymnastic
  DatabaseService.gymnastics({required this.workoutId});
  // Конструктор для методов Collection
  DatabaseService.sets({required this.workoutId, required this.gymnasticId});


//-------------------------USER-----------------------------------

Future updateUserData({required String userEmail}) async {
  return await _userCollection.doc(uid).set({
    'userEmail': userEmail,
  });
}

//-------------------------PROGRAMS-----------------------------------



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
  Future addProgram({required String nameOfProgram}) async{
    return await _programsCollection.doc().set({
      'name': nameOfProgram,
    });
  }
  // Удаление программы из БД
  Future deleteProgram({required String idOfProgram}) async {
    return await _programsCollection.doc(idOfProgram).delete();
  }


//----------------------------EXERCISES---------------------------------------------




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
  Future addExercise({required String nameOfExercise}) async {
    return await exercisesCollection().doc().set(
      {
        'name': nameOfExercise,
      });
  }

  // Удаление упражнения в БД
  Future deleteExercise({required String idOfExercise}) async{
    return await exercisesCollection().doc(idOfExercise).delete();
  }



  //--------------------------WORKOUTS----------------------------------------





  // Добавление тренировки в БД
  Future addWorkout({required nameOfWorkout,required dateOfWorkout,required bool isDone, required String idOfParentProgram}) async{
    return await _workoutCollection.doc().set({
      'name': nameOfWorkout,
      'date': dateOfWorkout,
      'isDone': isDone,
      'idOfParentProgram': idOfParentProgram,
    });
  }

  // Возвращает из БД список тренировок
  List<TheWorkout> listOfWorkouts(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return TheWorkout(id: doc.id, name: doc.get('name') ?? 'Error name', date: doc.get('date'), isDone: doc.get('isDone'), idOfParentProgram: doc.get('idOfParentProgram'));
    }).toList();
  }

   //getter стрима, возвращает лист с текущими тренировками из бд
  Stream<List<TheWorkout>> get workouts {
    return _workoutCollection.snapshots()
        .map((listOfWorkouts));
  }
  // Удаление тренировки из БД
  Future deleteWorkout({required String idOfWorkout}) async {
    return await _workoutCollection.doc(idOfWorkout).delete();
  }


  //---------------------GYMNASTIC-------------------------------------


 // Добавление воркаут упражнения
  Future addGymnastic({required String name}) async {
    return await gymnasticCollection().doc().set(
        {'name': name
        });
  }
// Добавление воркаут упражнения
  Future deleteGymnastic({required String idOfGymnastic}) async {
    return await gymnasticCollection().doc(idOfGymnastic).delete();
  }

  // Возвращает из БД список тренировок
  List<TheGymnastic> listOfGymnastic(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return TheGymnastic(name: doc.get('name') ?? 'Error name', id: doc.id);
    }).toList();
  }

  Stream<List<TheGymnastic>> get gymnastic {
    return gymnasticCollection().snapshots()
        .map((listOfGymnastic));
  }



//---------------------GYMNASTIC-------------------------------------


// Добавление воркаут упражнения
Future addSet({required int weight, required int repetition}) async {
  return await setsCollection().doc().set(
      {'weight': weight,
        'repetition': repetition,
      });
}
// Добавление воркаут упражнения
Future deleteSet({required String idOfSet}) async {
  return await setsCollection().doc(idOfSet).delete();
}

// Возвращает из БД список тренировок
List<TheSet> listOfSets(QuerySnapshot snapshot) {
  return snapshot.docs.map((doc) {
    return TheSet(repetition: doc.get('repetition'),weight: doc.get('weight') , id: doc.id);
  }).toList();
}

Stream<List<TheSet>> get sets {
  return setsCollection().snapshots()
      .map((listOfSets));
}

}





