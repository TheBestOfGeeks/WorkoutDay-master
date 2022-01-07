import 'package:workoutday/core/domain/repository/add_exercise_repository.dart';

class AddExerciseUseCase {
  final AddExerciseRepository addExerciseRepository;

  AddExerciseUseCase(this.addExerciseRepository);

  bool addExercise(_nameOfExercise, _programs, _nameOfProgram) {
    bool _saveOrNotExercise = false;
    String _idOfProgram = '';
    for (var exOfProgram in _programs) {
      if (exOfProgram.name == _nameOfProgram) {
        _idOfProgram = exOfProgram.id!;
        addExerciseRepository.save(
          _nameOfExercise,
          _idOfProgram,
        );
        _saveOrNotExercise = true;
        break;
      }
    }
    ;
    return _saveOrNotExercise;
  }

  deleteExercise(_idOfExercise, _idOfProgram) {
    addExerciseRepository.delete(_idOfExercise, _idOfProgram);
  }
}
