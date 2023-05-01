import 'package:projector_loan/core.dart';
import 'package:projector_loan/presentation/shared/widget/loading/st_mid_content_card_loading.dart';

class StMidContent extends StatelessWidget {
  const StMidContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StHomeController controller = StHomeController.instance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            "Panduan",
            style: GoogleFonts.openSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 330,
          child: StreamBuilder(
            stream: controller.loanTermStream(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 2,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const StMidContentCardLoading();
                  },
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("Error: ${snapshot.error}"),
                );
              } else if (!snapshot.hasData) {
                return const Center(
                  child: Text("No Data"),
                );
              } else {
                final loanTerms = snapshot.data!.docs
                    .map((doc) => LoanTerm.fromFirestore(doc))
                    .toList();

                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: loanTerms.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final loanTerm = loanTerms[index];

                    return StMidContentCard(
                      title: loanTerm.title,
                      color: Color(int.parse("0xff${loanTerm.color}")),
                      onTap: () async {
                        showBigInfo(loanTerm: loanTerm);
                      },
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
