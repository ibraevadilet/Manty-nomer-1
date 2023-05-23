import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:manty_nomer_1/features/menu/data/models/manty_model.dart';
import 'package:shimmer/shimmer.dart';

class RecipeImage extends StatelessWidget {
  const RecipeImage(
    this.manty, {
    Key? key,
    this.imageRotationAngle = 0,
    this.imageSize,
    this.alignment = Alignment.center,
    this.hasShadow = true,
    this.shadowOffset,
  }) : super(key: key);

  final MantyModel manty;
  final double imageRotationAngle;
  final double? imageSize;
  final AlignmentGeometry alignment;
  final bool hasShadow;
  final Offset? shadowOffset;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Hero(
        tag: '__recipe_${manty.id}_image__',
        // Todo: MAYBE add a TweenAnimationBuilder for smoother animation??
        child: SizedBox(
          width: imageSize,
          height: imageSize,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned.fill(
                child: Transform.rotate(
                  angle: imageRotationAngle,
                  child: CachedNetworkImage(
                    imageUrl: manty.image,
                    placeholder: (_, url) {
                      return SizedBox(
                        width: imageSize,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.withOpacity(0.4),
                          highlightColor: Colors.white,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      );
                    },
                    imageBuilder: (_, imageProvider) {
                      return CachedNetworkImage(
                        imageUrl: manty.image,
                        width: imageSize,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
