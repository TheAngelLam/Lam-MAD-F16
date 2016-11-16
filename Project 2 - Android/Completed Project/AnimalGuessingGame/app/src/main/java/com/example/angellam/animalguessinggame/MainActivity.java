package com.example.angellam.animalguessinggame;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    Boolean roundOver = false;
    int roundNumber = 1;
    int roundCount = 0;
    int numButtonPresses = 0;

    //When "Clues" Button is clicked
    public void cluesButton (View view) {
        numButtonPresses = (numButtonPresses + 1) % 3;

        //Round One
        if (numButtonPresses == 0 && roundNumber == 1) {
            ImageView fox1 = (ImageView) findViewById(R.id.animalImageView);
            fox1.setImageResource(R.drawable.fox1);
        } else if (numButtonPresses == 1 && roundNumber == 1) {
            ImageView fox2 = (ImageView) findViewById(R.id.animalImageView);
            fox2.setImageResource(R.drawable.fox2);
        } else if (numButtonPresses == 2 && roundNumber == 1) {
            ImageView fox3 = (ImageView) findViewById(R.id.animalImageView);
            fox3.setImageResource(R.drawable.fox3);
        }

        //Round Two
        if (numButtonPresses == 0 && roundNumber == 2) {
            ImageView bear1 = (ImageView) findViewById(R.id.animalImageView);
            bear1.setImageResource(R.drawable.bear1);
        } else if (numButtonPresses == 1 && roundNumber == 2) {
            ImageView bear2 = (ImageView) findViewById(R.id.animalImageView);
            bear2.setImageResource(R.drawable.bear2);
        } else if (numButtonPresses == 2 && roundNumber == 2) {
            ImageView bear3 = (ImageView) findViewById(R.id.animalImageView);
            bear3.setImageResource(R.drawable.bear3);
        }

        //Round Three
        if (numButtonPresses == 0 && roundNumber == 3) {
            ImageView turtle1 = (ImageView) findViewById(R.id.animalImageView);
            turtle1.setImageResource(R.drawable.turtle1);
        } else if (numButtonPresses == 1 && roundNumber == 3) {
            ImageView turtle2 = (ImageView) findViewById(R.id.animalImageView);
            turtle2.setImageResource(R.drawable.turtle2);
        } else if (numButtonPresses == 2 && roundNumber ==3) {
            ImageView turtle3 = (ImageView) findViewById(R.id.animalImageView);
            turtle3.setImageResource(R.drawable.turtle3);
        }
    }

    //When "Submit" Button is clicked
    public void submitButton (View view) {
        numButtonPresses = (numButtonPresses + 1) % 4;
        //EditText
        EditText userGuess = (EditText) findViewById(R.id.userGuessEditText);
        String guess = userGuess.getText().toString().toLowerCase();
        //.toLowerCase() found here: http://stackoverflow.com/questions/30450015/how-to-convert-uppercase-letter-to-lowercase

        //For "Next Round" button
        Button title = (Button) findViewById(R.id.clueButton);

        //For hiding EditText
        EditText hideEditText = (EditText) findViewById(R.id.userGuessEditText);

        //For hiding "Submit" Button
        Button hideButton = (Button) findViewById(R.id.submitButton);

        //Round One
        if (numButtonPresses <= 3 && roundNumber == 1 && guess.length() != 0 && guess.equals("fox")) {
            //guess.length() from: http://stackoverflow.com/questions/38408960/how-to-check-if-an-edittext-boxs-is-empty-or-not-in-android-using-java
            ImageView foxFull = (ImageView) findViewById(R.id.animalImageView);
            foxFull.setImageResource(R.drawable.fox_full_image);
            //Set Clues button to "Next Round"
            title.setText(R.string.next_round_button); //.setText from: http://stackoverflow.com/questions/11536326/android-settext-r-string-values
            hideEditText.setVisibility(view.INVISIBLE); //.setVisibility from: http://stackoverflow.com/questions/5756136/how-to-hide-a-view-programmatically
            hideButton.setVisibility(view.INVISIBLE);
        }
    }
}
