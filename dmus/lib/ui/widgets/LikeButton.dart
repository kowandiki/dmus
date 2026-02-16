import 'package:dmus/core/localstorage/dbimpl/TablePlaylist.dart';
import 'package:dmus/core/localstorage/dbimpl/TablePlaylistSong.dart';
import 'package:flutter/material.dart';

import '../../core/data/DataEntity.dart';

class LikeButton extends StatefulWidget {
  final Song songContext;

  const LikeButton({super.key, required this.songContext});

  @override
  State<StatefulWidget> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  @override
  Widget build(BuildContext context) {
    Song songContext = widget.songContext;

    return IconButton(
      icon: Icon(
        songContext.liked ? Icons.favorite : Icons.favorite_border,
        color: songContext.liked ? Colors.red : null,
      ),
      onPressed: () async {
        songContext.liked = !songContext.liked;

        if (songContext.liked) {
          TablePlaylistSong.appendSongToPlaylist(TablePlaylist.likedPlaylistId, songContext.id);
        } else {
          TablePlaylistSong.removeSongFromPlaylist(TablePlaylist.likedPlaylistId, songContext.id);
        }

        setState(() {});
      },
    );
  }
}
