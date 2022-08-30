import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_starter/ui/widgets/stateless/post_tile/post_tile_view_model.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/models/album/album.dart';


import '../../../../core/models/post/post.dart';
import 'album_tile_view_model.dart';

/// A list tile for an article.
class AlbumTile extends StatelessWidget {
  final Album? album;
  final ValueChanged<Album> onChanged;

  const AlbumTile({this.album, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AlbumTileViewModel>.nonReactive(
      viewModelBuilder: () => AlbumTileViewModel(),
      onModelReady: (model) => model.init(album),
      builder: (context, model, child) => Card(
        margin: const EdgeInsets.only(left: 12, right: 12, top: 7, bottom: 7),
        elevation: 0.4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: () async {
            return onChanged(album!);
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Text(model.album!.title!))
            ],
          ),
        ),
      ),
    );
  }
}
