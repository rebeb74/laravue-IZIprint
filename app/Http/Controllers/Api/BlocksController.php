<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\BlockResource;
use App\Models\Block;
use App\Models\ImageUpload;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class BlocksController extends Controller
{
    public function store(Request $request)
    {
        $block = new Block();
        $block_id = Str::uuid();
        $block->id = $block_id;
        $block->title = $request->title;
        $block->subtitle = $request->subtitle;
        $block->content = $request->content;
        $block->order = $request->order;
        $block->int_link = $request->int_link;
        $block->int_btn = $request->int_btn;
        $block->ext_link = $request->ext_link;
        $block->ext_btn = $request->ext_btn;
        $block->image_on_right = $request->image_on_right;
        $block->enabled = $request->enabled;
        $block->page_id = $request->page_id;
        
        $block->save();
        
        if($request->image_upload_id) {
            $image_upload = ImageUpload::findOrFail($request->image_upload_id);
            $image_upload->block_id = $block_id;
            $image_upload->save();
        }

        
        return new BlockResource(Block::findOrFail($block_id));
    }
    
    public function index()
    {
        return BlockResource::collection(Block::all());
    }
    
    public function show($id)
    {
        return new BlockResource(Block::findOrFail($id));
    }
    
    public function update($id, Request $request)
    {
        $block = Block::findOrFail($id);
        $block->updated_at = time();
        $block->title = $request->title;
        $block->subtitle = $request->subtitle;
        $block->content = $request->content;
        $block->order = $request->order;
        $block->int_link = $request->int_link;
        $block->int_btn = $request->int_btn;
        $block->ext_link = $request->ext_link;
        $block->ext_btn = $request->ext_btn;
        $block->image_on_right = $request->image_on_right;
        $block->enabled = $request->enabled;
        $block->page_id = $request->page_id;

        $block->save();

        if($request->image_upload_id) {
            $image_upload = ImageUpload::findOrFail($request->image_upload_id);
            $image_upload->block_id = $id;
            $image_upload->save();
        }

        return new BlockResource(Block::findOrFail($id));
    }

    public function destroy($id)
    {
        $block = Block::findOrFail($id);

        $image_upload = ImageUpload::where('block_id', $id)->first();

        if ($image_upload){
            $image_upload->delete();
        }


        $block->delete();

        return response()->json([
            'message' => 'Block with id ' . $id . ' deleted'
        ]);
    }
}
