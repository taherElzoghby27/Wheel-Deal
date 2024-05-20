import 'package:cars/core/errors/failure_message.dart';
import 'package:cars/core/usecases/use_case.dart';
import 'package:cars/features/home/domain/entities/brand_entity.dart';
import 'package:cars/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class GetTopBrandsUseCase extends BaseUseCase<List<BrandEntity>, int> {
  final HomeRepo _homeRepo;

  GetTopBrandsUseCase({required HomeRepo homeRepo}) : _homeRepo = homeRepo;

  @override
  Future<Either<FailureServ, List<BrandEntity>>> call(int parameter) async {
    return await _homeRepo.getTopBrands(page: parameter);
  }
}
