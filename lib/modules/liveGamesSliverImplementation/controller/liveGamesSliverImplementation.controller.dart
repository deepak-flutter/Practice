import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LiveGamesSliverImplementationController extends GetxController {
  PageController pageController = PageController();
  TextEditingController entryCoinController = TextEditingController();
  TextEditingController createChallengePlayerNameController = TextEditingController();
  TextEditingController createChallengeCoinsController = TextEditingController();

  RxInt carouselDot = 0.obs;
  RxInt selectedLiveChallengesText = 0.obs;
  RxInt liveChallengeSelectedButton = 0.obs;
  RxInt filterTypeBtn = 100.obs;
  RxInt filterEntryAmountBtn = 100.obs;
  RxInt filterCommissionBtn = 100.obs;
  RxString createChallengeRadioButtonGroupValue = "".obs;
  RxString selectColorRadioButtonGroupValue = "".obs;

  List<String> filterHeadingList = ["Type", "Entry Amount", "Commission", "Coins", "Winnings"];
  List<String> filterTypeList = ["Ludo King", "Ludo UNIBIT", "UNIBIT Quick", "UNIBIT Classic", "All"];
  List<String> filterEntryAmountList = ["₹0 - ₹10", "₹10 - ₹50", "₹50 - ₹100", "₹100 - ₹150"];
  List<String> filterCommissionList = ["0%", "1%", "1.5%"];
  List<String> createChallengeRadioButtonList = ["Unibit Classic", "Unibit Old", "Unibit Quick", "Ludo King"];
  List<String> selectColorRadioButtonList = ["Green", "Red", "Yellow", "Blue"];
  RxList<String> selectedBtnList = [""].obs;


  onBannerClick() {
    print("Banner Clicked");
  }

  onViewAllClick() {
    print("View All");
  }

  onCloseClick() {
    Get.back();
  }

  onRematchClick(String id) {
    print("Rematch $id");
  }

  onRematchCoinAmountButtonClick(int index) {
    if (index == 0) {
      entryCoinController.text = "50";
      print("Rs. 50");
    } else if (index == 1) {
      entryCoinController.text = "100";
      print("Rs. 100");
    } else {
      entryCoinController.text = "500";
      print("Rs. 500");
    }
  }

  onRematchSendRequestButtonClick() {
    print("Send Request Entry Coins: ${entryCoinController.text}");
  }

  onAllClick(int index) {
    print("All");
    selectedLiveChallengesText.value = index;
  }

  onUNIBITClick(int index) {
    print("UNIBIT");
    selectedLiveChallengesText.value = index;
  }

  onLiveChallengesStatusClick(int index) {
    liveChallengeSelectedButton.value = index;

    if (index == 0) {
      print("Upcoming");
      pageController.animateToPage(0, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else {
      print("Running");
      pageController.animateToPage(1, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  onFilterButtonClick(){
    print("Filter Button Clicked");
  }



  onFilterTypeBtnClick(String item) {
    if (selectedBtnList.contains(item)) {
      selectedBtnList.remove(item);
    } else {
      selectedBtnList.add(item);
    }
  }

  onFilterApplyBtnClick() {
    print("Apply "
        "\nType: ${filterTypeBtn.value != 100 ? filterTypeList[filterTypeBtn.value] : ""} "
        "\nEntry Amount: ${filterEntryAmountBtn.value != 100 ? filterEntryAmountList[filterEntryAmountBtn.value] : ""} "
        "\nCommission: ${filterCommissionBtn.value != 100 ? filterCommissionList[filterCommissionBtn.value] : ""}");
  }

  onFilterCancelBtnClick() {
    print("Cancel");
    onCloseClick();
    filterTypeBtn.value = 100;
    filterEntryAmountBtn.value = 100;
    filterCommissionBtn.value = 100;
  }


  onCreateChallengeRadioButtonClick(String value) {
    createChallengeRadioButtonGroupValue.value = value;
  }

  onCreateChallengeCoinAmountButtonClick(int index) {
    if (index == 0) {
      createChallengeCoinsController.text = "50";
      print("Rs. 50");
    } else if (index == 1) {
      createChallengeCoinsController.text = "100";
      print("Rs. 100");
    } else {
      createChallengeCoinsController.text = "500";
      print("Rs. 500");
    }
  }

  onAddChallengeButtonClick() {
    print(
      "Add Challenge \nPlayer Name: ${createChallengePlayerNameController.text} \nRadio Button Value: ${createChallengeRadioButtonGroupValue.value} \nCoins: ${createChallengeCoinsController.text}",
    );
    onCloseClick();

  }

  onPlayNowClick() {
    print("Play Now");
    onCloseClick();

  }

  onSelectColorRadioButtonClick(String value) {
    selectColorRadioButtonGroupValue.value = value;
    print(selectColorRadioButtonGroupValue);
  }

  onSelectColorAddChallengeClick() {
    print("Add Challenge \nSelected Color: $selectColorRadioButtonGroupValue");
  }

  onAddFloatingButtonClick() {
    print("on Add Floating Button Click");
    // CoinBottomModalSheetComponent.showBottomModal(
    //   context: Get.context!,
    //   onCloseClick: onCloseClick,
    //   onAddCoinClick: onAddCoinClick,
    //   onWithdrawClick: onWithdrawClick,
    // );


  }

  onAddCoinClick() {
    print("Add Coin Button Clicked");
  }

  onWithdrawClick() {
    print("Withdraw Button Clicked");
  }
}
