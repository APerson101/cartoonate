import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cartoonate/aliyun/repo.dart';

import 'loadprofile.dart';

class LoadprofileBloc extends Bloc<LoadprofileEvent, LoadprofileState> {
  LoadprofileBloc() : super(LoadprofileInitial()) {
    repository = Repository();
  }
  Repository repository;

  @override
  Stream<LoadprofileState> mapEventToState(
    LoadprofileEvent event,
  ) async* {
    if (event is LoadProfile) {
      yield LoadprofileSucess(repository.getUser());
    }

    if (event is Logout) {
      yield LogOut();
    }
  }
}
