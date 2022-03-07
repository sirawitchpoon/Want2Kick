import 'package:flutter/material.dart';
import 'package:want_2_kick/cells/category_cell.dart';
import 'package:want_2_kick/cells/hd_cell.dart';
import 'package:want_2_kick/cells/trd_cell.dart';
import 'package:want_2_kick/models/category.dart';
import 'package:want_2_kick/models/stadium.dart';
import 'package:want_2_kick/pages/detail_page.dart';
import 'package:want_2_kick/utils/custom_icons_icons.dart';
import 'package:want_2_kick/utils/he_color.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            _hStadiumsSection(),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _categorySection(),
                  const SizedBox(
                    height: 32,
                  ),
                  _trStadiumsSection(),
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
      backgroundColor: Colors.white,
      elevation: 0,
      // brightness: Brightness.light,
      iconTheme: IconThemeData(color: HexColor('#150047')),
      leading: IconButton(
        icon: Icon(
          CustomIcons.menu,
          size: 14,
        ),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: Icon(
            CustomIcons.search,
            size: 20,
          ),
          onPressed: () {},
        ),
      ],
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
        padding: const EdgeInsets.symmetric(horizontal: 24),
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
  Column _categorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'League',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        SizedBox(
          height: 100,
          child: ListView.separated(
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: _categories.length,
            separatorBuilder: (BuildContext context, int index) =>
                Divider(indent: 16),
            itemBuilder: (BuildContext context, int index) =>
                CategoryCell(category: _categories[index]),
          ),
        ),
      ],
    );
  }

  ///Top Rated Stadium Section
  Column _trStadiumsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Top Rated Stadium',
          style: TextStyle(
            color: Colors.black,
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
      trophys: '70',
    ));
    hStadiums.add(Stadium(
        name: 'Emirates',
        image: 'emirates.png',
        price: '500 Baht',
        rating: 4,
        location: 'London, England',
        trophys: '63'));
    hStadiums.add(Stadium(
        name: 'Ethihad',
        image: 'ethihad.png',
        price: '1000 Baht',
        rating: 4,
        location: 'Manchester, England',
        trophys: '28'));
    hStadiums.add(Stadium(
        name: 'Camp Nou',
        image: 'campnou.png',
        price: '900 Baht',
        rating: 4,
        location: 'Barcelona, Spain',
        trophys: '65'));

    return hStadiums;
  }

  //Get Categories
  List<Category> _getCategories() {
    List<Category> categories = [];
    categories
        .add(Category(icon: Icons.sports_soccer, title: 'Premier League'));
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
      trophys: '70',
    ));
    return trStadiums;
  }
}
