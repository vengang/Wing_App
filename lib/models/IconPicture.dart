class AppImages {
  AppImages._();
  // home icons
  static const String splashscreen = "lib/images/splash.png";
  static const String wingLogo = "lib/images/wing.png";
  static const String aboutimage = "lib/images/about_image.png";
  static const String wingLogo2 = "lib/images/wing2.png";
}

class LeanMore {
  String image;
  String title;
  LeanMore({required this.image, required this.title});
}

final List<LeanMore> pic = [
  LeanMore(image: "lib/images/learnmore/web.png", title: "Website"),
  LeanMore(image: "lib/images/learnmore/facebook.png", title: "Facebook"),
  LeanMore(image: "lib/images/learnmore/instagram.png", title: "Instagram"),
  LeanMore(image: "lib/images/learnmore/tiktok.png", title: "Tik Tok"),
  LeanMore(image: "lib/images/learnmore/youtube.png", title: "Youtube"),
];
