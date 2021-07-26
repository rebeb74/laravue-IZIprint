<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddPageForeignKeyToImageUploadsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('image_uploads', function (Blueprint $table) {
            $table->string('page_id')->index()->nullable();
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
        Schema::table('image_uploads', function (Blueprint $table) {
            $table->dropForeign(['page_id']);
            $table->dropColumn('page_id');
        });
    }
}
