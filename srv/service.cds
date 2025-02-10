using travel.desk as travel from '../db/schema';

service travelService{
    entity Employees as projection on travel.Employees;
    entity TravelRequests as projection on travel.TravelRequests;
    entity FlightBookings as projection on travel.FlightBookings;
    entity HotelBookings as projection on travel.HotelBookings;
    entity Expenses as projection on travel.Expenses
}