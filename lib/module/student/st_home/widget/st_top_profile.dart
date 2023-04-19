// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projector_loan/core.dart';

class StTopProfile extends StatelessWidget {
  const StTopProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StHomeController controller = StHomeController.instance;
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('students')
          .where("email", isEqualTo: controller.currentUser.email)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const StTopProfileLoading();
        }

        final doc = snapshot.data!.docs.first;
        // final email = doc.get('email') as String;
        final name = doc.get('name') as String;
        final imgUrl = doc.get('foto') as String;
        // final nim = doc.get('nim') as String;
        // final role = doc.get('role') as String;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    "assets/icons/dashboard-dot.svg",
                    height: 28,
                    colorFilter: const ColorFilter.mode(
                      Colors.black54,
                      BlendMode.srcIn,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.grey.withOpacity(0.5),
                    radius: 18,
                    child: WdCachedImage(
                      imgUrl: imgUrl,
                      size: 40,
                      borderRadius: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi, ",
                        style: GoogleFonts.openSans(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "$name!",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.openSans(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Selamat Bergabumg di Aplikasi Layanan Peminjaman Proyector LCD Kampus",
                    style: GoogleFonts.openSans(
                      height: 1.2,
                      fontSize: 14,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w400,
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
}
