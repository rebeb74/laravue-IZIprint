<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Mail\ContactMail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class ContactController extends Controller
{

    public function sendMail(Request $request) {

        $details = [
            'firstname' => $request->firstname,
            'lastname' => $request->lastname,
            'company' => $request->company,
            'email' => $request->email,
            'phone' => $request->phone,
            'content' => $request->content,
        ];

        
        Mail::to('bertrandpetit10@gmail.com')->send(new ContactMail($details));
        
        return response()->json([
            'mail_sent' => true
        ]);
    }
}

