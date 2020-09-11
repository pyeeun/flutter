import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:bouncing_widget/bouncing_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expand Widget',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expand Widget'),
      ),
      body: ListView(
        padding: EdgeInsets.all(30),
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            color: Colors.red,
            child: Image.network(
                'https://www.gstatic.com/mobilesdk/160503_mobilesdk/logo/2x/firebase_28dp.png'),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Text(
                    '‘곧추선’ 태풍들 또 올 수 있어…',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  ExpandChild(
                    child: Column(
                      children: <Widget>[
                        Text(
                          '올해 우리나라에 피해를 준 태풍 4개가 모두 남쪽에서 북쪽으로 직진하는 이례적인 경로를 보인 것은 기후변화 영향일 가능성이 큰 것으로 분석된다. 지구온난화로 태풍 강도는 강해지고 태풍들이 ‘곧추서는’ 경향도 계속될 것으로 전망돼, 우리나라 중부 내륙이나 북한 동북지방 등 평상시 태풍 영향을 거의 받지 않는 지역에까지 피해가 발생할 확률이 높아지고 있다.',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        SizedBox(height: 20),
                        BouncingWidget(
                          scaleFactor: 1.0,
                          child: Container(
                            height: 40,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Colors.blueGrey,
                            ),
                            child: Center(
                              child: Text(
                                '공유하기',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    arrowColor: Colors.redAccent,
                    arrowSize: 30,
                    expandArrowStyle: ExpandArrowStyle.icon,
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Text(
                    '396만원 갤Z폴드2 톰브라운',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  ExpandChild(
                    child: Column(
                      children: <Widget>[
                        Text(
                          '"갤럭시Z 폴드2 톰브라운 에디션 1000만원에 팝니다." "12일까지 쪽지 받고 (가장 높은 가격 써내는 분에게) 팝니다." 온라인 중고거래사이트를 중심으로 갤럭시Z 폴드2 톰브라운 에디션 되팔기가 나타나고 있다. 삼성전자가 명품 패션브랜드 톰브라운과 협업해 전세계 5000대 한정으로만 내놓은 이 제품 가격은 396만원. 지난 7~8일 이틀간 온라인 추첨 판매에 23만명이 몰렸다. 워낙 수요가 많아 당첨만 되면 최소 50% 이상의 수익률을 보장해서다.',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        SizedBox(height: 20),
                        BouncingWidget(
                          scaleFactor: 1.0,
                          child: Container(
                            height: 40,
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              color: Colors.blueGrey,
                            ),
                            child: Center(
                              child: Text(
                                '공유하기',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    arrowColor: Colors.redAccent,
                    arrowSize: 30,
                    // expandArrowStyle: ExpandArrowStyle.both,
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
