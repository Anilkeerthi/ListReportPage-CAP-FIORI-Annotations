namespace travel.desk;

entity Employees {
  key EmployeeID : Integer;
  Name          : String;
  Email         : String;
  Phone         : String;
  Department    : String;
  Designation   : String;
  JoiningDate   : Date;
  ManagerID     : Integer;
  Location      : String;
  EmploymentType: String;
  Salary        : Decimal(10,2); 
  Rating        : Decimal(3,2)
  
}

entity TravelRequests {
  key RequestID  : Integer;
  EmployeeID     : Integer;
  Destination    : String;
  TravelDate     : Date;
  ReturnDate     : Date;
  Status         : String;

  
}

entity FlightBookings {
  key BookingID  : Integer;
  RequestID      : Integer;
  Airline        : String;
  FlightNumber   : String;
  DepartureTime  : DateTime;
  ArrivalTime    : DateTime;
}

entity HotelBookings {
  key BookingID  : Integer;
  RequestID      : Integer;
  HotelName      : String;
  CheckInDate    : Date;
  CheckOutDate   : Date;
  RoomType       : String;
}

entity Expenses {
  key ExpenseID  : Integer;
  RequestID      : Integer;
  ExpenseType    : String;
  Amount         : Decimal(10,2);
  Currency       : String;
  DateIncurred   : Date;
}








//---------- For Value Help----------//

// In the Value help we will get the entire data of perticular column data



annotate travel.desk.Employees with @(){
  Name @(Common.ValueList: {
  CollectionPath:'Employees',                             //Entity Name
  Parameters : [
    {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: 'Name',
                ValueListProperty: 'Name'                                     // Column Name
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'Email'                                      // Here what ever column we give that column should apper in the value list
            }
  ]
  });

  Department @(Common.ValueList:{
    CollectionPath:'Employees',
    Parameters : [
      {
        $Type:'Common.ValueListParameterInOut',
        LocalDataProperty: 'Department',
        ValueListProperty: 'Department'
      }
    ]
  })
};
