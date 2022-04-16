import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skills_test/model/vehicle_model.dart';

import 'bloc/vahicles_list_bloc.dart';

class Vehicles extends StatefulWidget {
  static String tag = "/vehicles";

  @override
  _VehicleState createState() => _VehicleState();
}

class _VehicleState extends State<Vehicles> {
  BuildContext _buildContext;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VahicleslistBloc()..add(FetchVahiclesListEvent()),
      child: Scaffold(
          appBar: AppBar(
            title: Text('Vehicles Catalog'),
          ),
          body: BlocConsumer<VahicleslistBloc, VahicleslistState>(
            listener: (context, state) {
              if (_buildContext == null) _buildContext = context;
            },
            builder: (context, state) {
              if (state is DataRetrivedState) {
                if (state.data.length == 0)
                  return Center(
                    child: Text('No Vehicles Found!!',
                        style: TextStyle(fontSize: 30.0)),
                  );

                return Container(
                  padding: const EdgeInsets.all(16),
                  height: double.infinity,
                  width: double.infinity,
                  color: Color(0Xfff1f1f1),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .7,
                        height: MediaQuery.of(context).size.height * .3,
                        color: Colors.red,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              if (state.index - 1 >= 0)
                                BlocProvider.of<VahicleslistBloc>(_buildContext)
                                    .add(ChangeCar(state.index - 1));
                            },
                            icon: Icon(Icons.arrow_back_ios_rounded),
                          ),
                          Expanded(
                            child: Text(
                              state.data[state.index].car,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                if (state.index + 1 < state.data.length)
                                  BlocProvider.of<VahicleslistBloc>(
                                          _buildContext)
                                      .add(ChangeCar(state.index + 1));
                              },
                              icon: Icon(Icons.arrow_forward_ios_rounded))
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      buildInfoRow(
                          'Car Model', state.data[state.index].carModel),
                      buildInfoRow('Color', state.data[state.index].carColor),
                      buildInfoRow('Year',
                          state.data[state.index].carModelYear.toString()),
                      buildInfoRow('VIN', state.data[state.index].carVin),
                      buildInfoRow('Price', state.data[state.index].price),
                      buildInfoRow('Avaibility',
                          state.data[state.index].availability ? 'Yes' : 'No'),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: FlatButton(
                              color: Colors.blue.withOpacity(.08),
                              onPressed: () {
                                showEditBottomSheet(
                                    context, state.data[state.index]);
                              },
                              textColor: Colors.blue,
                              child: Text(
                                'Edit',
                                // style: TextStyle(fontSize: 30),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Expanded(
                            child: FlatButton(
                              color: Colors.red.withOpacity(.08),
                              onPressed: () {
                                BlocProvider.of<VahicleslistBloc>(_buildContext)
                                    .add(DeleteCar(state.index));
                              },
                              textColor: Colors.red,
                              child: Text(
                                'Delete',
                                // style: TextStyle(fontSize: 30),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }

              return Container();
            },
          )),
    );
  }

  Widget buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(title), Text(value)],
      ),
    );
  }

  showEditBottomSheet(BuildContext ctx, Vehicle input) async {
    await showBottomSheet(
        elevation: 1,
        context: ctx,
        builder: (context) {
          TextEditingController priceCtrl = TextEditingController();
          priceCtrl.text = input.price;
          bool available = input.availability;
          return StatefulBuilder(builder: (context, setModelState) {
            return Container(
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(25.0),
                  topRight: const Radius.circular(25.0),
                ),
              ),
              padding: const EdgeInsets.only(
                  top: 16, bottom: 100, right: 30, left: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Edit ${input.car}',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Avaibility"),
                      Switch(
                          value: available,
                          onChanged: (val) {
                            setModelState(() {
                              available = val;
                            });
                          })
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(flex: 3, child: Text('Price')),
                      Expanded(
                        flex: 3,
                        child: TextField(
                          controller: priceCtrl,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: FlatButton(
                          color: Colors.blue.withOpacity(.08),
                          onPressed: () {
                            input.availability = available;
                            input.price = priceCtrl.text;
                            Navigator.pop(context);
                            BlocProvider.of<VahicleslistBloc>(_buildContext)
                                .add(EditCar(input));
                          },
                          textColor: Colors.blue,
                          child: Text(
                            'Change',
                            // style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          });
        }).closed;
  }
}
