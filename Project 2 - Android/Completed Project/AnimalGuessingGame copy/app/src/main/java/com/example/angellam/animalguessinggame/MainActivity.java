package com.example.angellam.animalguessinggame;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    Boolean roundOver = false;
    int roundNumber = 1;
    int roundCount = 0;
    int numButtonPresses = 0;

    //For what the Button says
    Button titleButton;
    //For "What's your guess?" TextView
    TextView informText;
    //EditText - user's guess
    EditText userGuess;
    //Round Count
    TextView round;
    //"Submit" Button
    Button visibilitySubmitButton;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        //For what the Button says
        titleButton = (Button) findViewById(R.id.clueButton);
        //For "What's your guess?" TextView
        informText = (TextView) findViewById(R.id.whatsYourGuessTextView);
        //EditText
        userGuess = (EditText) findViewById(R.id.userGuessEditText);
        //For hiding "Submit" Button
        visibilitySubmitButton = (Button) findViewById(R.id.submitButton);

        round = (TextView) findViewById(R.id.roundCountTextView);
        if (roundNumber == 1) {
            round.setText("Round 1");
        } else if (roundNumber == 2) {
            round.setText("Round 2");
        } else if (roundNumber == 3) {
            round.setText("Round 3");
        }
    }


    //When "Clues" Button is clicked
    public void cluesButton (View view) {


        numButtonPresses = (numButtonPresses + 1) % 3;
        ImageView animalclues = (ImageView) findViewById(R.id.animalImageView);

        //Round One
        if (numButtonPresses == 0 && roundNumber == 1) {
            animalclues.setImageResource(R.drawable.fox1);
        } else if (numButtonPresses == 1 && roundNumber == 1) {
            animalclues.setImageResource(R.drawable.fox2);
        } else if (numButtonPresses == 2 && roundNumber == 1) {
            animalclues.setImageResource(R.drawable.fox3);
        }

        //Round Two
        if (numButtonPresses == 0 && roundNumber == 2) {
            animalclues.setImageResource(R.drawable.bear1);
        } else if (numButtonPresses == 1 && roundNumber == 2) {
            animalclues.setImageResource(R.drawable.bear2);
        } else if (numButtonPresses == 2 && roundNumber == 2) {
            animalclues.setImageResource(R.drawable.bear3);
        }

        //Round Three
        if (numButtonPresses == 0 && roundNumber == 3) {
            animalclues.setImageResource(R.drawable.turtle1);
        } else if (numButtonPresses == 1 && roundNumber == 3) {
            animalclues.setImageResource(R.drawable.turtle2);
        } else if (numButtonPresses == 2 && roundNumber ==3) {
            animalclues.setImageResource(R.drawable.turtle3);
        }

        //Go to Round Two
        //Reset screen
        if (roundOver && roundNumber == 1) {
            roundOver = false;
            numButtonPresses = 0;
            roundNumber = 2;
            round.setText("Round 2");
            animalclues.setImageResource(R.drawable.bear1);
            titleButton.setText(R.string.clue_button);
            informText.setText(R.string.whatsyourguess_text);
            userGuess.setVisibility(View.VISIBLE);
            visibilitySubmitButton.setVisibility(View.VISIBLE);
            userGuess.setText("");
        }

        //Go to Round Three
        if (roundOver && roundNumber == 2) {
            roundOver = false;
            numButtonPresses = 0;
            roundNumber = 3;
            round.setText("Round 3");
            animalclues.setImageResource(R.drawable.turtle1);
            titleButton.setText(R.string.clue_button);
            informText.setText(R.string.whatsyourguess_text);
            userGuess.setVisibility(View.VISIBLE);
            visibilitySubmitButton.setVisibility(View.VISIBLE);
            userGuess.setText("");
        }

        //Play Again
        if (titleButton.getText().equals("Play Again") && roundNumber == 3) {
            roundOver = false;
            numButtonPresses = 0;
            roundNumber = 1;
            round.setText("Round 1");
            roundCount = 0;
            animalclues.setImageResource(R.drawable.fox1);
            titleButton.setText(R.string.clue_button);
            informText.setText(R.string.whatsyourguess_text);
            userGuess.setVisibility(View.VISIBLE);
            visibilitySubmitButton.setVisibility(View.VISIBLE);
            userGuess.setText("");
        }
    }

    //When "Submit" Button is clicked
    public void submitButton (View view) {
        numButtonPresses = (numButtonPresses + 1) % 4;
        String guess = userGuess.getText().toString().toLowerCase();
        //.toLowerCase() found here: http://stackoverflow.com/questions/30450015/how-to-convert-uppercase-letter-to-lowercase

        //For ImageView full animal images
        ImageView fullImage = (ImageView) findViewById(R.id.animalImageView);


        //Round One
        if (numButtonPresses <= 3 && roundNumber == 1 && guess.length() != 0 && guess.equals("fox")) {
            //guess.length() from: http://stackoverflow.com/questions/38408960/how-to-check-if-an-edittext-boxs-is-empty-or-not-in-android-using-java
            fullImage.setImageResource(R.drawable.fox_full_image);
            //Set Clues button to "Next Round"
            titleButton.setText(R.string.next_round_button); //.setText from: http://stackoverflow.com/questions/11536326/android-settext-r-string-values
            userGuess.setVisibility(View.INVISIBLE); //.setVisibility from: http://stackoverflow.com/questions/5756136/how-to-hide-a-view-programmatically
            visibilitySubmitButton.setVisibility(View.INVISIBLE);
            informText.setText(R.string.guessed_right_textview);
            roundOver = true;
            roundCount += 1;
        } else if (numButtonPresses < 3 && roundNumber == 1 && guess.length() != 0 && !guess.equals("fox")) {
            //!guess.equals() for "not equals" from: http://stackoverflow.com/questions/16995809/opposite-of-java-equals-method
            informText.setText(R.string.guess_again_textview);
        } else if (numButtonPresses == 3 && roundNumber == 1 && guess.length() != 0 && !guess.equals("fox")) {
            fullImage.setImageResource(R.drawable.fox_full_image);
            titleButton.setText(R.string.next_round_button);
            userGuess.setVisibility(View.INVISIBLE);
            visibilitySubmitButton.setVisibility(View.INVISIBLE);
            informText.setText(R.string.fox_guessed_wrong_textview);
            roundOver = true;
        }

        //Round Two
        if (numButtonPresses <= 3 && roundNumber == 2 && guess.length() != 0 && guess.equals("bear")) {
            fullImage.setImageResource(R.drawable.bear_full_image);
            titleButton.setText(R.string.next_round_button);
            userGuess.setVisibility(View.INVISIBLE);
            visibilitySubmitButton.setVisibility(View.INVISIBLE);
            informText.setText(R.string.guessed_right_textview);
            roundOver = true;
            roundCount += 1;
        } else if (numButtonPresses < 3 && roundNumber == 2 && guess.length() != 0 && !guess.equals("bear")) {
            informText.setText(R.string.guess_again_textview);
        } else if (numButtonPresses == 3 && roundNumber == 2 && guess.length() != 0 && !guess.equals("bear")) {
            fullImage.setImageResource(R.drawable.bear_full_image);
            titleButton.setText(R.string.next_round_button);
            userGuess.setVisibility(View.INVISIBLE);
            visibilitySubmitButton.setVisibility(View.INVISIBLE);
            informText.setText(R.string.bear_guessed_wrong_textview);
            roundOver = true;
        }

        //Round Three
        if (numButtonPresses <= 3 && roundNumber == 3 && guess.length() != 0 && guess.equals("turtle")) {
            fullImage.setImageResource(R.drawable.turtle_full_image);
            titleButton.setText(R.string.play_again_button);
            userGuess.setVisibility(View.INVISIBLE);
            visibilitySubmitButton.setVisibility(View.INVISIBLE);
            roundCount += 1;
            informText.setText("You guessed right! \nYou got " + roundCount + " out of 3 rounds correct.");
            roundOver = true;
        } else if (numButtonPresses < 3 && roundNumber == 3 && guess.length() != 0 && !guess.equals("turtle")) {
            informText.setText(R.string.guess_again_textview);
        } else if (numButtonPresses == 3 && roundNumber == 3 && guess.length() != 0 && !guess.equals("turtle")) {
            fullImage.setImageResource(R.drawable.turtle_full_image);
            titleButton.setText(R.string.play_again_button);
            userGuess.setVisibility(View.INVISIBLE);
            visibilitySubmitButton.setVisibility(View.INVISIBLE);
            informText.setText("You guessed wrong! \nThe answer is \"Turtle.\" You got " + roundCount + " out of 3 rounds correct.");
            roundOver = true;
        }
    }
}
