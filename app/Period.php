<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Period extends Model
{
     protected $fillable = [
        "description",
        "cai",
        "rank_start",
        "rank_end",
        "deadline",
        "emission_point",
        "agency",
        "document_type",
        "status",
    ];
    public function sale()
    {
        return $this->hasMany('App\Sale');

    }
}
