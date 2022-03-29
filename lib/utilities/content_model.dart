class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent({required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
    title: 'Use the app together',
    image: 'images/page1.png',
    discription: "Invite friends,family,or collegues and manage your joint expenses"
  ),
  UnbordingContent(
    title: 'Record Expenses',
    image: 'images/page2.png',
    discription: "The application will calculate your current balance,debts and debtors"
  ),
  UnbordingContent(
    title: 'Track Statistics',
    image: 'images/page1.png',
    discription: "Try to reduce the group balance to zero,it will help to  avoid unnecessary transfer"
  ),
];
