import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'chart.dart';
import 'storage_info_card.dart';

class StarageDetails extends StatelessWidget {
  const StarageDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pie Chart",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          SizedBox(height: defaultPadding),
          Chart(),
          StorageInfoCard(
            svgSrc: "assets/icons/Documents.svg",
            title: "Pembelian Tahun 2001",
            amountOfFiles: "",
            numOfFiles: 100,
          ),
          StorageInfoCard(
            svgSrc: "assets/icons/media.svg",
            title: "Pembelian Tahun 2002",
            amountOfFiles: "",
            numOfFiles: 132,
          ),
          StorageInfoCard(
            svgSrc: "assets/icons/folder.svg",
            title: "Pembelian Tahun 2003",
            amountOfFiles: "",
            numOfFiles: 138,
          ),
          StorageInfoCard(
            svgSrc: "assets/icons/unknown.svg",
            title: "Pembelian Tahun 2004",
            amountOfFiles: "",
            numOfFiles: 140,
          ),  StorageInfoCard(
            svgSrc: "assets/icons/unknown.svg",
            title: "Pembelian Tahun 2005",
            amountOfFiles: "",
            numOfFiles: 150,
          ),  StorageInfoCard(
            svgSrc: "assets/icons/unknown.svg",
            title: "Pembelian Tahun 2006",
            amountOfFiles: "",
            numOfFiles: 160,
          ),
        ],
      ),
    );
  }
}
