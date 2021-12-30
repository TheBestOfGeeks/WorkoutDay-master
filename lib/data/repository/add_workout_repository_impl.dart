


import 'package:workoutday/data/services/firestore_service.dart';

import 'package:workoutday/domain/repository/add_workout_repository.dart';

class AddWorkoutRepositoryImpl implements AddWorkoutRepository {

  DatabaseService _databaseService = DatabaseService();

  @override
  save(nameOfWorkout, dateOfWorkout, isDone) {
    _databaseService.addWorkout(nameOfWorkout, dateOfWorkout, isDone);
  }

  @override
  delete(idOfWorkout) {
    _databaseService.deleteWorkout(idOfWorkout);
  }

}