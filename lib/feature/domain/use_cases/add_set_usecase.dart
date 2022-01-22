


import '../repository/add_set_repository.dart';

class AddSetUseCase {

  AddSetRepository _addSetRepository;

  AddSetUseCase(this._addSetRepository);

  addSet({required int weight,required int repetition,required String idOfWorkout,required String gymnasticId}) {
    _addSetRepository.addSet(weight: weight, repetition: repetition, gymnasticId: gymnasticId, idOfWorkout: idOfWorkout);
  }


  deleteSet({required String idOfSet,required String gymnasticId, required String idOfWorkout}) {
    _addSetRepository.deleteSet(idOfSet: idOfSet, gymnasticId: gymnasticId, idOfWorkout: idOfWorkout);
  }

}