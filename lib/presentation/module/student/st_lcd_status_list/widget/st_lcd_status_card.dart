// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:projector_loan/core.dart';
import 'package:projector_loan/data/model/lcd_data_model.dart';

class StLcdStatusCard extends StatelessWidget {
  final String status;
  const StLcdStatusCard({
    Key? key,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.all(15),
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("data_lcd")
            .where("status", isEqualTo: status)
            // .orderBy("lcd_name")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text("Error"));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.data!.docs.isEmpty) {
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

                return Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        offset: const Offset(5, 5),
                        blurRadius: 10,
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.greenAccent,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "Tersedia",
                            style: GoogleFonts.openSans(
                              fontSize: 10,
                              color: Colors.black45,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/lcd.svg',
                            height: 55,
                          ),
                          const SizedBox(height: 15),
                          Text(
                            item.lcdName,
                            style: GoogleFonts.openSans(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
