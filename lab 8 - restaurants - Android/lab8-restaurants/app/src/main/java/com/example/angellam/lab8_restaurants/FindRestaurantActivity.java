package com.example.angellam.lab8_restaurants;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.Spinner;

import com.google.android.gms.appindexing.Action;
import com.google.android.gms.appindexing.AppIndex;
import com.google.android.gms.appindexing.Thing;
import com.google.android.gms.common.api.GoogleApiClient;


public class FindRestaurantActivity extends AppCompatActivity {

    private Restaurants myRestaurants = new Restaurants();
    /**
     * ATTENTION: This was auto-generated to implement the App Indexing API.
     * See https://g.co/AppIndexing/AndroidStudio for more information.
     */
    private GoogleApiClient client;

    public void findRestaurant(View view) {
        //get spinner
        Spinner restaurantSpinner = (Spinner) findViewById(R.id.spinner);
        //get spinner item position in array
        Integer preference = restaurantSpinner.getSelectedItemPosition();
        //set the restaurant
        myRestaurants.setRestaurant(preference);
        //get restaurant recommendation
        String suggestedRestaurant = myRestaurants.getRestaurant();
        //get URL of restaurant recommendation
        String suggestedRestaurantURL = myRestaurants.getRestaurantURL();
        System.out.println(suggestedRestaurant);
        System.out.println(suggestedRestaurantURL);

        //create intent
        Intent intent = new Intent(this, ReceiveRestaurantActivity.class);

        //pass data
        intent.putExtra("restaurantName", suggestedRestaurant);
        intent.putExtra("restaurantURL", suggestedRestaurantURL);

        //start intent
        startActivity(intent);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_find_restaurant);
        //get button
        final Button button = (Button) findViewById(R.id.button);
        //create listener
        View.OnClickListener onclick = new View.OnClickListener() {
            public void onClick(View view) {
                findRestaurant(view);
            }
        };
        //add listener to button
        button.setOnClickListener(onclick);
        // ATTENTION: This was auto-generated to implement the App Indexing API.
        // See https://g.co/AppIndexing/AndroidStudio for more information.
        client = new GoogleApiClient.Builder(this).addApi(AppIndex.API).build();
    }

    /**
     * ATTENTION: This was auto-generated to implement the App Indexing API.
     * See https://g.co/AppIndexing/AndroidStudio for more information.
     */
    public Action getIndexApiAction() {
        Thing object = new Thing.Builder()
                .setName("FindRestaurant Page") // TODO: Define a title for the content shown.
                // TODO: Make sure this auto-generated URL is correct.
                .setUrl(Uri.parse("http://[ENTER-YOUR-URL-HERE]"))
                .build();
        return new Action.Builder(Action.TYPE_VIEW)
                .setObject(object)
                .setActionStatus(Action.STATUS_TYPE_COMPLETED)
                .build();
    }

    @Override
    public void onStart() {
        super.onStart();

        // ATTENTION: This was auto-generated to implement the App Indexing API.
        // See https://g.co/AppIndexing/AndroidStudio for more information.
        client.connect();
        AppIndex.AppIndexApi.start(client, getIndexApiAction());
    }

    @Override
    public void onStop() {
        super.onStop();

        // ATTENTION: This was auto-generated to implement the App Indexing API.
        // See https://g.co/AppIndexing/AndroidStudio for more information.
        AppIndex.AppIndexApi.end(client, getIndexApiAction());
        client.disconnect();
    }
}
