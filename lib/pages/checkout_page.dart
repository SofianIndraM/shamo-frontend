import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_frontend/pages/loading_button.dart';
import 'package:shamo_frontend/provider/auth_provider.dart';
import 'package:shamo_frontend/provider/cart_provider.dart';
import 'package:shamo_frontend/provider/transaction_provider.dart';
import 'package:shamo_frontend/theme.dart';
import 'package:shamo_frontend/widgets/checkout_card.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    bool isLoading = false;

    handleCheckout() async {
      setState(() {
        isLoading = true;
      });
      if (await transactionProvider.checkout(
        authProvider.user.token,
        cartProvider.carts,
        cartProvider.totalPrice(),
      )) {
        cartProvider.carts = [];
        Navigator.pushNamedAndRemoveUntil(
            context, '/checkout-success', (route) => false);
      }
      setState(() {
        isLoading = false;
      });
    }

    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text(
          'Checkout Details',
          style: primaryTextStyle.copyWith(
            fontWeight: medium,
            fontSize: 18,
          ),
        ),
      );
    }

    Widget content() {
      return ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //NOTE: LIST ITEMS
                Container(
                  margin: EdgeInsets.only(
                    top: defaultMargin,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'List Items',
                        style: primaryTextStyle.copyWith(
                          fontWeight: medium,
                          fontSize: 16,
                        ),
                      ),
                      Column(
                        children: cartProvider.carts
                            .map(
                              (cart) => CheckoutCard(cart),
                            )
                            .toList(),
                      )
                    ],
                  ),
                ),
                //NOTE: ADDRESS
                Container(
                  margin: EdgeInsets.only(
                    top: defaultMargin,
                  ),
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: backgroundColor4,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Address Details',
                        style: primaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                'assets/icon_store_location.png',
                                width: 40,
                              ),
                              Image.asset(
                                'assets/icon_line.png',
                                height: 30,
                              ),
                              Image.asset(
                                'assets/icon_your_address.png',
                                width: 40,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Store Location',
                                style: secondaryTextStyle.copyWith(
                                  fontWeight: light,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(
                                height: 1,
                              ),
                              Text(
                                'Adidas Core',
                                style: primaryTextStyle.copyWith(
                                  fontWeight: medium,
                                ),
                              ),
                              SizedBox(
                                height: defaultMargin,
                              ),
                              Text(
                                'Your Address',
                                style: secondaryTextStyle.copyWith(
                                  fontWeight: light,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(
                                height: 1,
                              ),
                              Text(
                                'Marsemoon',
                                style: primaryTextStyle.copyWith(
                                  fontWeight: medium,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                //NOTE: PAYMENT SUMMARY
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(
                    top: defaultMargin,
                  ),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: backgroundColor4,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Payment Summary',
                        style: primaryTextStyle.copyWith(
                          fontWeight: medium,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Product Quantity',
                            style: secondaryTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            '${cartProvider.totalItems()} Items',
                            style: primaryTextStyle.copyWith(
                              fontWeight: medium,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Product Price',
                            style: secondaryTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            '\$${cartProvider.totalPrice()}',
                            style: primaryTextStyle.copyWith(
                              fontWeight: medium,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Shipping',
                            style: secondaryTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            'Free',
                            style: primaryTextStyle.copyWith(
                              fontWeight: medium,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 11,
                      ),
                      Divider(
                        thickness: 0.3,
                        color: Color(0xff2E3141),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: priceTextStyle.copyWith(
                              fontWeight: semiBold,
                            ),
                          ),
                          Text(
                            '\$${cartProvider.totalPrice()}',
                            style: priceTextStyle.copyWith(
                              fontWeight: semiBold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: defaultMargin,
                ),
                //NOTE: DIVIDER
                Divider(
                  thickness: 1,
                  color: Color(0xff2B2938),
                ),
                isLoading
                    ? Container(
                        margin: EdgeInsets.only(
                          bottom: defaultMargin,
                        ),
                        child: LoadingButton())
                    : Container(
                        margin: EdgeInsets.symmetric(
                          vertical: defaultMargin,
                        ),
                        height: 50,
                        width: double.infinity,
                        child: TextButton(
                          onPressed: handleCheckout,
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            backgroundColor: primaryColor,
                          ),
                          child: Text(
                            'Checkout Now',
                            style: primaryTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                        ),
                      )
              ],
            ),
          )
        ],
      );
    }

    return Scaffold(
      appBar: header(),
      backgroundColor: backgroundColor3,
      body: content(),
    );
  }
}
