import 'package:emotion/src/features/city_details/data/data_sources/remote_data_source.dart';
import 'package:emotion/src/features/city_details/data/models/city_details_model.dart';
import 'package:emotion/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:emotion/src/features/home/presentation/bloc/home_event.dart';
import 'package:emotion/src/features/home/presentation/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Future<CityDetailsModel>? futureCityDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const SizedBox(width: 70,),
            Image.asset(
              'assets/images/emotion-76.png',
              width: 40,
              height: 40,
            ),
            const SizedBox(width: 8,),
            const Text('E-Motion'),
          ],
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer:  Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Sign In'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Sign In'),
                    content: const SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                      Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Email',
                            ),
                          ),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Password',
                            ),
                            obscureText: true,
                          ),
                        ],
                      ),
                      ],
                    ),
                    ),
                    actions: <Widget>[
                    TextButton(
                      child: const Text('Cancel'),
                      onPressed: () {
                      Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: const Text('Sign In'),
                      onPressed: () {
                      // TODO(Leeoz): Handle Sign In
                      },
                    ),
                    TextButton(
                      child: const Text('Sign Up'), 
                      onPressed: () {
                        showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                          title: const Text('Sign Up'),
                          content: const SingleChildScrollView(
                            child: ListBody(
                            children: <Widget>[
                              Column(
                              children: [
                                TextField(
                                decoration: InputDecoration(
                                  labelText: 'Name',
                                ),
                                ),
                                TextField(
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                ),
                                ),
                                TextField(
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                ),
                                obscureText: true,
                                ),
                              ],
                              ),
                            ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                            child: const Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            ),
                            TextButton(
                            child: const Text('Sign Up'),
                            onPressed: () {
                              // TODO(Leeoz): Handle Sign Up
                            },
                            ),
                          ],
                          );
                        },
                        );
                      },
                    ),
                    ],
                  );
                  },
                );
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                // TODO(Leeoz): Handle Settings
              },
            ),
            ListTile(
              title: const Text('Change Language'),
              onTap: () {
                // TODO(Leeoz): Handle Language Change
              },
            ),
          ],
        ),
      ),
      body: BlocProvider(
        create: (context) => HomeBloc(),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Center(
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'City Name',
                    ),
                    onChanged: (value) {
                      context.read<HomeBloc>().add(CityNameChanged(cityName: value));
                    },
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Country Name',
                    ),
                    onChanged: (value) {
                      context.read<HomeBloc>().add(CountryNameChanged(countryName: value));
                    },
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final CityDetailsRemoteDataSourceImpl remoteDataSource = CityDetailsRemoteDataSourceImpl(client: http.Client());
                      setState(() {
                        futureCityDetails = remoteDataSource.getCityDetails(state.cityName, state.countryName);
                      });

                    },
                    child: const Text('Get City Details'),
                  ),
                  const SizedBox(height: 20,),
                    FutureBuilder(
                        future: futureCityDetails,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return const Text('No city found.');
                          } else if (snapshot.hasData){
                            return AlertDialog(
                                title: const Text('City Details'),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      Column(
                                        children: [
                                          Text('City: ${snapshot.data!.city!.name}'),
                                          Text('Country: ${snapshot.data!.country!.name}'),
                                          Text('Providers: ${snapshot.data!.cityProviders!.map((cityProvider) => cityProvider.providerName).join(', ')}'),
                                          Text('City Opinions: ${snapshot.data!.cityOpinions!.map((cityOpinion) => cityOpinion.content).join(', ')}'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                            );
                          } else { 
                            return const Text('Press the button to get city details.');
                          }
                        },
                      ),

                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
