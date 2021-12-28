

import 'package:workoutday/domain/repository/add_program_repository.dart';

class AddProgramUseCase {

  final AddProgramRepository addProgramRepository;

  AddProgramUseCase(this.addProgramRepository);
// сохраняет программу в бд, в методе реализована проверка по имени на уже существующую запись
 bool saveProgWithCheckDoubleName(nameOfProgram, programs, databaseService) {
   bool _doubleName = false;
   for (var exOfProgram in programs)
    {
      if (exOfProgram.name == nameOfProgram)
      {_doubleName = true;}
    }
    if (_doubleName == false) {
      addProgramRepository.save(nameOfProgram);  // databaseService.addProgram(nameOfProgram);
    }
    return _doubleName;
 }
//удаляет программу из бд по id
 deleteDocument(idOfProgram) {
   addProgramRepository.delete(idOfProgram);
 }
}



