


import 'package:workoutday/core/data/firestore_service.dart';
import 'package:workoutday/core/domain/repository/add_set_repository.dart';

class AddSetRepositoryImpl implements AddSetRepository {

  @override
  addSet({required int weight, required int repetition, required String idOfWorkout, required String gymnasticId}) {
    DatabaseService  _dataBaseServiceForSet = DatabaseService.sets(gymnasticId: gymnasticId, workoutId:  idOfWorkout);
    _dataBaseServiceForSet.addSet(weight: weight, repetition: repetition);
  }

  @override
  deleteSet({required String idOfSet , required String idOfWorkout, required String gymnasticId}) {
    DatabaseService  _dataBaseServiceForSet = DatabaseService.sets(gymnasticId: gymnasticId, workoutId:  idOfWorkout);
    _dataBaseServiceForSet.deleteSet(idOfSet: idOfSet);
  }

}