<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Image extends Model
{
    public function Page()
    {
        return $this->belongsTo(Page::class);
    }
}
