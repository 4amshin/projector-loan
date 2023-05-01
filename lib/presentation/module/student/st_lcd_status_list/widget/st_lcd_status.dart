// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:projector_loan/core.dart';
import 'package:projector_loan/presentation/module/student/st_lcd_status_list/widget/st_lcd_status_card.dart';

class StLcdStatus extends StatelessWidget {
  final String status;
  const StLcdStatus({
    Key? key,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StLcdStatusListController controller = StLcdStatusListController.instance;
    return SafeArea(
      minimum: const EdgeInsets.all(15),
      child: StreamBuilder(
        stream: controller.dataLcdStream(status: status),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.data!.docs.isEmpty) {
            log("No Data");
            return const NoDataImg();
          } else {
            final data = snapshot.data!;

            return GridView.builder(
              itemCount: data.docs.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 25,
                mainAxisSpacing: 10.0,
              ),
              itemBuilder: (context, index) {
                late final LCDData item =
                    LCDData.fromFirestoreMap(data.docs[index].data());

                return StLcdStatusCard(
                  status: status,
                  lcdName: item.lcdName,
                );
              },
            );
          }
        },
      ),
    );
  }
}
