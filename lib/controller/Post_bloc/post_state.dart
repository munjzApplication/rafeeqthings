part of 'post_bloc.dart';

class PostState extends Equatable {
  final List<Postmodel> postModelList;
  final List<Postmodel> tempModelList;
  final PostStatus postStatus;
  final String errorMessage;
  final String notFoundMessage;

  const PostState({
    this.tempModelList = const <Postmodel>[],
    this.postModelList = const <Postmodel>[],
    this.postStatus = PostStatus.loading,
    this.errorMessage = "",
    this.notFoundMessage = "",
  });
  PostState copyWIth(
      {String? errorMessage,
      String? notFoundMessage,
      PostStatus? postStatus,
      List<Postmodel>? tempModelList,
      List<Postmodel>? postModelList}) {
    return PostState(
        errorMessage: errorMessage ?? this.errorMessage,
        notFoundMessage: notFoundMessage ?? this.notFoundMessage,
        postStatus: postStatus ?? this.postStatus,
        postModelList: postModelList ?? this.postModelList,
        tempModelList: tempModelList ?? this.tempModelList);
  }

  @override
  List<Object> get props =>
      [errorMessage, postStatus, postModelList, notFoundMessage, tempModelList];
}
