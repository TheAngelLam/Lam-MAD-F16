package com.example.angellam.finalicecream;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.Spinner;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.ToggleButton;

public class FindIceCreamActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_find_ice_cream);
    }

    public void onTreatMeButtonPressed(View view) {
        //editText
        EditText nameTreat = (EditText) findViewById(R.id.nameTreatEditText);
        String nameValue = nameTreat.getText().toString();
        System.out.println(nameValue);

        //switch
        String dairyfreeString = "";
        Switch dairyfreeSwitch = (Switch) findViewById(R.id.dairyfreeSwitch);
        boolean dairyfree = dairyfreeSwitch.isChecked();
        if(dairyfree){
            dairyfreeString = " that is dairy free.";
        }

        //spinner
        Spinner iceCreamSpinner = (Spinner) findViewById(R.id.spinner);
        String iceCreamValue = String.valueOf(iceCreamSpinner.getSelectedItem());

        //toggle button
        ToggleButton toggle = (ToggleButton) findViewById(R.id.cupScoopToggleButton);
        boolean container = toggle.isChecked();
        String containerString;
        if(container){
            containerString = "cup";
        } else {
            containerString = "scoop";
        }


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
        iceCreamResult.setText("My " + nameValue + " is a " + iceCreamValue + " ice cream " + containerString + dairyfreeString);
    }
}
