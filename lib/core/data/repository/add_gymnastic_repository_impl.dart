


import 'package:workoutday/core/data/firestore_service.dart';
import 'package:workoutday/core/domain/repository/add_gymnastic_repository.dart';

class AddGymnasticRepositoryImpl implements AddGymnasticRepository {

  @override
  save(workoutId, gymnasticName) {
    DatabaseService databaseServiceForGymnastic = DatabaseService.workouts(workoutId: workoutId);
    databaseServiceForGymnastic.addGymnastic(gymnasticName);
  }

  @override
  delete(workoutId, idOfGymnastic) {
    DatabaseService databaseServiceForGymnastic = DatabaseService.workouts(workoutId: workoutId);
    databaseServiceForGymnastic.deleteGymnastic(idOfGymnastic);
  }

}