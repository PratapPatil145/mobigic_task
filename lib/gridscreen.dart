import 'package:flutter/material.dart';

import 'display_greed_screen.dart';

class GridScreen extends StatefulWidget {
  @override
  _GridScreenState createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  int rows = 0;
  int columns = 0;
  List<List<String>> grid = [];

  void createGrid() {
    grid.clear();
    for (int i = 0; i < rows; i++) {
      List<String> row = [];
      for (int j = 0; j < columns; j++) {
        row.add('');
      }
      grid.add(row);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Enter the number of rows and columns:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            TextField(
              onChanged: (value) {
                setState(() {
                  rows = int.tryParse(value) ?? 0;
                });
              },
             

              maxLength: 300,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                  counterText: '',
                  hintText: "Rows…",
                  hintStyle: TextStyle(
                    fontFamily: "Medium",
                    fontSize: 16,
                    color: Color(0xFF888888).withOpacity(0.65),
                  ),
                  labelText: "Enter th r0ws",
                  labelStyle: TextStyle(
                    fontFamily: "Medium",
                    fontSize: 16,
                    color: Color(0xFF888888).withOpacity(0.65),
                  ),
                  focusColor: Color(0xFF8D4007),
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF8D4007), width: 3),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF8D4007),
                    ),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF8D4007), width: 3),
                    borderRadius: BorderRadius.circular(50.0),
                ),
                  
            ),
            ),

            const SizedBox(height: 16),
            TextField(
               onChanged: (value) {
                setState(() {
                  columns = int.tryParse(value) ?? 0;
                });
              },
             

              maxLength: 300,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                  counterText: '',
                  hintText: "Column",
                  hintStyle: TextStyle(
                    fontFamily: "Medium",
                    fontSize: 16,
                    color: Color(0xFF888888).withOpacity(0.65),
                  ),
                  labelText: "Column",
                  labelStyle: TextStyle(
                    fontFamily: "Medium",
                    fontSize: 16,
                    color: Color(0xFF888888).withOpacity(0.65),
                  ),
                  focusColor: Color(0xFF8D4007),
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF8D4007), width: 3),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF8D4007),
                    ),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF8D4007), width: 3),
                    borderRadius: BorderRadius.circular(50.0),
                ),
                  
            ),
            ),

            
            SizedBox(height: 16),
            Container(decoration: BoxDecoration(color: Colors.red.withOpacity(0.75)),
              child: TextButton(
                onPressed: () {
                  createGrid();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DisplayGridScreen(grid)),
                  );
                },
                child: Text('Create Grid',style: TextStyle(fontSize: 20,color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
