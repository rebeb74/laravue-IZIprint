<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\ImageUploadResource;
use App\Models\ImageUpload;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
// use Image;
use Intervention\Image\ImageManagerStatic as Image;

class ImagesUploadController extends Controller
{
    public function index()
    {
        return ImageUploadResource::collection(ImageUpload::all());
    }


    public function store(Request $request)
    {

        $request->validate([
            'file' => 'required|mimes:jpg,jpeg,png,pdf|max:2048',
            'name' => 'required',
            'alt_tag' => '',
            'title_tag' => ''
        ]);

        $imageUpload = new ImageUpload();

        $original_name = $request->file->getClientOriginalName();
        $file_name = bin2hex(random_bytes(2)) . '_' . $request->name . '.' . $request->file->extension();
        $thumb = Image::make($request->file('file'))->fit(300, null, function ($constraint) {
            $constraint->aspectRatio();
        });
        $thumb_file_name = 'thumb_' . $file_name;
        $request->file('file')->storeAs('uploads', $file_name, 'image_uploads');
        $thumb->save(public_path() . '/uploads/' . $thumb_file_name);
        // $request->file('file')->storeAs('image_uploads', $file_name, 'image_uploads');
        // $thumb->save(public_path() . '/image_uploads/' . $thumb_file_name);
        // $request->file('file')->storeAs('/image_uploads', $file_name, 'public');
        // $thumb->save(storage_path() . '/app/public/image_uploads/' . $thumb_file_name);

        $file_id = Str::uuid();
        $imageUpload->id = $file_id;
        $imageUpload->name = $file_name;
        $imageUpload->original_name = $original_name;
        $imageUpload->alt_tag = $request->alt_tag;
        $imageUpload->title_tag = $request->title_tag;
        $imageUpload->url = env('APP_URL') . '/uploads/' . $file_name;
        $imageUpload->thumb_url = env('APP_URL') . '/uploads/' . $thumb_file_name;
        $imageUpload->save();

        return new ImageUploadResource(ImageUpload::findOrFail($file_id));
    }

    public function update($id, Request $request) {
        $imageToEdit = ImageUpload::find($id);

        $imageToEdit->alt_tag = $request->alt_tag;
        $imageToEdit->title_tag = $request->title_tag;
        $imageToEdit->save();

        return new ImageUploadResource(ImageUpload::findOrFail($id));
    }

    public function destroy($id, Request $request)
    {
        $imageToDelete = ImageUpload::find($id);

        if ($imageToDelete) {
            $imageToDelete->delete();
            Storage::disk('public')->delete('image_uploads/' . $imageToDelete['name']);
            Storage::disk('public')->delete('image_uploads/thumb_' . $imageToDelete['name']);
        } else {
            error_log('Image non trouvée');
        }

        return response()->json([
            'message' => 'Image with id ' . $id . ' deleted'
        ]);
    }
}
