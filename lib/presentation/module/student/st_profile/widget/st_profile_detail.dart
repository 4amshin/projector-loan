import 'package:projector_loan/core.dart';

class StProfileDetail extends StatelessWidget {
  const StProfileDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(
            16.0,
          ),
        ),
      ),
      child: Column(
        children: [
          StProfileDetailItem(
            iconUrl: 'user.svg',
            title: 'Detail Login',
            subTitle: 'Email Mahasiswa, Password',
            onTap: () {},
          ),
          Divider(
            height: 2,
            color: Colors.grey[200],
            thickness: 1.5,
          ),
          StProfileDetailItem(
            iconUrl: 'headphone.svg',
            title: 'Bantuan',
            subTitle: 'FAQs, Hubungi Administrator',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
