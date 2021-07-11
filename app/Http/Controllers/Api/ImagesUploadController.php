<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\ImageUpload;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
// use Image;
use Intervention\Image\ImageManagerStatic as Image;

class ImagesUploadController extends Controller
{
    public function upload(Request $request){
            
        $request->validate([
           'file' => 'required|mimes:jpg,jpeg,png,csv,txt,xlx,xls,pdf|max:2048',
           'name' => 'required',
           'alt_tag' => 'required',
           'title_tag' => 'required'
        ]);

        // dd($request);
        $imageUpload = new ImageUpload();
        
        if($request->file() && $request->name && $request->alt_tag && $request->title_tag) {
            $original_name = $request->file->getClientOriginalName();
            $file_name = bin2hex(random_bytes(2)).'_'.$request->name.'.'.$request->file->extension();
            $thumb = Image::make($request->file('file'))->fit(300, null, function ($constraint) {
                $constraint->aspectRatio();
            });
            $thumb_file_name = 'thumb_'.$file_name;
            $request->file('file')->storeAs('image_uploads', $file_name, 'public');
            $thumb->save(storage_path().'/app/public/image_uploads/'.$thumb_file_name);

            $file_id = Str::uuid();
            $imageUpload->$file_id;
            $imageUpload->name = $file_name;
            $imageUpload->original_name = $original_name;
            $imageUpload->alt_tag = $request->alt_tag;
            $imageUpload->title_tag = $request->title_tag;
            $imageUpload->url = '/storage/app/public/image_uploads/'.$file_name;
            $imageUpload->thumb_url = '/storage/app/public/image_uploads/'.$thumb_file_name;
            $imageUpload->save();

            return response()->json([
                'id' => $file_id,
                'name' => $file_name,
                'original_name' => $original_name,
                'alt_tag' => $request->alt_tag,
                'title_tag' => $request->title_tag,
                'url' => '/storage/app/public/image_uploads/'.$file_name,
                'thumb_url' => '/storage/app/public/image_uploads/'.$thumb_file_name
            ]);
        }
   }
}
