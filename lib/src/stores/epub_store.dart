import 'package:flutter/material.dart';
import 'package:teste_escribo_app/src/service/epub_service.dart';

class EpubStore extends EpubService {
  Future<void> download(String epubUrl, BuildContext context) async {
    downloadEpub(epubUrl, context);
  }
}
