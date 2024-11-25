pushd android
flutter build apk
./gradlew app:assembleAndroidTest
./gradlew app:assembleDebug -Ptarget=lib/features/shop/screens/home/home.dart
./gradlew app:assembleDebug -Ptarget=lib/features/shop/screens/store/store.dart
./gradlew app:assembleDebug -Ptarget=lib/features/shop/screens/wishlist/wishilist.dart
./gradlew app:assembleDebug -Ptarget=lib/features/personalization/screens/settings/settings.dart
./gradlew app:assembleDebug -Ptarget=lib/features/personalization/screens/address/adress.dart
./gradlew app:assembleDebug -Ptarget=lib/features/personalization/screens/address/add_new_address.dart
./gradlew app:assembleDebug -Ptarget=lib/features/shop/screens/cart/cart.dart
./gradlew app:assembleDebug -Ptarget=lib/features/shop/screens/product_details/product_detail.dart
./gradlew app:assembleDebug -Ptarget=lib/features/shop/screens/checkout/checkout.dart
./gradlew app:assembleDebug -Ptarget=lib/features/authentication/screens/login/login.dart
./gradlew app:assembleDebug -Ptarget=lib/features/authentication/screens/login/widgets/login_form.dart
./gradlew app:assembleDebug -Ptarget=lib/features/shop/screens/all_products/all_product.dart
popd