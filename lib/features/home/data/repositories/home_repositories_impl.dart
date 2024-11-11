import 'package:awesome_app/core/service/network_service.dart';
import 'package:awesome_app/features/home/data/datasources/home_remote_datasource.dart';

import '../../domain/repositories/home_repositories.dart';

class HomeRepositoriesImpl extends HomeRepositories {
  final NetworkService networkService;
  final HomeRemoteDatasource homeRemoteDatasource;

  HomeRepositoriesImpl(
      {required this.networkService, required this.homeRemoteDatasource});
}
