import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ClipPath(
            clipper: HalfCurveClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.39,
              color: const Color(0x80A2CFB6),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 10),
                  Center(
                    child: Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 10, color: Color(0x8050D98D)),
                      ),
                      child: const CircleAvatar(
                        radius: 45,
                        backgroundImage: NetworkImage(
                          "https://cdn-icons-png.flaticon.com/512/3135/3135715.png",
                        ),
                      ),
                    ),
                  ),
                  Center(child: Text("Emo Id : 877322")),
                  SizedBox(height: 90),
                  Card(
                    borderOnForeground: true,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white10, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    color: Colors.white,
                    elevation: 2,
                    child: Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 16,
                          ),
                          leading: Text(
                            "Name",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                            ),
                          ),
                          trailing: Text(
                            "Tausif Ali",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Divider(height: 1, color: Colors.black26),
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 16,
                          ),
                          leading: Text(
                            "Designation",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                            ),
                          ),
                          trailing: Text(
                            "Developer",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Divider(height: 1, color: Colors.black26),

                        ListTile(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 16,
                          ),
                          leading: Text(
                            "Mobile number",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                            ),
                          ),
                          trailing: Text(
                            "8873860144",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Divider(height: 1, color: Colors.black26),

                        ListTile(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 16,
                          ),
                          leading: Text(
                            "Email Id",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                            ),
                          ),
                          trailing: Text(
                            "tausif@gmail.com",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HalfCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height - 190);

    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 190,
    );

    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
