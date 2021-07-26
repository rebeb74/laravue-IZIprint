<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Page extends Model
{

    public function blocks()
    {
        return $this->hasMany(Block::class);
    }

    public function gallery()
    {
        return $this->hasMany(ImageUpload::class);
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
