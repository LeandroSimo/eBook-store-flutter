import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vocsy_epub_viewer/epub_viewer.dart';

mixin class EpubService {
  final dio = Dio();
  String filePath = '';
  String _epubPath = '';
  bool loading = false;

  Future<void> downloadEpub(String epubUrl, BuildContext context) async {
    loading = true;

    if (Platform.isAndroid || Platform.isIOS) {
      String? firstPart;
      final deviceInfoPlugin = DeviceInfoPlugin();
      final deviceInfo = await deviceInfoPlugin.deviceInfo;
      final allInfo = deviceInfo.data;
      if (allInfo['version']["release"].toString().contains(".")) {
        int indexOfFirstDot = allInfo['version']["release"].indexOf(".");
        firstPart = allInfo['version']["release"].substring(0, indexOfFirstDot);
      } else {
        firstPart = allInfo['version']["release"];
      }
      int intValue = int.parse(firstPart!);
      if (intValue >= 13) {
        await _downloadFile(epubUrl, context);
      } else {
        if (await Permission.storage.isGranted) {
          await Permission.storage.request();
          await _downloadFile(epubUrl, context);
        } else {
          await _downloadFile(epubUrl, context);
        }
      }
    } else {
      loading = false;
    }
  }

  Future<void> _downloadFile(String url, BuildContext context) async {
    loading = true;
    Directory? appDocDir = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();

    String path = appDocDir!.path + '/sample.epub';
    File file = File(path);

    await file.create();
    showDownloadDialog(context);
    await dio
        .download(
      url,
      path,
      deleteOnError: true,
    )
        .catchError((error) {
      loading = false;
      Navigator.pop(context);
      Exception('Erro durante o download: $error');
    }).whenComplete(() {
      loading = false;
      Navigator.pop(context); // Fechar o diálogo quando o download é concluído
      filePath = path;
      openEpub();
    });
  }

  void showDownloadDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Abrindo eBook...'),
          content: LinearProgressIndicator(),
        );
      },
    );
  }

  void openEpub() {
    VocsyEpub.setConfig(
      identifier: "iosBook",
      scrollDirection: EpubScrollDirection.ALLDIRECTIONS,
      allowSharing: true,
      enableTts: true,
      nightMode: true,
    );

    VocsyEpub.locatorStream.listen((locator) {
      print('LOCATOR: $locator');
    });

    VocsyEpub.open(
      filePath,
      lastLocation: EpubLocator.fromJson({
        "bookId": "2239",
        "href": "/OEBPS/ch06.xhtml",
        "created": 1539934158390,
        "locations": {"cfi": "epubcfi(/0!/4/4[simple_book]/2/2/6)"}
      }),
    );
  }
}
