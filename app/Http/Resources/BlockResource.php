<?php

namespace App\Http\Resources;

use App\Models\ImageUpload;
use Illuminate\Http\Resources\Json\JsonResource;

class BlockResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */

    private function imageUploadId()
    {
        if ($this->imageUpload) {
            return $this->imageUpload->id;
        } else {
            return null;
        }
    }

    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'title' => $this->title,
            'subtitle' => $this->subtitle,
            'content' => $this->content,
            'int_btn' => $this->int_btn,
            'int_link' => $this->int_link,
            'ext_btn' => $this->ext_btn,
            'ext_link' => $this->ext_link,
            'order' => $this->order,
            'image_upload' => new ImageUploadResource($this->imageUpload),
            'image_on_right' => $this->image_on_right,
            'enabled' => $this->enabled,
            'page_id' => $this->page->id,
            'image_upload_id' => $this->imageUploadId()
        ];
    }
}
