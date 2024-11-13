import 'package:valetparking_driver/features/home/manager/home_cubit.dart';
import 'package:valetparking_driver/utils/constants/exports.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

// class _ScanScreenState extends State<ScanScreen> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   QRViewController? controller;
//
//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: BlocConsumer<HomeCubit, HomeState>(
//         listener: (context, state) {
//           if (state is MakeScanSuccessState) {
//             context.pushNamedAndRemoveUntil(
//               VRoutesName.navigationMenuRoute,
//               arguments: 0,
//               predicate: (route) => false,
//             );
//
//             FloatingSnackBar.show(
//               context: context,
//               message: 'User successfully added',
//               textColor: Colors.white,
//               duration: const Duration(milliseconds: 4000),
//               backgroundColor: VColors.success,
//             );
//           } else if (state is MakeScanErrorState) {
//             FloatingSnackBar.show(
//               context: context,
//               message: state.message!,
//               textColor: Colors.white,
//               duration: const Duration(milliseconds: 4000),
//               backgroundColor: VColors.error,
//             );
//           }
//         },
//         builder: (context, state) {
//           var makeScanCubit = HomeCubit.get(context);
//
//           return NestedScrollView(
//             headerSliverBuilder: (context, innerBoxIsScrolled) {
//               return <Widget>[
//                 SliverAppBar(
//                   elevation: 0,
//                   backgroundColor: VColors.whiteColor,
//                   title: Padding(
//                     padding: EdgeInsets.only(right: 24.w),
//                     child: Text(
//                       'Scan',
//                       style: VStyles.h4Bold,
//                     ),
//                   ),
//                   floating: true,
//                   pinned: true,
//                   flexibleSpace: Container(
//                     color: VColors.whiteColor,
//                   ),
//                 ),
//               ];
//             },
//             body: Column(
//               children: [
//                 Expanded(
//                   flex: 4,
//                   child: QRView(
//                     key: qrKey,
//                     onQRViewCreated: _onQRViewCreated,
//                     overlay: QrScannerOverlayShape(
//                       borderColor: VColors.primaryColor500,
//                       borderRadius: 10,
//                       borderLength: 30,
//                       borderWidth: 10,
//                       cutOutSize: MediaQuery.of(context).size.width * 0.8,
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   flex: 1,
//                   child: Center(
//                     child: Text(
//                       'Place the QR code inside the frame \n ${controller.toString()}',
//                       style: VStyles.bodyLargeBold.copyWith(
//                         color: VColors.primaryColor500,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   void _onQRViewCreated(QRViewController controller) {
//     setState(() {
//       this.controller = controller;
//     });
//
//     controller.scannedDataStream.listen((scanData) {
//       print('Scanned QR Code: ');
//       /// print(scanData.code['orderId']);
//       var qrData = jsonDecode(scanData.code!);
//       try {
//         /// Parse the scanned QR code (which is a JSON string) to a Map
//
//         /// Now you can access the 'orderId' as it's a part of the JSON object
//         print(qrData['orderId']);
//       } catch (e) {
//         print('Error decoding QR Code: $e');
//       }
//       HomeCubit.get(context).makeScanFunction(orderId: qrData['orderId']);
//     });
//   }
// }
class _ScanScreenState extends State<ScanScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool isScanning = false; // Track scanning state

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is MakeScanSuccessState) {
            setState(() {
              /// Keep scanning blocked once success occurs
              isScanning = true;
            });
            context.pushNamedAndRemoveUntil(
              VRoutesName.navigationMenuRoute,
              arguments: 0,
              predicate: (route) => false,
            );

            FloatingSnackBar.show(
              context: context,
              message: '${AppLocalizations.of(context)!.translate('orderStatusSuccessfullyChanged')}',
              textColor: Colors.white,
              duration: const Duration(milliseconds: 4000),
              backgroundColor: VColors.success,
            );
          } else if (state is MakeScanErrorState) {
            setState(() {
              isScanning = false; /// Allow retry on error
            });
            FloatingSnackBar.show(
              context: context,
              message: state.message!,
              textColor: Colors.white,
              duration: const Duration(milliseconds: 4000),
              backgroundColor: VColors.error,
            );
          }
        },
        builder: (context, state) {
          var makeScanCubit = HomeCubit.get(context);

          return NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  elevation: 0,
                  backgroundColor: VColors.whiteColor,
                  title: Padding(
                    padding: EdgeInsets.only(right: 24.w),
                    child: Text(
                      '${AppLocalizations.of(context)!.translate('scan')} ',
                      style: VStyles.h4Bold(context),
                    ),
                  ),
                  floating: true,
                  pinned: true,
                  flexibleSpace: Container(
                    color: VColors.whiteColor,
                  ),
                ),
              ];
            },
            body: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: QRView(
                    key: qrKey,
                    onQRViewCreated: _onQRViewCreated,
                    overlay: QrScannerOverlayShape(
                      borderColor: VColors.primaryColor500,
                      borderRadius: 10,
                      borderLength: 30,
                      borderWidth: 10,
                      cutOutSize: MediaQuery.of(context).size.width * 0.8,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      '${AppLocalizations.of(context)!.translate('placeTheQrCodeInsideTheFrame')} \n ${controller.toString()}',
                      style: VStyles.bodyLargeBold(context).copyWith(
                        color: VColors.primaryColor500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });

    controller.scannedDataStream.listen((scanData) {
      // Only allow scan if not in loading or successful state
      if (!isScanning) {
        print('Scanned QR Code: ');

        var qrData = jsonDecode(scanData.code!);
        try {
          print(qrData['orderId']);
          setState(() {
            isScanning = true; // Block further scans once the scan starts
          });
          if(qrData['orderId'] == null) {
            FloatingSnackBar.show(
              context: context,
              message: 'No have orderId',
              textColor: Colors.white,
              duration: const Duration(milliseconds: 4000),
              backgroundColor: VColors.error,
            );
          } else {
            HomeCubit.get(context).makeScanFunction(orderId: qrData['orderId']);
          }
        } catch (e) {
          print('Error decoding QR Code: $e');
          setState(() {
            isScanning = false; // Allow retry on error
          });
        }
      }
    });
  }
}
