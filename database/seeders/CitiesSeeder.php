<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\City;

class CitiesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $cities = [
            ['name' => 'Cairo', 'code' => 'CAI'],
            ['name' => 'Giza', 'code' => 'GIZ'],
            ['name' => 'AlFayyum', 'code' => 'FAY'],
            ['name' => 'AlMinya', 'code' => 'MIN'],
            ['name' => 'Asyut', 'code' => 'ASY'],
            ['name' => 'Sohag', 'code' => 'SOH'],
            ['name' => 'Luxor', 'code' => 'LUX'],
            ['name' => 'Aswan', 'code' => 'ASW']
        ];

        foreach ($cities as $city) {
            City::create($city);
        }
    }
}
