// import 'package:flutter/material.dart';
// import 'package:formula_one_calendar/viewmodels/constructor_viewmodel.dart';
//
// import '../models/constructor.dart';
// import 'driver_view.dart';
//
// class ConstructorDetailsView extends StatefulWidget {
//   final Constructors constructor;
//
//   const ConstructorDetailsView({Key? key, required this.constructor}) : super(key: key);
//
//   @override
//   ConstructorDetailsViewState createState() => ConstructorDetailsViewState();
// }
//
// class ConstructorDetailsViewState extends State<ConstructorDetailsView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.constructor.name ?? "-"),
//         backgroundColor: widget.constructor.getConstructorColor,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Image.network(
//                 widget.constructor.getConstructorImageEXT,
//                 width: MediaQuery.of(context).size.width,
//                 height: 200,
//                 fit: BoxFit.cover,
//                 errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
//               ),
//               Text('Full Team Name: ${widget.constructor.getConstructorFullname ?? "-"}',
//                   style: Theme.of(context).textTheme.titleLarge),
//               Text('Nationality: ${widget.constructor.nationality} ${widget.constructor.getConstructorFlag}',
//                   style: Theme.of(context).textTheme.titleLarge),
//               Text('Base: ${widget.constructor.getConstructorBase ?? "-"}',
//                   style: Theme.of(context).textTheme.titleLarge),
//               Text('Power Unit: ${widget.constructor.getConstructorPowerUnit}',
//                   style: Theme.of(context).textTheme.titleLarge),
//               Text('First Team Entry: ${widget.constructor.getConstructorEntryYear ?? "-"}',
//                   style: Theme.of(context).textTheme.titleLarge),
//               Text('Drivers: ', style: Theme.of(context).textTheme.titleLarge),
//               Row(
//                 children: [
//                   DriverButton(constructor: widget.constructor, driverNum: 0),
//                   DriverButton(constructor: widget.constructor, driverNum: 1),
//                 ],
//               ),
//               AspectRatio(
//                 aspectRatio: 16 / 9,
//                 child: Image.network(
//                   widget.constructor.getConstructorCarImage,
//                   errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class DriverButton extends StatelessWidget {
//   const DriverButton({
//     super.key,
//     required this.constructor,
//     required this.driverNum,
//   });
//
//   final Constructors constructor;
//   final int driverNum;
//
//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       child: Text(constructor.getConstructorDrivers[driverNum], style: Theme.of(context).textTheme.titleLarge),
//       onPressed: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => DriverDetailsView(
//               selectedDriver: constructor.getConstructorDriversID[driverNum],
//               constructorColor: constructor.getConstructorColor,
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
