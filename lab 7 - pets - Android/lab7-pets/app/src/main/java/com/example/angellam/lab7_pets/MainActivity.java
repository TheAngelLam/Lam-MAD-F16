package com.example.angellam.lab7_pets;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.RadioGroup;
import android.widget.Spinner;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.ToggleButton;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    //When "Describe" Button is clicked
    public void describePet (View view) {
        //EditText-Your Name
        EditText name = (EditText) findViewById(R.id.nameEditText);
        String nameValue = name.getText().toString();

        //EditText-Your Pet's Name
        EditText petName = (EditText) findViewById(R.id.petEditText);
        String petNameValue = petName.getText().toString();

        //Spinner-Type of animal
        Spinner animalType = (Spinner) findViewById(R.id.animalSpinner);
        String animalTypeValue = String.valueOf(animalType.getSelectedItem());

        //RadioGroup_type of food
        RadioGroup food = (RadioGroup) findViewById(R.id.foodRadioGroup);
        String foodType;
        int food_id = food.getCheckedRadioButtonId();
        switch (food_id){
            case -1: //when nothing is selected
                foodType = "nothing";
                break;
            case R.id.humanRadioButton:
                foodType = "human food";
                break;
            case R.id.animalRadioButton:
                foodType = "animal food";
                break;
            default:
                foodType = "nothing";
        }

        //Toggle-Happy or Grumpy
        ToggleButton toggle = (ToggleButton) findViewById(R.id.happyToggleButton);
        boolean happy = toggle.isChecked();
        String happyString;
        if (happy) {
            happyString = "happy";
        } else {
            happyString = "grumpy";
        }

        //Switch-Playful
        Switch playfulSwitch = (Switch) findViewById(R.id.playfulSwitch);
        boolean playful = playfulSwitch.isChecked();
        String playfulString ="";
        if (playful) {
            playfulString = ", playful";
        }

        //CheckBoxes-Character
        String checkbox_string = "";

        CheckBox smart_checkbox = (CheckBox) findViewById(R.id.smartCheckBox);
        boolean smart_checked = smart_checkbox.isChecked();
        if (smart_checked) {
            checkbox_string += ", smart";
        }
        CheckBox goofy_checkbox = (CheckBox) findViewById(R.id.goofyCheckBox);
        boolean goofy_checked = goofy_checkbox.isChecked();
        if (goofy_checked) {
            checkbox_string += ", goofy";
        }
        CheckBox active_checkbox = (CheckBox) findViewById(R.id.activeCheckBox);
        boolean active_checked = active_checkbox.isChecked();
        if (active_checked) {
            checkbox_string += ", active";
        }
        CheckBox lazy_checkbox = (CheckBox) findViewById(R.id.lazyCheckBox);
        boolean lazy_checked = lazy_checkbox.isChecked();
        if (lazy_checked) {
            checkbox_string += ", lazy";
        }


        //Textview-Intructions
        TextView description = (TextView) findViewById(R.id.petDescriptionTextView);
        description.setText(nameValue + " has a " + animalTypeValue + " named " + petNameValue + " who is " + happyString + playfulString + checkbox_string + ", and eats " + foodType + ".");
    }
}
