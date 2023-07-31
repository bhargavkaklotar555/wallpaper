import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scraper_wallpaper_app/controllers/wallpaper_api_provider.dart';

import '../../modals/myRoutes.dart';

class FavritePage extends StatelessWidget {
  const FavritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<APIControllers>(builder: (context, provider, _) {
          return GridView.builder(
            itemCount: provider.favrite.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    MyRoutes.wallpaper_detail_page,
                    arguments: provider.favrite[index],
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    provider.favrite[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
          );
        }),
      ),
    );
  }
}
