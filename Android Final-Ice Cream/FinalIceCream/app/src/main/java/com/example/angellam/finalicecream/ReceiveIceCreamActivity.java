package com.example.angellam.finalicecream;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.TextView;

public class ReceiveIceCreamActivity extends AppCompatActivity {

    private String iceCreamShop;
    private String iceCreamShopURL;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_receive_ice_cream);

        //get intent
        Intent intent = getIntent();
        iceCreamShop = intent.getStringExtra("iceCreamShopName");
        coffeeShopURL = intent.getStringExtra("iceCreamShopURL");
        System.out.println(IceCreamShop);
        System.out.println(IceCreamShopURL);

        //update TextView
        TextView messageView = (TextView) findViewById(R.id.iceCreamShopTextView);
        messageView.setText("You should check out " + iceCreamShop);
    }
}
