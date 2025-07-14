<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class BookSeatRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'trip_schedule_id' => 'required|exists:trip_schedules,id',
            'seat_id' => 'required|exists:bus_seats,id',
            'start_city_id' => 'required|exists:cities,id',
            'end_city_id' => 'required|exists:cities,id|different:start_city_id'
        ];
    }

    public function messages()
    {
        return [
            'trip_schedule_id.required' => 'Trip schedule is required',
            'trip_schedule_id.exists' => 'Selected trip schedule does not exist',
            'seat_id.required' => 'Seat selection is required',
            'seat_id.exists' => 'Selected seat does not exist',
            'start_city_id.required' => 'Start city is required',
            'start_city_id.exists' => 'Selected start city does not exist',
            'end_city_id.required' => 'End city is required',
            'end_city_id.exists' => 'Selected end city does not exist',
            'end_city_id.different' => 'End city must be different from start city'
        ];
    }
}
