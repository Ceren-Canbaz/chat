part of 'home_cubit.dart';

class HomeState extends Equatable {
  final UserApiModel currentUser;
  final List<UserApiModel> userList;
  const HomeState({
    required this.userList,
    required this.currentUser,
  });

  @override
  List<Object> get props => [currentUser, userList];

  HomeState copyWith({
    UserApiModel? currentUser,
    List<UserApiModel>? userList,
  }) {
    return HomeState(
      currentUser: currentUser ?? this.currentUser,
      userList: userList ?? this.userList,
    );
  }
}
