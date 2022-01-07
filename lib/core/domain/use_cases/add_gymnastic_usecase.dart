
import 'package:workoutday/core/domain/repository/add_gymnastic_repository.dart';

class AddGymnasticUseCase {

  AddGymnasticRepository addGymnasticRepository;

  AddGymnasticUseCase(this.addGymnasticRepository);

  saveGymnastic(workoutId, gymnasticName) {
    addGymnasticRepository.save(workoutId, gymnasticName);
  }


  deleteGymnastic(workoutId, idOfGymnastic) {
    addGymnasticRepository.delete(workoutId, idOfGymnastic);
  }
}