import 'package:projector_loan/core.dart';
import 'package:projector_loan/data/model/admin_home_category_model.dart';
import 'package:projector_loan/presentation/module/admin/adm_dashboard/widget/adm_menu_card.dart';
import 'package:projector_loan/presentation/shared/widget/loading/adm_home_category_loading.dart';

class AdmMenu extends StatelessWidget {
  const AdmMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AdmDashboardController controller = AdmDashboardController.instance;

    return Expanded(
      child: StreamBuilder(
        stream: controller.adminHomeCategoryStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const AdmHomeCategoryLoading();
          } else if (!snapshot.hasData) {
            return const NoDataImg();
          } else {
            final data = snapshot.data!;

            return GridView.builder(
              padding: const EdgeInsets.only(top: 10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 0.8,
              ),
              itemCount: data.docs.length,
              itemBuilder: (context, index) {
                final item = AdminHomeCategory.fromFirestore(data.docs[index]);
                return AdmMenuCard(
                  title: item.title,
                  icon: item.icon,
                  total: item.total,
                  color1: item.color1,
                  color2: item.color2,
                );
              },
            );
          }
        },
      ),
    );
  }
}
