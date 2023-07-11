import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

import '../view_model/listchar_view_model.dart';

class ListChar extends StatefulWidget {
  const ListChar({super.key});

  @override
  State<ListChar> createState() => _ListCharState();
}

class _ListCharState extends State<ListChar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Char List"),
      ),
      body: ChangeNotifierProvider(
        create: (_) => ListCharViewModel(),
        child: Consumer<ListCharViewModel>(
          builder: (context, listCharViewModel, __) {
            if (listCharViewModel.images == null){
              listCharViewModel.fetchImages();
            }

            if (listCharViewModel.isLoading) {
              return const Center(child: CircularProgressIndicator(),);
            }

            if (listCharViewModel.errorMessage != null) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Errore'),
                    content: Text(listCharViewModel.errorMessage!),
                    actions: [
                      OutlinedButton(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            }

            return SingleChildScrollView(
              child: StaggeredGrid.count(
                crossAxisCount: 2,
                children: listCharViewModel.images!.map((e) =>
                    StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: listCharViewModel.images!.indexOf(e).isEven ? 2 : 1,
                        child: Container(
                          color: Colors.grey,
                          child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: "${listCharViewModel.images![listCharViewModel.images!.indexOf(e)]?.image?.medium}",
                            fit: BoxFit.cover,
                          ),
                        )
                    )
                ).toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}
