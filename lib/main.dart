import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var selectedFood = 'food';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children:<Widget>[
          Stack(children: <Widget>[
            Container(
              height:400.0,
            ),
            ShaderMask(shaderCallback: (rect){
              return LinearGradient( 
                begin:Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black,Colors.transparent]
              ).createShader(Rect.fromLTRB(0,0, rect.width,rect.height));
            },
            blendMode: BlendMode.dstIn,
            child:Image.asset(
              'assets/nairobi.jpg',
              height: 520.0,
              fit: BoxFit.cover,
            )
            ),
            RotatedBox(
                quarterTurns: 3,
                child: Text('NAIROBI',
                    style: TextStyle(
                        fontSize: 75,
                        fontWeight: FontWeight.bold,
                        color: Colors.white.withOpacity(0.3),
                        letterSpacing: 10.0)),
              ),
              Positioned(
                 top: 4.0,
                right: 4.0,
                child: Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white),
                  child: Center(
                    child: Icon(Icons.menu),
                  ),
                ),
              ),
            Positioned( 
              top:2.0,
              right:5.0,
              child: Container(
                height:12.0,
                width:12.0,
                decoration:BoxDecoration( 
                  borderRadius:BorderRadius.circular(6.0),
                  color:Colors.white
                )
              ),
            ),
             Positioned(
                  top: 200.0,
                  left: 40.0,
                  child: Column(
                    children: <Widget>[
                      Text('WELCOME TO',
                          style: GoogleFonts.oswald(
                              fontSize: 32.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white))
                    ],
                  )),
                   Positioned(
                  top: 235.0,
                  left: 40.0,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text('NAIROBI',
                              style: GoogleFonts.oswald(
                                  fontSize: 50.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFD3664))),
                          Text(',',
                              style: GoogleFonts.oswald(
                                  fontSize: 50.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          SizedBox(width: 10.0),
                          Text('KENYA',
                              style: GoogleFonts.oswald(
                                  fontSize: 50.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ],
                      )
                    ],
                  )),
                  Positioned(
                    top:320.0,
                    left:25.0,
                    right:25.0,
                    child:Container(
                      height:50.0,
                      decoration: BoxDecoration(
                        color:Color(0xff262626),
                        borderRadius:BorderRadius.only(
                          bottomRight:Radius.circular(15.0),
                          bottomLeft:Radius.circular(15.0),
                          topLeft:Radius.circular(15.0),
                          topRight:Radius.circular(15.0),
                        )
                      ),
                      child: TextField(
                        decoration:InputDecoration(
                          border:InputBorder.none,
                          hintText:'Search',
                          hintStyle:GoogleFonts.montserrat(
                            color:Colors.grey,
                            fontSize:15.0,
                          ),
                          contentPadding:EdgeInsets.only(top:15.0),
                          prefixIcon:Icon(Icons.search,color:Colors.grey)
                        )
                      ),
                    )
                  )
          ],
          ),

          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
              _buildMenuItem('Fastfood',Icons.fastfood),
              _buildMenuItem('Drinks',Icons.local_drink),
              _buildMenuItem('beer',Icons.local_drink),
            ]
          ),
          SizedBox(height:20.0),

          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
              _buildMenuItem('Cake',Icons.cake),
              _buildMenuItem('Coffee',Icons.local_drink),
              _buildMenuItem('Dining',Icons.restaurant),
            ]
          ),
           SizedBox(height:20.0),

          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
              _buildMenuItem('Cake',Icons.cake),
              _buildMenuItem('Coffee',Icons.local_drink),
              _buildMenuItem('Dining',Icons.restaurant),
            ]
          ),
         
        ]
      ),
    );
  }

  Widget _buildMenuItem(String foodName, iconData){
    return InkWell(splashColor:Colors.transparent,
    onTap:() {
      selectMenuOption(foodName);
          },
          child:AnimatedContainer(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeIn,
            height: selectedFood == foodName ? 11.0 : 75.0,
            width: selectedFood == foodName ? 11.0 : 75.0,
            color: selectedFood == foodName ? Color(0xfffd3566)
            :Colors.transparent,
            
            child: 
            Column(
              mainAxisAlignment:MainAxisAlignment.center , children:[
                Icon(
                  iconData,
                  color: selectedFood == foodName ? Colors.white : Colors.grey,
                  size:25.0,
                ),
                SizedBox(height:12.0),
                Text(foodName,
                style:GoogleFonts.montserrat(
                  color:selectedFood == foodName ? Colors.white: Colors.grey,
                  fontSize:10.0
                )),
                SizedBox(height:12.0),
                Text(foodName,
                style:GoogleFonts.montserrat(
                  color:selectedFood == foodName ? Colors.white : Colors.grey,
                  fontSize:10.0
                ))
              ]
            ),
            ),);
        }
      
        void selectMenuOption(String foodName) {
          setState(() {
            selectedFood = foodName; 
          });
        }
}