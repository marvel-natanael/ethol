import 'package:ethol/theme.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget{
    @override
    State<StatefulWidget> createState() {
      return HomePageState();
  }
  
  }
class HomePageState extends State<HomePage>{
  int _current = 0;
  final CarouselController _controller = CarouselController();

  Widget build(BuildContext context){
    Widget appBar = AppBar(
      elevation: 0,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 18),
          child: Icon(Icons.info),
        )
      ],
    );

    Widget homeFeed = Container(
      decoration: BoxDecoration(
        color: blueColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 18, top: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Halo,\nMarvel!",
              style: heading1,
            ),
            Text(
              "Pilih mata kuliah anda di bawah ini",
              style: widgetText,
            )
          ],
        ),
      ),
    );

    Widget mataKuliah (String namaMataKuliah, String namaDosen, Color boxColor) {
      return Container(
      width: 324,
      height: 96,
      margin: EdgeInsets.fromLTRB(18, 12, 0, 12),
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.all(Radius.circular(8))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.only(left: 12, top: 12),
            child: Row(
              children: <Widget>[
                Icon(Icons.book, color: whiteColor,size: 20,),
                SizedBox(width: 8,),
                Text(namaMataKuliah, style: widgetText,)
                ],
              ),
            ),
            Container(
            margin: EdgeInsets.only(left: 12, top: 8),
            child: Row(
              children: <Widget>[
                Icon(Icons.person, color: whiteColor,size: 20,),
                SizedBox(width: 8,),
                Text(namaDosen, style: widgetText,)
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 6, top: 6),
              width: 75,
              height: 24,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              child: MaterialButton(
                padding: EdgeInsets.zero,
                onPressed: ()=>{},
                child: Text("Akses Kuliah", style: cardText,textAlign: TextAlign.center,)),
            ),
        ],
      ),
      );
    }

    final List <Widget> daftarKelas = [
      mataKuliah("Workshop Produksi Game 4", "Nama Dosen", greenColor),
      mataKuliah("Workshop Produksi Game 4", "Nama Dosen", pinkColor) ,
      mataKuliah("Workshop Produksi Game 4", "Nama Dosen", greenColor),
      mataKuliah("Workshop Produksi Game 4", "Nama Dosen", pinkColor),
      mataKuliah("Workshop Produksi Game 4", "Nama Dosen", greenColor),
      mataKuliah("Workshop Produksi Game 4", "Nama Dosen", pinkColor),
    ];

    Widget matKul = Column(
      children: [
        CarouselSlider(
          items: daftarKelas,
          carouselController: _controller,
          options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 3.25,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: daftarKelas.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: 6.0,
              height: 6.0,
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : blueColor)
                      .withOpacity(_current == entry.key ? 0.9 : 0.4)
                      ),
                ),
              );
            }
          ).toList(),
        ),
      ],
    );
    
    Widget myDrawer = Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
             DrawerHeader(
              decoration: BoxDecoration(
                color: blueColor
              ),
              child: Column(
                children: [
                  Text('Marvel Natanael S', style: drawerText,textAlign: TextAlign.left,),
                  SizedBox(height: 12,),
                  Icon(Icons.person, size: 64, color: whiteColor,),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.assignment_return_rounded, color: blueColor,),
              title: Text('UTS Online', style: heading2,),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.assignment_ind_rounded, color: blueColor,),
              title: Text('Mata Kuliah', style: heading2,),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.assessment, color: blueColor,),
              title: Text('Tugas Online', style: heading2,),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_today, color: blueColor,),
              title: Text('Jadwal Online', style: heading2,),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.question_answer_rounded, color: blueColor,),
              title: Text('FAQ', style: heading2,),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.ballot_sharp, color: blueColor,),
              title: Text('Kuisioner Analisa', style: heading2,),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app_rounded, color: blueColor,),
              title: Text('Keluar', style: heading2,),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
              },
            ),
          ],
        ),
      );

    Widget buttonListItem = MaterialButton(
      elevation: 12,
      onPressed: ()=>{},
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: new AssetImage('assets/ethol.png'),
            fit: BoxFit.scaleDown,
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 1,
              offset: Offset(0, 5),
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(8.0),),
          color: blueColor,
        ),
      ),
    );
    
    return Scaffold(
      backgroundColor: whiteColor,
      drawer: myDrawer,
      body: SafeArea(
        child: ListView(
          children: <Widget> [
            appBar,
            homeFeed,
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 64,
                  color: blueColor,
                ),
                Container(
                  child: matKul,
                ),
              ],
            ),
            GridView.count(
              scrollDirection: Axis.vertical,
              physics: ScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 24,
              shrinkWrap: true,
                children: List.generate(8, (index) {
                  return buttonListItem;
                },
              )
            )
          ],
        ),
      ),
    );
  }
}