import 'package:flutter/material.dart';
import 'package:pb_sesi4/controller/auth_controller.dart';
import 'package:pb_sesi4/controller/feed_controller.dart';
import 'package:pb_sesi4/controller/home_controller.dart';
import 'package:pb_sesi4/model/data/photo.dart';
import 'package:pb_sesi4/model/data/profile_image.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final controller = Provider.of<AuthController>(
        context,
        listen: false,
      );
      controller.fetch();
    },);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<FeedController>();
    final homeController = context.watch<HomeController>();
    final authController = context.watch<AuthController>();

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: authController.user == null
          ? _buildLoginWidget(authController)
          : _buildProfileWidget(controller, homeController, authController),
        ),
        );
  }

  Center _buildLoginWidget(AuthController authController) {
    return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Please log in to continue!',
                style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 16,),
                ElevatedButton(
                  onPressed: () {
                    authController.login(User(
                      id: 'XYZ', 
                      username: 'Agatha', 
                      firstName: 'FirstName', 
                      name: 'lastName', 
                      profileImage: ProfileImage(
                        small: 'https://images.pexels.com/photos/27915633/pexels-photo-27915633/free-photo-of-a-woman-with-a-camera.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),  
                        ));
                  },
                  child: Text('login'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16, 
                    horizontal: 50)
                  ),)
            ],
          ),
        );
  }

  Column _buildProfileWidget(FeedController controller, HomeController homeController, AuthController authController) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(children: [
              SizedBox(
                  width: 120,
                  height: 120,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                        backgroundColor: Colors.grey.shade200,
                        backgroundImage: const NetworkImage(
                            'https://images.pexels.com/photos/27915633/pexels-photo-27915633/free-photo-of-a-woman-with-a-camera.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')),
                  )),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: FloatingActionButton.small(
                      backgroundColor: Colors.teal,
                      heroTag: const Key('home'),
                      onPressed: () {},
                      child: const Icon(Icons.edit, color: Colors.white)))
            ]),
            const Padding(
                padding: EdgeInsets.only(top: 12.0),
                child: Text(
                  'Widya Sabina',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )),
            Text(
              'Photographer',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.grey.shade500),
            ),
            const SizedBox(
              height: 30,
            ),
            listTile('My Membership', Icons.star_border_outlined),
            listTile('My Collection', Icons.bookmark_outline,
                trailing: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.black,
                  ),
                  child: Center(
                    child: Text(
                      controller.bookmarkedFeeds.length.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ), onTap: () {
              homeController.changeIndex(1);
            }),
            listTile(
              'Logout',
              Icons.logout,
              color: Colors.red,
              // onTap: () {authController.logout()},
            ),
          ],
        );
  }

  ListTile listTile(
    String title,
    IconData icon, {
    Color color = Colors.black,
    void Function()? onTap,
    Widget? trailing,
  }) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 14,
      ),
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: trailing,
    );
  }
}








// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }



// class _ProfilePageState extends State<ProfilePage> {
//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       final controller = Provider.of<AuthController>(
//         context,
//         listen: false,
//       );
//       controller.fetch();
//     });
//     super.initState();
//   }
//   Widget build(BuildContext context) {
//     final feedController = context.watch<FeedController>();
//     final authController = context.watch<AuthController>();
//     final homeController = context.watch<HomeController>();

//     return Scaffold(
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(30),
//         child: authController.user == null
//         ? _buildLoginWidget(authController)
//         : _buildProfileWidget(feedController, homeController, authController),
//       ),
//     );
//   }

//   Center _buildLoginWidget(AuthController authController) {
//     return Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//               Text('Please log in to continue!'),
//               ElevatedButton(
//                 onPressed: (){}
//                 authController.login(User(
//                   id: 'XYZ',

//                 )), 
//               child: const Text('Login'),
//               style: ElevatedButton.styleFrom(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 padding: const EdgeInsets.symmetric(vertical: 16,
//                 horizontal: 30)
//               ),
//               )
//           ],
//         ),
//       );
//   }

//   Column _buildProfileWidget(FeedController controller, HomeController homeController, AuthController authController) {
//     return Column(
//         children: [
//           const SizedBox(height: 40),
//           Stack(
//             alignment: Alignment.center,
//             children: [
//               CircleAvatar(
//                 radius: size.width * 0.2, // Responsif
//                 backgroundImage: const NetworkImage(
//                   'https://images.pexels.com/photos/28838879/pexels-photo-28838879/free-photo-of-fashionable-woman-posing-outdoors-by-gate.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
//                 ),
//               ),
//               Positioned(
//                 bottom: 0,
//                 right: size.width * 0.35, // Responsif
//                 child: FloatingActionButton(
//                   mini: true,
//                   backgroundColor: Colors.teal,
//                   onPressed: () {},
//                   child: const Icon(Icons.edit, color: Colors.white),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 20),
//           const Text(
//             'Widya Shabina',
//             style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//           ),
//           const Text(
//             'Traveler',
//             style: TextStyle(fontSize: 16, color: Colors.grey),
//           ),
//           const SizedBox(height: 30),
//           _buildProfileOption(
//             icon: Icons.star,
//             title: 'My Membership',
//             onTap: () {},
//           ),
//           _buildProfileOption(
//             icon: Icons.bookmark,
//             title: 'My Collection',
//             trailing: Container(
//               padding: const EdgeInsets.all(5),
//               decoration: const BoxDecoration(
//                 color: Colors.black,
//                 shape: BoxShape.circle,
//               ),
//               child: const Text(
//                 '24',
//                 style: TextStyle(color: Colors.white, fontSize: 12),
//               ),
//             ),
//             onTap: () {},
//           ),
//           _buildProfileOption(
//             icon: Icons.logout,
//             title: 'Logout',
//             iconColor: Colors.red,
//             onTap: () {
//               authController.logout();
//             },
//           ),
//         ],
//       );
//   }

//   Widget _buildProfileOption({
//     required IconData icon,
//     required String title,
//     Widget? trailing,
//     Color iconColor = Colors.black,
//     required VoidCallback onTap,
//   }) {
//     return ListTile(
//       leading: Icon(icon, color: iconColor),
//       title: Text(title),
//       trailing: trailing,
//       onTap: onTap,
//     );
//   }
// }
