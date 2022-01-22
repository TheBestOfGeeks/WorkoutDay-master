

import '../repository/add_exercise_repository.dart';

class AddExerciseUseCase {
  final AddExerciseRepository addExerciseRepository;

  AddExerciseUseCase(this.addExerciseRepository);

  bool addExercise({nameOfExercise, programs, nameOfProgram}) {
    bool _saveOrNotExercise = false;
    String _idOfProgram = '';
    for (var exOfProgram in programs) {
      if (exOfProgram.name == nameOfProgram) {
        _idOfProgram = exOfProgram.id!;
        addExerciseRepository.save(
          nameOfExercise,
          _idOfProgram,
        );
        _saveOrNotExercise = true;
        break;
      }
    }
    ;
    return _saveOrNotExercise;
  }

  deleteExercise({idOfExercise, idOfProgram}) {
    addExerciseRepository.delete(idOfExercise, idOfProgram);
  }
}
