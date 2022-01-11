


import 'package:workoutday/core/data/firestore_service.dart';
import 'package:workoutday/core/domain/repository/add_gymnastic_repository.dart';

class AddGymnasticRepositoryImpl implements AddGymnasticRepository {

  @override
  save(workoutId, gymnasticName) {
    DatabaseService databaseServiceForGymnastic = DatabaseService.gymnastics(workoutId: workoutId);
    databaseServiceForGymnastic.addGymnastic(name: gymnasticName);
  }

  @override
  delete(workoutId, idOfGymnastic) {
    DatabaseService databaseServiceForGymnastic = DatabaseService.gymnastics(workoutId: workoutId);
    databaseServiceForGymnastic.deleteGymnastic(idOfGymnastic: idOfGymnastic);
  }

}