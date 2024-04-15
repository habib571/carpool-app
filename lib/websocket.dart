import 'dart:async';
import 'dart:convert';
import 'package:carpooling/main.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart'; 
import 'package:dart_pusher_channels/dart_pusher_channels.dart';
class RideListenerPage extends StatefulWidget {
  const RideListenerPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RideListenerPageState createState() => _RideListenerPageState();
}

class _RideListenerPageState extends State<RideListenerPage> { 

 

connect() async {
  const hostOptions = PusherChannelsOptions.fromHost(
      scheme: 'ws', // wss for ssl
      host: '192.168.1.15',
      key: 'local' , // default is app-key, change in production!
      shouldSupplyMetadataQueries: true,
      metadata: PusherChannelsOptionsMetadata.byDefault() ,
      port: 6001,
    );

  final client = PusherChannelsClient.websocket(
      options: hostOptions,
      connectionErrorHandler: (exception, trace, refresh) async {
          print('edffgfg');
          refresh();
      });
  
  String uuid = '106faf12-39ea-47f3-8cbf-e3b5d9756837';
final myPrivateChannel = client.privateChannel(
      "private-ride..$uuid",
      authorizationDelegate:
          EndpointAuthorizableChannelTokenAuthorizationDelegate
              .forPrivateChannel(
      authorizationEndpoint: Uri.parse("your_api/auth"),
      headers: {"Authorization": "Bearer"},
      ),
  );

  final StreamSubscription connectionSubs =
      client.onConnectionEstablished.listen((_) {
      myPrivateChannel.subscribeIfNotUnsubscribed();
  });

  client.connect();

  StreamSubscription<ChannelReadEvent> somePrivateChannelEventSubs =
      myPrivateChannel.bind("App\Events\RideRequestSent").listen((event) {
      print(event.data);
      print(event.channel.name);
  });
}

 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ride Listener'),
      ),
     body: Container(
       child: ElevatedButton(onPressed: () async{  
      connect() ;
          
       }, child: Text('coinect'),
     ),
    
    ));
  }


}
