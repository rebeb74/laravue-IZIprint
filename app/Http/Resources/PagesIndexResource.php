<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class PagesIndexResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'key' => $this->key,
            'name' => $this->name,
            'title' => $this->title,
            'description' => $this->description,
            'og_url' => $this->og_url,
            'social_title' => $this->social_title,
            'order' => $this->order,
            'image_id' => $this->image_id,
        ];
    }
}
