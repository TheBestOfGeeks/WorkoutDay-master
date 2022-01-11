
import 'package:workoutday/core/domain/repository/add_workout_repository.dart';

import '../firestore_service.dart';

class AddWorkoutRepositoryImpl implements AddWorkoutRepository {
  DatabaseService _databaseService = DatabaseService.empty();



  @override
  delete(idOfWorkout) {
    _databaseService.deleteWorkout(idOfWorkout: idOfWorkout);
  }

  @override
  save(nameOfWorkout, dateOfWorkout, isDone, idOfParentProgram) {
    _databaseService.addWorkout(nameOfWorkout: nameOfWorkout,dateOfWorkout:  dateOfWorkout,isDone:  isDone, idOfParentProgram: idOfParentProgram);
  }

}