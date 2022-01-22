

import '../repository/add_workout_repository.dart';

class AddWorkoutUsecase {
  final AddWorkoutRepository _addWorkoutRepository;

  AddWorkoutUsecase(this._addWorkoutRepository);

  saveWorkout({required String nameOfWorkout,required dateOfWorkout,required bool isDone,required String idOfParentProgram}) {
    _addWorkoutRepository.save(nameOfWorkout, dateOfWorkout, isDone, idOfParentProgram);
  }

  deleteWorkout(idOfWorkout) {
    _addWorkoutRepository.delete(idOfWorkout);
  }
}
