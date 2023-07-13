import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_revo_boilerplate/view_model/listpicture_view_model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class ListPicture extends StatefulWidget {
  const ListPicture({super.key});

  @override
  State<ListPicture> createState() => _ListPictureState();
}

class _ListPictureState extends State<ListPicture> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Picture List"),
      ),
      body: ChangeNotifierProvider(
        create: (_) => ListPictureViewModel(),
        child: Consumer<ListPictureViewModel>(
          builder: (context, listPictureViewModel, __) {
            if (listPictureViewModel.pictures == null && context.mounted){
              listPictureViewModel.fetchPictures();
            }

            if (listPictureViewModel.isLoading) {
              return const Center(child: CircularProgressIndicator(),);
            }

            if (listPictureViewModel.errorMessage != null) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Errore'),
                    content: Text(listPictureViewModel.errorMessage!),
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
                children: listPictureViewModel.pictures!.map((e) =>
                    StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: listPictureViewModel.pictures!.indexOf(e).isEven ? 2 : 1,
                        child: Container(
                          color: Colors.grey,
                          child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: "${listPictureViewModel.pictures![listPictureViewModel.pictures!.indexOf(e)].download_url}",
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
