

import 'package:workoutday/domain/repository/add_program_repository.dart';

class SaveProgram {

  final AddProgramRepository addProgramRepository;

  SaveProgram(this.addProgramRepository);

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

 deleteDocument(idOfProgram) {
   addProgramRepository.delete(idOfProgram);
 }
}



