import 'package:untitled2/dasboard/constants.dart';
import 'package:flutter/material.dart';
//
// import '../../pages/allProduct.dart';
// import '../../pages/screen.dart';

class CloudStorageInfo {
  // final String screenTitle, screenContent;
  final String? svgSrc, title, totalStorage,screenContent;
  final int? numOfFiles, percentage;
  final Color? color;
  final Widget screenWidget;


  CloudStorageInfo({
    required this.screenWidget,
    this.screenContent,
    this.svgSrc,
    this.title,
    this.totalStorage,
    this.numOfFiles,
    this.percentage,
    this.color,
  });
}

List demoMyFiles = [
  CloudStorageInfo(
    title: "Karyawan",
    // numOfFiles: 100,
    svgSrc: "img/person1.svg",
    totalStorage: "100 Orang",
    color: Colors.white,
    percentage: 0,
    screenWidget: CircleAvatar(),




  ),
  CloudStorageInfo(
    title: "Diagram",
    // numOfFiles: 1328,
    svgSrc: "img/chart.svg",
    totalStorage: "Diagram Tahunan",
    color: Colors.white,
    percentage: 0,
    screenWidget: CircleAvatar(),
  ),
  CloudStorageInfo(
    title: "Data Penjualan",
    // numOfFiles: 1328,
    svgSrc: "img/note.svg",
    totalStorage: "Penjualan Produk",
    color: Colors.white,
    percentage: 0,
    screenWidget: CircleAvatar(),
  ),
  CloudStorageInfo(
    title: "Documents",
    // numOfFiles: 5328,
    svgSrc: "img/doc.svg",
    totalStorage: "100 File",
    color: Colors.white,
    percentage: 0,
    screenWidget: CircleAvatar(),


  ),
];


