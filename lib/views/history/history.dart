import 'package:calculator/data/models/calculation.dart';
import 'package:calculator/global_widgets/empty_state.dart';
import 'package:calculator/global_widgets/loading_widget.dart';
import 'package:calculator/view_models/home.vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeViewModel>(context);

    final top = Container(
      padding: EdgeInsets.only(top: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.close,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(child: Text('Clear History'), value: 'cls'),
              ];
            },
            onSelected: (String choice) {
              if (choice == 'cls') {
                model.clearHistory();
              }
            },
          )
        ],
      ),
    );

    final body = Expanded(
      child: StreamBuilder<List<Calculation>>(
        stream: model.getHistory(),
        builder: (
          BuildContext context,
          AsyncSnapshot<List<Calculation>> snapshot,
        ) {
          if (snapshot.data != null) {
            if (snapshot.data.isNotEmpty) {
              List<Calculation> calculations = snapshot.data;
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return historyView(calculations[index]);
                },
                itemCount: calculations.length,
              );
            } else {
              return EmptyState(
                message: "No History",
              );
            }
          } else {
            return LoadingWidget();
          }
        },
      ),
    );

    return Scaffold(
      body: Column(children: <Widget>[top, body]),
    );
  }

  Widget historyView(Calculation calculation) {
    return Container(
      margin: EdgeInsets.only(bottom: 50.0),
      padding: EdgeInsets.only(right: 20.0, left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            calculation.equation,
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          Text(
            "= ${calculation.result}",
            style: TextStyle(color: Colors.grey, fontSize: 30.0),
          ),
        ],
      ),
    );
  }
}
