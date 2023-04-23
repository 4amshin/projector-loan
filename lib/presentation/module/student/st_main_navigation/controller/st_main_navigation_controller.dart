import 'package:projector_loan/core.dart';

class StMainNavigationController extends State<StMainNavigationView>
    implements MvcController {
  static late StMainNavigationController instance;
  late StMainNavigationView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  int selectedIndex = 0;

  onItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> widgetOptions = const [
    StHomeView(),
    StHistoryView(),
    StProfileView(),
  ];

  List<FlashyTabBarItem> navBarsItems() {
    return [
      tabBarItem(
        iconUrl: 'dashboard.svg',
        title: 'Beranda',
      ),
      tabBarItem(
        iconUrl: 'history.svg',
        title: 'History',
      ),
      tabBarItem(
        iconUrl: 'person.svg',
        title: 'Profil',
      ),
    ];
  }
}
