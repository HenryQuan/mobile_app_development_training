package com.yihengquan.aboutme

import android.content.Context
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.view.inputmethod.InputMethodManager
import android.widget.Button
import android.widget.EditText
import android.widget.TextView

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        findViewById<Button>(R.id.done_button).setOnClickListener {
            // "it" is the button
            addNickname(it)
        }
    }

    private fun addNickname(view: View) {
        val nickname_edit: EditText = findViewById(R.id.nickname_edit)
        val nickname_text: TextView = findViewById(R.id.nickname_text)

        nickname_text.text = nickname_edit.text
        // Hide the keyboard
        val imm = getSystemService(Context.INPUT_METHOD_SERVICE) as InputMethodManager
        imm.hideSoftInputFromWindow(view.windowToken, 0)

        nickname_edit.visibility = View.GONE
        nickname_text.visibility = View.VISIBLE
        view.visibility = View.GONE
    }

}
