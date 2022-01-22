




import '../../domain/repository/add_set_repository.dart';
import '../firestore_service.dart';

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