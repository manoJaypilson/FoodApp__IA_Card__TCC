import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:ia_card/widgets/category.dart';


class CardPage extends StatefulWidget {
  @override
  _CardPageState createState() => _CardPageState();
}
class _CardPageState extends State<CardPage> {
  SearchBar searchBar;
  
  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
      toolbarHeight: 150,
      centerTitle: true,
      title: new Text('Restaurante', 
            style: GoogleFonts.passionOne(
            fontStyle: FontStyle.normal,
            fontSize: 40
            )),
      actions: [searchBar.getSearchAction(context)],
      backgroundColor: Color.fromRGBO(255, 161, 73, 1),
    );
  }  

  _CardPageState() {
    searchBar = new SearchBar(
      inBar: false,
      setState: setState,
      onSubmitted: print,
      buildDefaultAppBar: buildAppBar
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: searchBar.build(context),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Container(
       padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildVerticalSpace(),
          Text('Categorias', 
            style: GoogleFonts.metrophobic(
            fontStyle: FontStyle.normal,
            fontSize: 25
            )
          ),
          _buildVerticalSpace(),
          _buildCategory(),
          _buildVerticalSpace(),
          
          Text('Mais pedidos', 
            style: GoogleFonts.metrophobic(
            fontStyle: FontStyle.normal,
            fontSize: 25
            )
          ),
          _buildVerticalSpace(),
          _buildPedidos(),
        ],
      ),
    );

  }
    _buildCategory(){
      return Align(
        alignment: Alignment.center, 
      
        child: Wrap(
        spacing: 30, // gap between adjacent chips
        runSpacing: 20, // gap between lines
        children: <Widget>[
            Container(
              child: ChipCategory("Teste 1"),
         ),
            Container(
              child: ChipCategory("Teste 2"),
         ),
            Container(
              child: ChipCategory("Teste 3"),
         ),
            Container(
              child: ChipCategory("Teste 4"),
         ),
            Container(
              child: ChipCategory("Teste 5"),
         ),
            Container(
              child: ChipCategory("Teste 6"),
         ),
                                    
      
          
        ],
        ),
        );
    }
      _buildPedidos() {
      
    return Expanded(
      child: GridView.builder(
        itemCount:2,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          
        ),
        itemBuilder: _buildTile,
      ),
    );
  }
 Widget _buildTile(context, index) {
    return GestureDetector(
    // ///   onTap: () => _onMarkTile(index),
  

      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromRGBO(196, 196, 196, 1),
          ),
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
       
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Center(

        
          ),
        ),
      );
  }


    _buildVerticalSpace({double height = 40.0}) {
    return SizedBox(height: height);
  }
}

