namespace travel.desk;

entity Employees {
  key EmployeeID        : Integer;
      Name              : String;
      Email             : String;
      Phone             : String;
      Department        : String;
      Designation       : String;
      JoiningDate       : Date;
      ManagerID         : Integer;
      Location          : String;
      EmploymentType    : String;
      Salary            : Decimal(10, 2);
      Rating            : Decimal(3, 2);
      to_TravelRequests : Association to many TravelRequests
                            on to_TravelRequests.to_Employees = $self;
      to_FlightBookings : Association to many FlightBookings
                            on to_FlightBookings.to_Employees = $self;
      to_HotelBookings  : Association to many HotelBookings
                            on to_HotelBookings.to_Employees = $self;
      to_Expenses       : Association to many Expenses
                            on to_Expenses.to_Employees = $self
}

entity TravelRequests {
  key RequestID    : Integer;
      EmployeeID   : Integer;
      Destination  : String;
      TravelDate   : Date;
      ReturnDate   : Date;
      Status       : String;
      to_Employees : Association to Employees
}


entity FlightBookings {
  key BookingID     : Integer;
      RequestID     : Integer;
      Airline       : String;
      FlightNumber  : String;
      DepartureTime : DateTime;
      ArrivalTime   : DateTime;
      to_Employees  : Association to Employees
}

entity HotelBookings {
  key BookingID    : Integer;
      RequestID    : Integer;
      HotelName    : String;
      CheckInDate  : Date;
      CheckOutDate : Date;
      RoomType     : String;
      to_Employees : Association to Employees
}

entity Expenses {
  key ExpenseID    : Integer;
      RequestID    : Integer;
      ExpenseType  : String;
      Amount       : Decimal(10, 2);
      Currency     : String;
      DateIncurred : Date;
      to_Employees : Association to Employees
}




//---------- For Value Help----------//

// In the Value help we will get the entire data of perticular column data


annotate travel.desk.Employees with @() {
  Name       @(Common.ValueList: {
    CollectionPath: 'Employees', //Entity Name
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: 'Name',
        ValueListProperty: 'Name' // Column Name
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'Email' // Here what ever column we give that column should apper in the value list
      }
    ]
  });

 
};
