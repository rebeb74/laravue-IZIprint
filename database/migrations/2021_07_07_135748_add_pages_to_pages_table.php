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
                    'key' => '',
                    'name' => 'Accueil',
                    'title' => 'TITRE Accueil',
                    'description' => 'Description Accueil',
                    'og_url' => 'OG_URL Accueil',
                    'social_title' => 'SOCIAL TITLE Accueil',
                    'order' => 1,
                ],
                [
                    'key' => 'enseignes',
                    'name' => 'Enseignes',
                    'title' => 'TITRE Enseignes',
                    'description' => 'Description Enseignes',
                    'og_url' => 'OG_URL Enseignes',
                    'social_title' => 'SOCIAL TITLE Enseignes',
                    'order' => 2,
                ],
                [
                    'key' => 'vehicules',
                    'name' => 'Véhicules',
                    'title' => 'TITRE Véhicules',
                    'description' => 'Description Véhicules',
                    'og_url' => 'OG_URL Véhicules',
                    'social_title' => 'SOCIAL TITLE Véhicules',
                    'order' => 3,
                ],
                [
                    'key' => 'signaletique',
                    'name' => 'Signalétique',
                    'title' => 'TITRE Signalétique',
                    'description' => 'Description Signalétique',
                    'og_url' => 'OG_URL Signalétique',
                    'social_title' => 'SOCIAL TITLE Signalétique',
                    'order' => 4,
                ],
                [
                    'key' => 'packaging',
                    'name' => 'Packaging',
                    'title' => 'TITRE Packaging',
                    'description' => 'Description Packaging',
                    'og_url' => 'OG_URL Packaging',
                    'social_title' => 'SOCIAL TITLE Packaging',
                    'order' => 5,
                ],
                [
                    'key' => 'plv',
                    'name' => 'PLV',
                    'title' => 'TITRE PLV',
                    'description' => 'Description PLV',
                    'og_url' => 'OG_URL PLV',
                    'social_title' => 'SOCIAL TITLE PLV',
                    'order' => 6,
                ],
                [
                    'key' => 'about_us',
                    'name' => 'A propos',
                    'title' => 'TITRE A propos',
                    'description' => 'Description A propos',
                    'og_url' => 'OG_URL A propos',
                    'social_title' => 'SOCIAL TITLE A propos',
                    'order' => 7,
                ],
                [
                    'key' => 'devis',
                    'name' => 'Devis',
                    'title' => 'TITRE Devis',
                    'description' => 'Description Devis',
                    'og_url' => 'OG_URL Devis',
                    'social_title' => 'SOCIAL TITLE Devis',
                    'order' => 8,
                ],
                [
                    'key' => 'contact',
                    'name' => 'Contact',
                    'title' => 'TITRE Contact',
                    'description' => 'Description Contact',
                    'og_url' => 'OG_URL Contact',
                    'social_title' => 'SOCIAL TITLE Contact',
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
                $page->og_url = $datum['og_url'];
                $page->social_title = $datum['social_title'];
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
