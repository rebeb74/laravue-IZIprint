<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\ImageUpload;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;

class SiteController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // Delete old image
        $oldData = json_decode(Storage::disk('local')->get('seo.json'), true);
        if ($request->social_image['id'] != $oldData['social_image']['id']) {
            $imageToDelete = ImageUpload::find($oldData['social_image']['id']);
            if ($imageToDelete) {
                error_log('Image trouvée');
                $imageToDelete->delete();
                Storage::disk('local')->delete('image_uploads/' . $oldData['social_image']['name']);
                Storage::disk('local')->delete('image_uploads/thumb_' . $oldData['social_image']['name']);
            } else {
                error_log('Image non trouvée');
            }
        }

        // Save new Data
        $data = [
            "title" => $request->title,
            "description" => $request->description,
            "suffix" => $request->suffix,
            "social_image" => $request->social_image
        ];
        Storage::disk('local')->put('seo.json', json_encode($data));

        return $data;
    }

    public function index(Request $request)
    {
        return Storage::disk('local')->get('seo.json');
    }
}
