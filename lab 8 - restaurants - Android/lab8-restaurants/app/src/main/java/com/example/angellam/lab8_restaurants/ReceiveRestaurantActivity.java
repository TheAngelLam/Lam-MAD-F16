package com.example.angellam.lab8_restaurants;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class ReceiveRestaurantActivity extends AppCompatActivity {

    private String restaurant;
    private String restaurantURL;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_receive_restaurant);

        //get intent
        Intent intent = getIntent();
        restaurant = intent.getStringExtra("restaurantName");
        restaurantURL = intent.getStringExtra("restaurantURL");
        System.out.println(restaurant);
        System.out.println(restaurantURL);

        //update TextView
        TextView messageView = (TextView)findViewById(R.id.restaurantTextView);
        messageView.setText("You should try " + restaurant);

        //get button
        final Button button = (Button)findViewById(R.id.urlButton);
        //create listener
        View.OnClickListener onclick = new View.OnClickListener(){
            public void onClick(View view){
                loadWebSite(view);
            }
        };
        //add listener to button
        button.setOnClickListener(onclick);

    }

    public void loadWebSite(View view){
        Intent intent = new Intent(Intent.ACTION_VIEW);
        intent.setData(Uri.parse(restaurantURL));
        startActivity(intent);
    }
}
