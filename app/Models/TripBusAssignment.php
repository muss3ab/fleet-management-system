<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class TripBusAssignment extends Model
{
    use HasFactory;

    protected $fillable = [
        'trip_schedule_id',
        'bus_id'
    ];

    public function tripSchedule()
    {
        return $this->belongsTo(TripSchedule::class);
    }

    public function bus()
    {
        return $this->belongsTo(Bus::class);
    }
}
