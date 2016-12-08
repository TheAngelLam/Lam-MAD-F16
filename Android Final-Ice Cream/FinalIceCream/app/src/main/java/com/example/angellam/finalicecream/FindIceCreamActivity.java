package com.example.angellam.finalicecream;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.ImageView;
import android.widget.Spinner;
import android.widget.TextView;

public class FindIceCreamActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_find_ice_cream);
    }

    public void onTreatMeButtonPressed(View view) {
        //spinner
        Spinner iceCreamSpinner = (Spinner) findViewById(R.id.spinner);
        String iceCreamValue = String.valueOf(iceCreamSpinner.getSelectedItem());

        //Image
        ImageView iceCreamImage = (ImageView) findViewById(R.id.iceCreamImageView);

        //set the image based on spinner selection
        switch (iceCreamValue){
            case "Death by Chocolate":
                iceCreamImage.setImageResource(R.drawable.chocolate);
                break;
            case "Salted Caramel":
                iceCreamImage.setImageResource(R.drawable.caramel);
                break;
            case "Cookies and Cream":
                iceCreamImage.setImageResource(R.drawable.cookiescream);
                break;
            default:
                break;
        }

        //Result TextView
        TextView iceCreamResult = (TextView) findViewById(R.id.iceCreamResultTextView);
        iceCreamResult.setText("You really like " + iceCreamValue + " ice cream!");
    }
}
