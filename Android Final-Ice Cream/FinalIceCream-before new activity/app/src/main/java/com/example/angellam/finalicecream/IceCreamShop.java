package com.example.angellam.finalicecream;

/**
 * Created by angellam on 12/8/16.
 */

public class IceCreamShop {
    private String iceCreamShop;
    private String iceCreamShopURL;

    private void setIceCreamInfo(Integer iceCreamStore){
        switch (iceCreamStore){
            case 0: //death by chocolate
                iceCreamShop = "Glacier";
                iceCreamShopURL = "http://www.glaciericecream.com/";
                break;
            case 1: //cookies and cream
                iceCreamShop = "Sweet Cow";
                iceCreamShopURL = "http://www.sweetcowicecream.com/";
                break;
            case 2: //salted caramel
                iceCreamShop = "Fior di Latte";
                iceCreamShopURL = "http://fiordilattegelato.com/";
                break;
            default:
                iceCreamShop = "none";
                iceCreamShopURL = "https://www.google.com/search?q=best+ice+cream+in+denver&oq=best+ice+cream&aqs=chrome.1.69i57j0l5.5982j0j7&sourceid=chrome&ie=UTF-8";
        }
    }

    public void setIceCreamShop(Integer icCreamStore){
        setIceCreamInfo(icCreamStore);
    }

    public void setIceCreamShopURL(Integer iceCreamStore){
        setIceCreamInfo(iceCreamStore);
    }

    public String getIceCreamShop(){
        return iceCreamShop;
    }

    public String getIceCreamShopURL(){
        return iceCreamShopURL;
    }
}
