class UnboardingContent {
  String image;
  String title;
  String description;

  UnboardingContent({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<UnboardingContent> contents = [
  UnboardingContent(
    image: "images/screen1.png",
    title: 'Select form out \n    Best Menu',
    description: 'Pick your food from your menu\n             More than 35 times',
  ),
  UnboardingContent(
    image: "images/screen2.png",
    title: 'Easy and Online Payment',
    description: 'You can pay cash on delivary and\n      Card Payment is available',
  ),
  UnboardingContent(
    image: "images/screen3.png",
    title: 'Quick delivery at your doorstep',
    description: 'Deliver food at your \n          Doorstep',
  ),
];
