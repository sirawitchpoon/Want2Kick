import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:want_2_kick/cells/hd_cell.dart';
import 'package:want_2_kick/cells/trd_cell.dart';
import 'package:want_2_kick/models/category.dart';
import 'package:want_2_kick/models/stadium.dart';
import 'package:want_2_kick/pages/detail_page.dart';
import 'package:want_2_kick/pages/initial_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late User user;
  Future<void> getUserData() async {
    User userData = FirebaseAuth.instance.currentUser!;
    setState(() {
      user = userData;
    });
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  List<Stadium> _hStadiums = [];
  List<Category> _categories = [];
  List<Stadium> _trStadiums = [];

  //Action

  _onCellTap(Stadium stadium) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(stadium: stadium),
        ));
  }

  //Life cycle methods

  @override
  void initState() {
    super.initState();
    getUserData();
    _hStadiums = _getStadiums();
    _categories = _getCategories();
    _trStadiums = _getTRStadium();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            _hStadiumsSection(),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // _categorySection(),
                  const SizedBox(
                    height: 32,
                  ),
                  // _trStadiumsSection(),
                  SizedBox(height: 200),
                  ElevatedButton.icon(
                    onPressed: () {
                      auth.signOut().then((value) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InitialPage()),
                        );
                      });
                    },
                    icon: Icon(Icons.logout),
                    label: Text('LOGOUT'),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Widget
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.grey[900],
      elevation: 0,
      title: Text(auth.currentUser!.email.toString()),
    );
  }

  /// Highlighted Stadium Section
  SizedBox _hStadiumsSection() {
    return SizedBox(
      height: 180,
      child: ListView.separated(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        itemCount: _hStadiums.length,
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(indent: 16),
        itemBuilder: (BuildContext context, int index) => HDCell(
          stadium: _hStadiums[index],
          onTap: () => _onCellTap(_hStadiums[index]),
        ),
      ),
    );
  }

  //Category Section
  // Column _categorySection() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: const [
  //       // const Text(
  //       //   'Available',
  //       //   style: TextStyle(
  //       //     color: Colors.white,
  //       //     fontSize: 18,
  //       //     fontWeight: FontWeight.w400,
  //       //   ),
  //       // ),
  //       // const SizedBox(
  //       //   height: 32,
  //       // ),
  //       // SizedBox(
  //       //   height: 100,
  //       //   child: ListView.separated(
  //       //     primary: false,
  //       //     shrinkWrap: true,
  //       //     scrollDirection: Axis.horizontal,
  //       //     itemCount: _categories.length,
  //       //     separatorBuilder: (BuildContext context, int index) =>
  //       //         Divider(indent: 16),
  //       //     itemBuilder: (BuildContext context, int index) =>
  //       //         CategoryCell(category: _categories[index]),
  //       //   ),
  //       // ),
  //     ],
  //   );
  // }

  ///Top Rated Stadium Section
  Column _trStadiumsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Top Rated Stadium',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        ListView.separated(
          primary: false,
          shrinkWrap: true,
          itemCount: _trStadiums.length,
          separatorBuilder: (BuildContext context, int index) => const Divider(
            thickness: 16,
            color: Colors.transparent,
          ),
          itemBuilder: (BuildContext context, int index) =>
              TrdCell(stadium: _trStadiums[index]),
        ),
      ],
    );
  }

  /// ****************************
  /// DUMMY DATA
  ///  ***************************

  //Get Highlighted Stadium List
  List<Stadium> _getStadiums() {
    List<Stadium> hStadiums = [];

    hStadiums.add(Stadium(
      name: 'Anfield',
      image: 'anfield.png',
      price: '800 Baht',
      rating: 5,
      location: 'Merseyside, England',
      capacity: '54K',
      opened: '1884',
    ));
    hStadiums.add(Stadium(
        name: 'Emirates',
        image: 'emirates.png',
        price: '500 Baht',
        rating: 4,
        location: 'London, England',
        capacity: '60K',
        opened: '2006'));
    hStadiums.add(Stadium(
        name: 'Ethihad',
        image: 'ethihad.png',
        price: '1000 Baht',
        rating: 4,
        location: 'Manchester, England',
        capacity: '55K',
        opened: '2003'));
    hStadiums.add(Stadium(
        name: 'King Power',
        image: 'kingpower.png',
        price: '900 Baht',
        rating: 4,
        location: 'Leister, England',
        capacity: '32K',
        opened: '2002'));

    return hStadiums;
  }

  //Get Categories
  List<Category> _getCategories() {
    List<Category> categories = [];
    categories
        .add(Category(icon: Icons.sports_soccer, title: 'Premier opened'));
    return categories;
  }

  //Get Top Rated Stadium List
  List<Stadium> _getTRStadium() {
    List<Stadium> trStadiums = [];
    trStadiums.add(Stadium(
      name: 'Anfield',
      image: 'anfield.png',
      price: '800 Baht',
      rating: 5,
      location: 'Merseyside, England',
      capacity: '70',
      opened: 'EPL',
    ));
    return trStadiums;
  }
}
