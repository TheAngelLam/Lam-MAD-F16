package com.example.angellam.lab8_restaurants;

/**
 * Created by angellam on 12/1/16.
 */

public class Restaurants {
    private String restaurant;
    private String restaurantURL;

    private void setRestaurantInfo(Integer restaurantPreference){
        switch (restaurantPreference){
            case 0: //atmosphere
                restaurant = "Domo";
                restaurantURL = "http://domorestaurant.com/";
                break;
            case 1: //fine dining
                restaurant = "Mizuna";
                restaurantURL = "http://www.mizunadenver.com/#mizuna-denver";
                break;
            case 2: //casual
                restaurant = "Root Down";
                restaurantURL = "http://www.rootdowndenver.com/";
                break;
            case 3: //brewery & food
                restaurant = "The Post Brewing Company";
                restaurantURL = "http://www.postbrewing.com/";
                break;
            case 4: //tea & food
                restaurant = "The Boulder Dushanbe Teahouse";
                restaurantURL = "http://boulderteahouse.com/";
                break;
            default:
                restaurant = "none";
                restaurantURL = "https://www.google.com/search?q=best+restaurants+in+colorado&oq=best+restaurants+in+colorado&aqs=chrome..69i57j0l5.10775j0j4&sourceid=chrome&ie=UTF-8";
        }
    }

    public void setRestaurant(Integer restaurantPreference){
        setRestaurantInfo(restaurantPreference);
    }
    public void setRestaurantURL(Integer restaurantPreference){
        setRestaurant(restaurantPreference);
    }
    public String getRestaurant(){
        return restaurant;
    }
    public String getRestaurantURL(){
        return restaurantURL;
    }
}
