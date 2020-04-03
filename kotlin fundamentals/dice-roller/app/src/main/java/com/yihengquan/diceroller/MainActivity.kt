package com.yihengquan.diceroller

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import android.widget.Toast
import java.util.*

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val rollButton: Button = findViewById(R.id.roll_button)
        rollButton.text = "Let's roll"
        rollButton.setOnClickListener {
            rollDice()
            Toast.makeText(this, "Dice is rolled", Toast.LENGTH_SHORT).show()
        }
    }

    private fun rollDice() {
        val textView: TextView = findViewById(R.id.result_text)
        val dice = Random().nextInt(6) + 1
        textView.text = dice.toString()
    }
}
