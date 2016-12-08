package com.example.angellam.finalicecream;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
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

        TextView iceCreamResult = (TextView) findViewById(R.id.iceCreamResultTextView);
        iceCreamResult.setText("You really like " + iceCreamValue + " ice cream!");
    }
}
