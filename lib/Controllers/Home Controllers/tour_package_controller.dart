import 'package:earn_store/Models/Home%20Models/package_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Networks/post_networks.dart';
import 'package:earn_store/Utils/local_storage.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class TourPackageController extends GetxController {
  RxBool packageLoading = true.obs;
  RxBool packageDetailsLoading = true.obs;
  RxBool bookPackageLoading = false.obs;
  final allPackages = Rxn<PackageModel>();
  final specificPackages = Rxn<PackageModel>();
  final packageDetails = Rxn<PackageModel>();
  PostNetworks postNetworks = PostNetworks();
  GetNetworks getNetworks = GetNetworks();

  Future<void> getAllTourPackage() async {
    packageLoading.value = true;
    final response = await getNetworks.getData<PackageModel>(
      url: "/get-all-agency-package",
      fromJson: (json) => PackageModel.fromJson(json),
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "Tour Package Status",
          description: left,
        );
        packageLoading.value = false;
      },
      (tourPackages) async {
        allPackages.value = tourPackages;
        packageLoading.value = false;
      },
    );
  }

  Future<void> getPackageByAgency({required String agencyID}) async {
    packageLoading.value = true;
    final response = await getNetworks.getData<PackageModel>(
      url: "/get-agency-package?agency_id=$agencyID",
      fromJson: (json) => PackageModel.fromJson(json),
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "Tour Package Status",
          description: left,
        );
        packageLoading.value = false;
      },
      (tourPackages) async {
        specificPackages.value = tourPackages;
        packageLoading.value = false;
      },
    );
  }

  Future<void> getPackageDetails({required String packageID}) async {
    packageDetailsLoading.value = true;
    final response = await getNetworks.getData<PackageModel>(
      url: "/get-agency-package-id?package_id=$packageID",
      fromJson: (json) => PackageModel.fromJson(json),
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "Package Details Status",
          description: left,
        );
        packageDetailsLoading.value = false;
      },
      (packageDetailsInfo) async {
        packageDetails.value = packageDetailsInfo;
        packageDetailsLoading.value = false;
      },
    );
  }

  Future<void> packageBook({
    required String agencyID,
    required String agencyPackageID,
  }) async {
    bookPackageLoading.value = true;
    int userID = await LocalStorage.getUserID();
    final response = await postNetworks.postDataWithoutResponse(
      url: "/book-agency-package",
      body: {
        "user_id": userID.toString(),
        "agency_id": agencyID,
        "agency_package_id": agencyPackageID,
      },
    );
    response.fold(
      (left) {
        bookPackageLoading.value = false;
        Snackbars.unSuccessSnackBar(
          title: "Package Book Status",
          description: "Failed to book this package.",
        );
      },
      (status) async {
        if (status == 200) {
          bookPackageLoading.value = false;
          Snackbars.successSnackBar(
            title: "Package Book Status",
            description: "Package Booked",
          );
        } else {
          bookPackageLoading.value = false;
          Snackbars.unSuccessSnackBar(
            title: "Package Book Status",
            description: "Failed to book this package.",
          );
        }
      },
    );
  }
}
