import 'package:bloc_operations/controller/Post_bloc/post_bloc.dart';
import 'package:bloc_operations/model/post_mode.dart';
import 'package:bloc_operations/untils/enum/post_Enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScrrenPostApp extends StatefulWidget {
  const ScrrenPostApp({super.key});

  @override
  State<ScrrenPostApp> createState() => _ScrrenPostAppState();
}

class _ScrrenPostAppState extends State<ScrrenPostApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   
    context.read<PostBloc>().add(PostFetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Column(
        children: [
          BlocBuilder<PostBloc, PostState>(
            builder: (context, state) {
              return TextFormField(
                onChanged: (text) {
                  context.read<PostBloc>().add(FilterList(
                        searchValue: text,
                      ));
                },
              );
            },
          ),
          Expanded(
            child: BlocBuilder<PostBloc, PostState>(
              builder: (context, state) {
                switch (state.postStatus) {
                  case PostStatus.loading:
                    return const Center(child: CircularProgressIndicator());
                  case PostStatus.success:
                    if (state.notFoundMessage.isNotEmpty) {
                      return Center(
                          child: Text(state.notFoundMessage.toString()));
                    } else {
                      return ListView.separated(
                          itemBuilder: (context, index) {
                            if (state.tempModelList.isEmpty) {
                              Postmodel data = state.postModelList[index];
                              return Card(
                                  child: ListTile(
                                leading: CircleAvatar(
                                  child: Center(
                                    child: Text(data.id!.toString()),
                                  ),
                                ),
                                title: Text(data.name!),
                                subtitle: Text(data.body!),
                                // trailing: Text(data.body!),
                              ));
                            } else {
                              Postmodel data = state.tempModelList[index];
                              return Card(
                                  child: ListTile(
                                leading: CircleAvatar(
                                  child: Center(
                                    child: Text(data.id!.toString()),
                                  ),
                                ),
                                title: Text(data.name!),
                                subtitle: Text(data.body!),
                                // trailing: Text(data.body!),
                              ));
                            }
                          },
                          separatorBuilder: (context, index) =>
                              const Divider(),
                          itemCount: state.tempModelList.isEmpty
                              ? state.postModelList.length
                              : state.tempModelList.length);
                    }
                  case PostStatus.failure:
                    return Center(child: Text(state.errorMessage));
                }
              },
            ),
          ),
        ],
      )),
    );
  }
}
