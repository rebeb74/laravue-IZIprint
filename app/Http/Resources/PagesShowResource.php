<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class PagesShowResource extends JsonResource
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
            'id' => $this->id,
            'key' => $this->key,
            'name' => $this->name,
            'title' => $this->title,
            'description' => $this->description,
            'order' => $this->order,
            'blocks' => BlockResource::collection($this->blocks),
            'gallery' => ImageUploadResource::collection($this->gallery)->sortBy('created_at')
        ];
    }
}
