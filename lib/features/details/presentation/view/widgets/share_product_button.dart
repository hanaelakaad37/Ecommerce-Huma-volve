import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
class ShareProductButton extends StatelessWidget {
  final String productId;
  const ShareProductButton({super.key,required this.productId});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: ()async{
      final productLink="https://humavolveecommerce26.web.app/products/$productId" ;
      final String sharedMessage ="Look At This Product :$productLink";
      await SharePlus.instance.share(
        ShareParams(
          text: sharedMessage,
          subject: "check out this product on huma volve app"
        )
      );
    },
     icon: Icon(Icons.share));
  }
}
