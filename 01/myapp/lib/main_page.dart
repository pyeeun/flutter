import 'package:flutter/material.dart';

class StatelessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Taste'),
          leading: Icon(Icons.favorite, color: Colors.red),

          // 우측 팝업 버튼
          actions: <Widget>[
            PopupMenuButton<String>(
              icon: Icon(Icons.sort),
              onSelected: (value) {
                if (value == 'like')
                  print('좋아요순');
                else if (value == 'star')
                  print('별점순');
                else if (value == 'review')
                  print('리뷰순');
                else if (value == 'new') print('최신순');
              },
              itemBuilder: (context) {
                return [
                  PopupMenuItem(value: 'like', child: Text('좋아요순')),
                  PopupMenuItem(value: 'star', child: Text('별점순')),
                  PopupMenuItem(value: 'review', child: Text('리뷰순')),
                  PopupMenuItem(value: 'new', child: Text('최신순')),
                ];
              },
            )
          ]),
    );
  }
}

/*

      body: Center(child: Text('Hello Flutter!')
      */
