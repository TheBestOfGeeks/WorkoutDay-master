




import '../../domain/repository/add_gymnastic_repository.dart';
import '../firestore_service.dart';

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