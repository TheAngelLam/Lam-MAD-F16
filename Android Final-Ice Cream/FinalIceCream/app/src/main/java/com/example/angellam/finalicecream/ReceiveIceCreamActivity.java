package com.example.angellam.finalicecream;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
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
        iceCreamShopURL = intent.getStringExtra("iceCreamShopURL");
        System.out.println(iceCreamShop);
        System.out.println(iceCreamShopURL);

        //update TextView
        TextView messageView = (TextView) findViewById(R.id.iceCreamShopTextView);
        messageView.setText("You should check out " + iceCreamShop);

        //get button
        final Button button = (Button) findViewById(R.id.websiteButton);
        //create listener
        View.OnClickListener onclick = new View.OnClickListener(){
            public void onClick(View view){
                loadWebsite(view);
            }
        };

        //add listener to button
        button.setOnClickListener(onclick);
    }

    public void loadWebsite (View view){
        Intent intent = new Intent(Intent.ACTION_VIEW);
        intent.setData(Uri.parse(iceCreamShopURL));
        startActivity(intent);
    }
}
