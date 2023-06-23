import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view_model/listpicture_view_model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

class ListPicture extends StatefulWidget {
  const ListPicture({super.key});

  @override
  State<ListPicture> createState() => _ListPictureState();
}

class _ListPictureState extends State<ListPicture> {
  ListPictureViewModel listPictureViewModel = ListPictureViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Picture List"),
      ),
      body: FutureBuilder(
        future: listPictureViewModel.fetchPictures(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          } else {
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
                            image: "${listPictureViewModel.pictures![listPictureViewModel.pictures!.indexOf(e)].downloadUrl}",
                            fit: BoxFit.cover,
                          ),
                        )
                    )
                ).toList(),
              ),
            );
          }
        },
      ),
    );
  }
}
