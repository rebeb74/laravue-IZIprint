<?php

use App\Models\User;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Schema;

class AddUsersToUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('users', function (Blueprint $table) {
            $data =  array(
                [
                    'name' => 'admin',
                    'email' => 'info@iziprint.re',
                    'password' => 'adminizi974',
                ],
            );
            foreach ($data as $datum){
                $page = new User(); //The Category is the model for your migration
                $page->name = $datum['name'];
                $page->email = $datum['email'];
                $page->password = Hash::make($datum['password']);
                $page->save();
            }
    
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('users', function (Blueprint $table) {
            //
        });
    }
}
