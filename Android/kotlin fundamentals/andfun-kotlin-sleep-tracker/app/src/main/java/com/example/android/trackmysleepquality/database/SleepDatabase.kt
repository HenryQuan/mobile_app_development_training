/*
 * Copyright 2018, The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.example.android.trackmysleepquality.database

import android.content.Context
import androidx.room.Database
import androidx.room.Room
import androidx.room.RoomDatabase

@Database(entities = [SleepNight::class], version = 1, exportSchema = false)
abstract class SleepDataBase : RoomDatabase() {
    abstract val sleepDatabaseDao: SleepDatabaseDao

    companion object {
        // It means that this will also be up to date
        @Volatile var INSTANCE: SleepDataBase? = null

        fun getInstance(context: Context) : SleepDataBase {
            // This a lock for the database is only initialised once
            synchronized(this) {
                var instance = INSTANCE
                if (instance == null) {
                    // Init the database here
                    instance = Room.databaseBuilder(
                            context.applicationContext,
                            SleepDataBase::class.java,
                            "sleep_history_database"
                    )
                            .fallbackToDestructiveMigration()
                            .build()

                    INSTANCE = instance
                }
                return instance
            }
        }
    }
}
