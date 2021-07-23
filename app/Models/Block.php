<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Block extends Model
{
    protected $fillable = [
        'title',
        'subtitle',
        'content',
        'order',
        'int_btn',
        'int_link',
        'ext_btn',
        'ext_link',
        'enabled'
    ]; 

    protected $casts = [
        'enabled' => 'boolean',
        'image_on_right' => 'boolean',
    ];

    public function page()
    {
        return $this->belongsTo(Page::class);
    }

    public function imageUpload()
    {
        return $this->hasOne(ImageUpload::class);
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
