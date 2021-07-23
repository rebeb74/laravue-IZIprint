<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBlocksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('blocks', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->timestamps();
            
            $table->string('title');
            $table->string('subtitle')->nullable();
            $table->text('content');
            $table->unsignedTinyInteger('order');
            $table->string('int_link')->nullable();
            $table->string('int_btn')->nullable();
            $table->string('ext_link')->nullable();
            $table->string('ext_btn')->nullable();
            $table->boolean('image_on_right');
            $table->boolean('enabled');
            
            $table->string('page_id')->index();
            $table->foreign('page_id')->references('id')->on('pages');

            
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('blocks');
    }
}
