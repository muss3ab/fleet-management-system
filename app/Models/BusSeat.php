<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class BusSeat extends Model
{
    use HasFactory;

    protected $fillable = [
        'bus_id',
        'seat_number',
        'is_active'
    ];

    protected $casts = [
        'is_active' => 'boolean'
    ];

    public function bus()
    {
        return $this->belongsTo(Bus::class);
    }

    public function bookings()
    {
        return $this->hasMany(Booking::class);
    }
}
