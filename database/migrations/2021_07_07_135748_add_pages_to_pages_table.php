<?php

use App\Models\Page;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Str;

class AddPagesToPagesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('pages', function (Blueprint $table) {
            $data =  array(
                [
                    'key' => 'home',
                    'name' => 'Accueil',
                    'title' => 'TITRE Accueil',
                    'description' => 'Description Accueil. Ceci est une très longue description pour le référencement de google.',
                    'order' => 1,
                ],
                [
                    'key' => 'enseignes',
                    'name' => 'Enseignes',
                    'title' => 'TITRE Enseignes',
                    'description' => 'Description Enseignes. Ceci est une très longue description pour le référencement de google.',
                    'order' => 2,
                ],
                [
                    'key' => 'vehicules',
                    'name' => 'Véhicules',
                    'title' => 'TITRE Véhicules',
                    'description' => 'Description Véhicules. Ceci est une très longue description pour le référencement de google.',
                    'order' => 3,
                ],
                [
                    'key' => 'signaletique',
                    'name' => 'Signalétique',
                    'title' => 'TITRE Signalétique',
                    'description' => 'Description Signalétique. Ceci est une très longue description pour le référencement de google.',
                    'order' => 4,
                ],
                [
                    'key' => 'packaging',
                    'name' => 'Packaging',
                    'title' => 'TITRE Packaging',
                    'description' => 'Description Packaging. Ceci est une très longue description pour le référencement de google.',
                    'order' => 5,
                ],
                [
                    'key' => 'plv',
                    'name' => 'PLV',
                    'title' => 'TITRE PLV',
                    'description' => 'Description PLV. Ceci est une très longue description pour le référencement de google.',
                    'order' => 6,
                ],
                [
                    'key' => 'about_us',
                    'name' => 'A propos',
                    'title' => 'TITRE A propos',
                    'description' => 'Description A propos. Ceci est une très longue description pour le référencement de google.',
                    'order' => 7,
                ],
                [
                    'key' => 'devis',
                    'name' => 'Devis',
                    'title' => 'TITRE Devis',
                    'description' => 'Description Devis. Ceci est une très longue description pour le référencement de google.',
                    'order' => 8,
                ],
                [
                    'key' => 'contact',
                    'name' => 'Contact',
                    'title' => 'TITRE Contact',
                    'description' => 'Description Contact. Ceci est une très longue description pour le référencement de google.',
                    'order' => 9,
                ],
            );
            foreach ($data as $datum){
                $page = new Page(); //The Category is the model for your migration
                $page->id = Str::uuid();
                $page->key = $datum['key'];
                $page->name = $datum['name'];
                $page->title = $datum['title'];
                $page->description = $datum['description'];
                $page->order = $datum['order'];
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
        Schema::table('pages', function (Blueprint $table) {
            //
        });
    }
}
