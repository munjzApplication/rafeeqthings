import 'package:bloc/bloc.dart';
import 'package:bloc_operations/model/post_mode.dart';
import 'package:bloc_operations/repository/post_repository.dart';
import 'package:bloc_operations/untils/enum/post_Enum.dart';
import 'package:equatable/equatable.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  List<Postmodel> tempList = <Postmodel>[];
  PostRepository postRepository = PostRepository();
  PostBloc() : super(const PostState()) {
    on<PostFetch>(_onPostFetch);
    on<FilterList>(_onFilterList);
  }

  void _onPostFetch(PostFetch event, Emitter<PostState> emit) async {
    emit(state.copyWIth(
      tempModelList: [],
      postStatus: PostStatus.loading,
      notFoundMessage: "",
    ));
    await postRepository.fetchPostList().then((value) {
      emit(state.copyWIth(
          postModelList: value,
          tempModelList: [],
          postStatus: PostStatus.success,
          errorMessage: "success"));
    }).onError((error, stackTrace) {
      emit(state.copyWIth(
          postStatus: PostStatus.failure, errorMessage: error.toString()));
    });
  }

  void _onFilterList(FilterList event, Emitter<PostState> emit) {
    if (event.searchValue.isEmpty) {
      emit(state.copyWIth(
        tempModelList: [],
        notFoundMessage: "",
      ));
    } else {
      tempList = state.postModelList
          .where((element) => element.id!
              .toString()
              .toLowerCase()
              .contains(event.searchValue.toLowerCase()))
          .toList();

      if (tempList.isEmpty) {
        emit(state.copyWIth(
          tempModelList: tempList,
          notFoundMessage: "not found",
        ));
      } else {
        emit(state.copyWIth(
          tempModelList: tempList,
          notFoundMessage: "",
        ));
      }
    }
  }
}
