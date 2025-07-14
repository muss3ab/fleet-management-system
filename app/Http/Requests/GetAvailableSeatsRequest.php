<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class GetAvailableSeatsRequest extends FormRequest
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
            'start_city_id' => 'required|exists:cities,id',
            'end_city_id' => 'required|exists:cities,id|different:start_city_id',
            'travel_date' => 'required|date|after_or_equal:today'
        ];
    }

    public function messages()
    {
        return [
            'start_city_id.required' => 'Start city is required',
            'start_city_id.exists' => 'Selected start city does not exist',
            'end_city_id.required' => 'End city is required',
            'end_city_id.exists' => 'Selected end city does not exist',
            'end_city_id.different' => 'End city must be different from start city',
            'travel_date.required' => 'Travel date is required',
            'travel_date.date' => 'Travel date must be a valid date',
            'travel_date.after_or_equal' => 'Travel date must be today or in the future'
        ];
    }
}
