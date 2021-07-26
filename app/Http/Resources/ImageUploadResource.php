<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ImageUploadResource extends JsonResource
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
            'name' => $this->name,
            'title_tag' => $this->title_tag,
            'alt_tag' => $this->alt_tag,
            'original_name' => $this->original_name,
            'url' => $this->url,
            'thumb_url' => $this->thumb_url,
            'block_id' => $this->block_id,
            'page_id' => $this->page_id,
            'created_at' => $this->created_at
        ];
    }
}
