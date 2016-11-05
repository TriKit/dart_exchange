import 'user.dart';
import 'offer.dart';

class Contract {
  int sellerId, buyerId, offerToBuyId, offerToSellId;
  bool sellerConfirm, buyerConfirm;
  String status;
  Contract(this.sellerId, this.buyerId, this.offerToBuyId, this.offerToSellId, this.status, this.sellerConfirm, this.buyerConfirm);

  String changeStatus(sellerConfirm, buyerConfirm) {
    if (sellerConfirm && buyerConfirm) {
      status = 'closed';
    }
  }
}
