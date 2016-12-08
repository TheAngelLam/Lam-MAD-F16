package com.example.angellam.finalicecream;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.RadioGroup;
import android.widget.Spinner;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.ToggleButton;

public class FindIceCreamActivity extends AppCompatActivity {

    private iceCreamShop myiceCreamShop = new iceCreamShop();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_find_ice_cream);

        //get button
        final Button button = (Button) findViewById(R.id.findTreatButton);
        //listener
        View.onClickListener onClick = new View.OnClickListener(){
            public void onClick(View view){
                findTreat();
            }
        };
        //add listener to button
        button.setOnClickListener(onClick);
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
            dairyfreeString = " that is dairy free";
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

        //radio button
        RadioGroup treatType = (RadioGroup) findViewById(R.id.treatTypeRadioGroup);
        String treatTypeValue = "";
        int treatId = treatType.getCheckedRadioButtonId();
        switch (treatId){
            case -1:
                treatTypeValue = " treat ";
                break;
            case R.id.iceCreamRadioButton1:
                treatTypeValue = " ice cream ";
                break;
            case R.id.frozenYogurtRadioButton2:
                treatTypeValue = " frozen yogurt ";
                break;
            case R.id.gelatoRadioButton3:
                treatTypeValue = " gelato ";
                break;
            default:
                treatTypeValue = " treat ";
        }

        //checkboxes
        String checkboxString = "";
        CheckBox sprinklescheck1 = (CheckBox) findViewById(R.id.sprinkleCcheckBox1);
        boolean sprinkleschecked1 = sprinklescheck1.isChecked();
        if(sprinkleschecked1){
            checkboxString += " sprinkles";
        }

        CheckBox hotfudgecheck2 = (CheckBox) findViewById(R.id.hotfudgeCheckBox2);
        boolean hotfudgechecked2 = hotfudgecheck2.isChecked();
        if(hotfudgechecked2){
            checkboxString += " hot fudge";
        }

        CheckBox nutscheck3 = (CheckBox) findViewById(R.id.nutsCheckBox3);
        boolean nutschecked3 = nutscheck3.isChecked();
        if(nutschecked3){
            checkboxString += " nuts";
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
        iceCreamResult.setText("My " + nameValue + " is a " + iceCreamValue + treatTypeValue + containerString + dairyfreeString + " with" + checkboxString);
    }

    public void findTreat(View view){
        //get spinner
        Spinner findTreatSpinner = (Spinner) findViewById(R.id.spinner);
        //get spinner array position
        Integer store = findTreatSpinner.getSelectedItemPosition();
        //set ice cream shop
        myiceCreamShop.setIceCreamShop(store);
        //get suggested ice cream store
        String suggestedIceCreamStore = myiceCreamShop.getIceCreamShop();
        //get URL of suggested store
        String suggestedIceCreamStoreURL = myiceCreamShop.getIceCreamShopURL();
        System.out.println(suggestedIceCreamStore);
        System.out.println(suggestedIceCreamStoreURL);
    }
}
