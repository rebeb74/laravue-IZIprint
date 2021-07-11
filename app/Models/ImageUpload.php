<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ImageUpload extends Model
{
    protected $fillable = [
        'name',
        'original_name',
        'alt_tag',
        'url',
        'thumb_url'
    ]; 
    public function Page()
    {
        return $this->belongsTo(Page::class);
    }

    public function getIncrementing()
    {
        return false;
    }

    public function getKeyType()
    {
        return 'string';
    }
}
