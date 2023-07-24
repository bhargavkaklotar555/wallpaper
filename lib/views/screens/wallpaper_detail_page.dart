import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter/material.dart';

class wallpaper_detail_page extends StatelessWidget {
  const wallpaper_detail_page({super.key});

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        actions: [
          PopupMenuButton(
            color: Colors.white,
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  onTap: () {
                    AsyncWallpaper.setWallpaper(
                      url: data['largeImageURL'],
                      goToHome: true,
                      wallpaperLocation: AsyncWallpaper.HOME_SCREEN,
                      errorToastDetails: ToastDetails.error(),
                      toastDetails: ToastDetails.success(),
                    );
                  },
                  child: Text("Home Screen"),
                ),
                PopupMenuItem(
                  onTap: () {
                    AsyncWallpaper.setWallpaper(
                      url: data['largeImageURL'],
                      goToHome: true,
                      wallpaperLocation: AsyncWallpaper.LOCK_SCREEN,
                      errorToastDetails: ToastDetails.error(),
                      toastDetails: ToastDetails.success(),
                    );
                  },
                  child: Text("Lock Screen"),
                ),
                PopupMenuItem(
                  onTap: () {
                    AsyncWallpaper.setWallpaper(
                      url: data['largeImageURL'],
                      goToHome: true,
                      wallpaperLocation: AsyncWallpaper.BOTH_SCREENS,
                      errorToastDetails: ToastDetails.error(),
                      toastDetails: ToastDetails.success(),
                    );
                  },
                  child: Text("Both"),
                ),
              ];
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        height: s.height,
        width: s.width,
        child: Stack(
          children: [
            Image.network(
              data['largeImageURL'],
              fit: BoxFit.fitHeight,
              height: double.infinity,
            ),
            Container(
              height: s.height,
              width: s.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/bg.png",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
