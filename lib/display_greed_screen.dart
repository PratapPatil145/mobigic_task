import 'package:flutter/material.dart';

class DisplayGridScreen extends StatefulWidget {
  final List<List<String>> grid;

  DisplayGridScreen(this.grid);

  @override
  _DisplayGridScreenState createState() => _DisplayGridScreenState();
}

class _DisplayGridScreenState extends State<DisplayGridScreen> {
  late List<List<String>> grid;
  String searchText = 'pratap';
  late List<List<bool>> highlightedGrid;

  @override
  void initState() {
    super.initState();
    grid = widget.grid;
    highlightedGrid = List.generate(
      grid.length,
      (row) => List.generate(grid[row].length, (column) => false),
    );
  }

  void search() {
    resetHighlight();
    if (searchText.isEmpty) return;

    for (int row = 0; row < grid.length; row++) {
      for (int col = 0; col < grid[row].length; col++) {
        if (col + searchText.length <= grid[row].length) {
          bool match = true;
          for (int i = 0; i < searchText.length; i++) {
            if (grid[row][col + i].toLowerCase() !=
                searchText[i].toLowerCase()) {
              match = false;
              break;
            }
          }
          if (match) {
            for (int i = 0; i < searchText.length; i++) {
              highlightedGrid[row][col + i] = true;
            }
            continue;
          }
        }

        if (row + searchText.length <= grid.length) {
          bool match = true;
          for (int i = 0; i < searchText.length; i++) {
            if (grid[row + i][col].toLowerCase() !=
                searchText[i].toLowerCase()) {
              match = false;
              break;
            }
          }
          if (match) {
            for (int i = 0; i < searchText.length; i++) {
              highlightedGrid[row + i][col] = true;
            }
            continue;
          }
        }

        if (row + searchText.length <= grid.length &&
            col + searchText.length <= grid[row].length) {
          bool match = true;
          for (int i = 0; i < searchText.length; i++) {
            if (grid[row + i][col + i].toLowerCase() !=
                searchText[i].toLowerCase()) {
              match = false;
              break;
            }
          }
          if (match) {
            for (int i = 0; i < searchText.length; i++) {
              highlightedGrid[row + i][col + i] = true;
            }
            continue;
          }
        }
      }
    }
    setState(() {});
  }

  void resetHighlight() {
    highlightedGrid = List.generate(
      grid.length,
      (row) => List.generate(grid[row].length, (column) => false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Word Search'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter the search text:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              TextField(
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                  });
                },
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: search,
                child: Text('Search'),
              ),
              SizedBox(height: 16),
              Text(
                'Grid:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: grid[0].length,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                ),
                itemCount: grid.length * grid[0].length,
                itemBuilder: (context, index) {
                  int row = index ~/ grid[0].length;
                  int col = index % grid[0].length;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        searchText = grid[row][col];
                      });
                    },
                    child: Container(
                      color: highlightedGrid[row][col]
                          ? Colors.yellow
                          : Colors.white,
                      child: Center(
                        child: Text(
                          grid[row][col],
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            resetHighlight();
            searchText = '';
          });
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
