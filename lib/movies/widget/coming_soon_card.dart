import 'package:film_place/theme/space.dart';
import 'package:flutter/material.dart';

class ComingSoonCard extends StatelessWidget {
  const ComingSoonCard({
    Key? key,
    required this.width,
    required this.height,
    required this.title,
    required this.imageUrl,
    required this.onPlayClick,
    required this.onOpenClick,
  }) : super(key: key);

  final double width;
  final double height;
  final String title;
  final String imageUrl;
  final VoidCallback onPlayClick;
  final VoidCallback onOpenClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                color:
                    Theme.of(context).colorScheme.background.withOpacity(0.1),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: FilmPlaceSpace.mediumLow,
                    vertical: FilmPlaceSpace.medium,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headline6,
                          maxLines: 1,
                        ),
                      ),
                      InkWell(
                        onTap: onOpenClick,
                        child: Icon(
                          Icons.send,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Center(
              // Replace this with a proper play button
              child: InkWell(
                onTap: onPlayClick,
                child: Icon(
                  Icons.play_circle,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
