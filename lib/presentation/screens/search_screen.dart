import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/cubits/search_cubit.dart';
import 'package:untitled/models/search_model.dart';
import 'package:untitled/presentation/screens/widgets/custom_text_field.dart';

import '../../cubits/products_cubit.dart';
import '../../cubits/search_state.dart';
import '../../models/cart_added_model.dart';
import '../../shared/styles.dart';
class SearchResultsScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  var searchController = TextEditingController();

  SearchResultsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {
          if (state is SearchLoading) {
            // Perform any necessary actions when loading
          } else if (state is SearchError) {
            // Handle the error state
            print(state.error);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      CustomFormTextField(
                        icon: FeatherIcons.search,
                        onChanged: (String text) {
                          BlocProvider.of<SearchCubit>(context).Search(text);
                        },
                      ),
                      SizedBox(height: 15),
                      if (state is SearchLoading) ...[
                        LinearProgressIndicator(),
                        SizedBox(height: 15),
                      ],
                      if (state is SearchSuccess) ...[
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) =>
                                SearchResultCard(
                                SearchCubit.get(context).model!.data.data[index],
                                  context,
                                ),
                            itemCount: SearchCubit.get(context).model!.data.data.length,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget SearchResultCard(Datum model, context) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xff262626),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              model.image,
              width: 130,
              height: 100,
            ),
            SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name,
                    maxLines: 2,
                    style: getRegularStyle(color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    model.price.toString(),
                    style: getRegularStyle(color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    model.description,
                    style: getRegularStyle(color: Colors.white),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );}