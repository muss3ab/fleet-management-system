# Fleet Management System (Bus Booking System)

A comprehensive bus booking system built with Laravel 10, featuring seat booking, route management, and real-time availability checking.

## Features

-   **Multi-city Route Support**: Book seats between any two cities on a route
-   **Smart Seat Management**: Prevents overbooking and handles partial route bookings
-   **Real-time Availability**: Get available seats for specific routes and dates
-   **Comprehensive API**: RESTful API for web and mobile applications
-   **Robust Testing**: Unit and feature tests included
-   **Docker Support**: One-command deployment with Docker Compose

## System Requirements

-   PHP 8.1 or higher
-   MySQL 8.0 or higher
-   Composer
-   Postman For Api Testing [Collection Attached in root folder ]

## Installation

### Option 1: Docker Setup

1. Clone the repository:

```bash
git clone <repository-url>
cd fleet-management-system
```

2. Run the application:

```bash
docker-compose up -d
```

3. Setup the application:

```bash
docker-compose exec app php artisan migrate --seed
docker-compose exec app php artisan key:generate
```

The application will be available at `http://localhost:8080`

### Option 2: Manual Setup (Recommended)

1. Clone the repository:

```bash
git clone <repository-url>
cd fleet-management-system
```

2. Install dependencies:

```bash
composer install
```

3. Setup environment:

```bash
cp .env.example .env
php artisan key:generate
```

4. Configure database in `.env`:

```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=fleet_management
DB_USERNAME=your_username
DB_PASSWORD=your_password
```

5. Run migrations and seed data:

```bash
php artisan migrate --seed
```

6. Start the development server:

```bash
php artisan serve
```

## Database Structure

The system uses the following main tables:

-   **cities**: Egyptian cities as stations
-   **trips**: Predefined routes between cities
-   **trip_schedules**: Specific trip instances with dates
-   **buses**: Bus fleet information
-   **bus_seats**: Individual seats (12 per bus)
-   **bookings**: User seat bookings
-   **users**: System users

## API Endpoints

### Authentication

All API endpoints require authentication using Laravel Sanctum.

### Get Available Seats

```http
GET /api/available-seats
```

**Parameters:**

-   `start_city_id` (required): Starting city ID
-   `end_city_id` (required): Destination city ID
-   `travel_date` (required): Travel date (YYYY-MM-DD)

**Response:**

```json
{
    "success": true,
    "data": [
        {
            "trip_schedule_id": 1,
            "seat_id": 5,
            "seat_number": "05",
            "trip_name": "Cairo to Asyut Express",
            "departure_time": "08:00",
            "arrival_time": "14:00",
            "price": 150.0
        }
    ]
}
```

### Book a Seat

```http
POST /api/book-seat
```

**Parameters:**

-   `trip_schedule_id` (required): Trip schedule ID
-   `seat_id` (required): Seat ID to book
-   `start_city_id` (required): Starting city ID
-   `end_city_id` (required): Destination city ID

**Response:**

```json
{
    "success": true,
    "message": "Seat booked successfully",
    "data": {
        "id": 1,
        "booking_reference": "BK6759A2F8",
        "trip_name": "Cairo to Asyut Express",
        "travel_date": "2024-12-01",
        "start_city": "Cairo",
        "end_city": "Asyut",
        "seat_number": "05",
        "price": 150.0,
        "status": "confirmed"
    }
}
```

### Get User Bookings

```http
GET /api/user-bookings
```

**Response:**

```json
{
    "success": true,
    "data": [
        {
            "id": 1,
            "booking_reference": "BK6759A2F8",
            "trip_name": "Cairo to Asyut Express",
            "travel_date": "2024-12-01",
            "departure_time": "08:00",
            "arrival_time": "14:00",
            "start_city": "Cairo",
            "end_city": "Asyut",
            "seat_number": "05",
            "price": 150.0,
            "status": "confirmed",
            "created_at": "2024-11-15T10:30:00.000000Z"
        }
    ]
}
```

## How the Booking System Works

### Route-based Booking

The system supports booking between any two cities on a route. For example, for a route `Cairo → AlFayyum → AlMinya → Asyut`, users can book:

-   Cairo to AlFayyum
-   Cairo to AlMinya
-   Cairo to Asyut
-   AlFayyum to AlMinya
-   AlFayyum to Asyut
-   AlMinya to Asyut

### Seat Availability Logic

The system prevents overbooking by checking route overlaps:

-   If a seat is booked from Cairo to AlMinya, it cannot be booked for Cairo to AlFayyum (overlap)
-   But it can be booked for AlMinya to Asyut (no overlap)

### Pricing

Prices are calculated based on distance (number of cities between start and end points) multiplied by the base price.

## Administration

### Creating Trip Schedules

Use the artisan command to create new trip schedules:

```bash
php artisan trip:create-schedule {trip_id} {travel_date} {bus_id}
```

Example:

```bash
php artisan trip:create-schedule 1 2025-07-15 1
```

## Testing

Run the test suite:

```bash
php artisan test
```

## Database Seeding

The system includes seeders for:

-   Egyptian cities (Cairo, Giza, AlFayyum, AlMinya, Asyut, Sohag, Luxor, Aswan)
-   Sample buses with 12 seats each
-   Sample trips with multi-city routes

Run seeders:

```bash
php artisan db:seed
```

## Architecture Highlights

### Service Layer

-   **BookingService**: Handles complex booking logic and seat availability
-   Separation of concerns between controllers and business logic
-   Transaction support for data consistency

### Database Design

-   Normalized structure with proper foreign keys
-   JSON field for flexible route storage
-   Unique constraints to prevent duplicate bookings

### Security

-   Laravel Sanctum for API authentication
-   Request validation with custom form requests
-   SQL injection prevention with Eloquent ORM

### Performance

-   Efficient queries with proper relationships
-   Database indexing on frequently queried fields
-   Optimized seat availability checking

## License

This project is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).

## Support

For support and questions, please create an issue in the GitHub repository.

---

**Note**: This system is designed for educational and demonstration purposes. For production use, consider additional features like payment processing, email notifications, and advanced reporting.
