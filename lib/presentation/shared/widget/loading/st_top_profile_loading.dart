import 'package:projector_loan/core.dart';
import 'package:projector_loan/presentation/shared/widget/loading/build_shimmer.dart';

class StTopProfileLoading extends StatelessWidget {
  const StTopProfileLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final circleAvatar = buildShimmer(
      child: const CircleAvatar(radius: 20),
    );

    final smallBox = buildShimmer(
      child: Container(
        height: 45,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(3),
        ),
      ),
    );

    final largeBox = buildShimmer(
      child: Container(
        height: 23,
        width: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(3),
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              circleAvatar,
              circleAvatar,
            ],
          ),
          const SizedBox(height: 25),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              largeBox,
              const SizedBox(height: 4),
              smallBox,
            ],
          ),
        ],
      ),
    );
  }
}
