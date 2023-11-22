if [ "$CONFIGURATION" == "Debug-DoiITShopDev" ] || [ "$CONFIGURATION" == "Release-DoiITShopDev" ]; then
  cp Runner/DoiITShopDev/GoogleService-Info.plist Runner/GoogleService-Info.plist
elif [ "$CONFIGURATION" == "Debug-DoiITShopProd" ] || [ "$CONFIGURATION" == "Release-DoiITShopProd" ]; then
  cp Runner/DoiITShopProd/GoogleService-Info.plist Runner/GoogleService-Info.plist
elif [ "$CONFIGURATION" == "Debug-ShopIT" ] || [ "$CONFIGURATION" == "Release-ShopIT" ]; then
  cp Runner/ShopIT/GoogleService-Info.plist Runner/GoogleService-Info.plist
fi

