<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Trip extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'route',
        'base_price',
        'departure_time',
        'arrival_time',
        'is_active'
    ];

    protected $casts = [
        'route' => 'array',
        'departure_time' => 'datetime:H:i',
        'arrival_time' => 'datetime:H:i',
        'is_active' => 'boolean'
    ];

    public function schedules()
    {
        return $this->hasMany(TripSchedule::class);
    }

    public function getRouteAttribute($value)
    {
        return json_decode($value, true);
    }

    public function setRouteAttribute($value)
    {
        $this->attributes['route'] = json_encode($value);
    }

    public function getCitiesInRoute()
    {
        return City::whereIn('id', $this->route)->get();
    }

    public function isValidRoute($startCityId, $endCityId)
    {
        $startIndex = array_search($startCityId, $this->route);
        $endIndex = array_search($endCityId, $this->route);

        return $startIndex !== false && $endIndex !== false && $startIndex < $endIndex;
    }

    public function calculatePrice($startCityId, $endCityId)
    {
        if (!$this->isValidRoute($startCityId, $endCityId)) {
            return 0;
        }

        $startIndex = array_search($startCityId, $this->route);
        $endIndex = array_search($endCityId, $this->route);
        $distance = $endIndex - $startIndex;

        return $this->base_price * $distance;
    }
}
