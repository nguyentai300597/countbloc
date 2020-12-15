
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_bloc_count/count/bloc_count.dart';
import 'package:flutter_app_bloc_count/count/event_bloc.dart';
import 'package:flutter_app_bloc_count/count/state_count.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class pagecount extends StatefulWidget {
  @override
  _pagecountState createState() => _pagecountState();
}


class _pagecountState extends State<pagecount> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  Widget build(BuildContext context) {

    final countbloc bloccount=BlocProvider.of<countbloc>(context);
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<countbloc,countstate>(
                builder: (context,state){
                  if(state is Success)
                  {
                    return Text('${state.count}',style: TextStyle(fontSize: 50),);
                  }
                  else
                  {
                    return CircularProgressIndicator();
                  }
                }
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          bloccount.add(incremrnt());
          print("pressst");
        },
      ),
    );
  }
}
Widget countui()
{
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<countbloc,countstate>(
            builder: (context,state){
              if(state is Success)
              {
                return Text('${state.count}',style: TextStyle(fontSize: 50),);
              }
              else
                {
                  return CircularProgressIndicator();
                }
            }
        )
      ],
    ),
  );
}
