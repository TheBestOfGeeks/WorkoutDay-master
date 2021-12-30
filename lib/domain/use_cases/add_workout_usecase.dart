




import 'package:workoutday/domain/repository/add_workout_repository.dart';

class AddWorkoutUsecase {

  final AddWorkoutRepository _addWorkoutRepository;

  AddWorkoutUsecase(this._addWorkoutRepository);


  saveWorkout (nameOfWorkout, dateOfWorkout, isDone) {
    _addWorkoutRepository.save(nameOfWorkout, dateOfWorkout, isDone);
  }

}