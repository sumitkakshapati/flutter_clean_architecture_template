import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_template/core/bloc/common_state.dart';
import 'package:flutter_clean_architecture_template/features/splash/domain/entities/start_up_data.dart';

class StartUpCubit extends Cubit<CommonState> {
  StartUpCubit() : super(CommonInitialState());

  fetchData() async {
    emit(CommonLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    final data = StartUpData(isLoggedIn: false);
    emit(CommonSuccessState<StartUpData>(data: data));
  }
}
