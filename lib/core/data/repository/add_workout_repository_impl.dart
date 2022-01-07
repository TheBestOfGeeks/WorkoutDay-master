import 'package:workoutday/core/domain/entities/entities/the_exercise.dart';
import 'package:workoutday/core/domain/repository/add_workout_repository.dart';

import '../firestore_service.dart';

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
