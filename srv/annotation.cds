using travelService as travel from './service';


annotate travel.Employees with @(

  UI.DataPoint #Rating: {
    Value        : Rating,
    TargetValue  : 5, // Assuming a maximum rating of 5
    Visualization: #Rating
  },
   // Define DataPoint for Rating Chart
  UI.DataPoint #RatingChart: {
    Title                : 'Employee Rating Trend',
    Value                : Rating,
    TargetValue          : 5,
    CriticalityCalculation: {
      ImprovementDirection    : #Target,
      DeviationRangeHighValue : 4.5,
      DeviationRangeLowValue  : 2.0,
      ToleranceRangeHighValue : 4.0,
      ToleranceRangeLowValue  : 3.0
    }
  },

  // Define Chart
  UI.Chart #EmployeeRatingChart: {
    $Type        : 'UI.ChartDefinitionType',
    Title        : 'Employee Rating Trend',
    Description  : 'Area Micro Chart for Employee Ratings',
    ChartType    : #Line,  // You can use #Donut, #Bullet, etc.we can use different types of Charts here
    Dimensions   : [
      EmployeeID  // Time or Category Dimension              
    ],
    Measures     : [
      Rating                           // measure propety
    ],
    MeasureAttributes: [
      {
        $Type    : 'UI.ChartMeasureAttributeType',
        Measure  : Rating,
        Role     : #Axis1,
        DataPoint: '@UI.DataPoint#RatingChart'
      }
    ]
  },


    // DataPoint for Salary Display
  UI.DataPoint #Salary: {
    Value        : Salary,
    TargetValue  : 200000, // Example max salary target
    Visualization: #Rating
  },

  // Define DataPoint for Salary Chart
  UI.DataPoint #SalaryChart: {
    Title                : 'Employee Salary Trend',
    Value                : Salary,
    TargetValue          : 200000,
    CriticalityCalculation: {
      ImprovementDirection    : #Maximize,
      DeviationRangeHighValue : 180000,
      DeviationRangeLowValue  : 50000,
      ToleranceRangeHighValue : 150000,
      ToleranceRangeLowValue  : 80000
    }
  },

  // Define Chart for Salary Trend
  UI.Chart #EmployeeSalaryChart: {
    $Type        : 'UI.ChartDefinitionType',
    Title        : 'Employee Salary Trend',
    Description  : 'Bar Chart for Employee Salaries',
    ChartType    : #Column,  // You can use #Donut, #Bullet, etc.
    Dimensions   : [
      EmployeeID  // Time or Category Dimension              
    ],
    Measures     : [
      Salary                          // Measure property
    ],
    MeasureAttributes: [
      {
        $Type    : 'UI.ChartMeasureAttributeType',
        Measure  : Salary,
        Role     : #Axis1,
        DataPoint: '@UI.DataPoint#SalaryChart'
      }
    ]
  },

  

  //LineItem

  UI                  : {
    LineItem       : [

      {
        $Type            : 'UI.DataField',
        Value            : EmployeeID,
        Label            : 'EmployeeID',
        ![@UI.Importance]: #Low,
      //Criticality       : #Positive,        //Display the different colors for the particular column

      },
      {
        $Type            : 'UI.DataField',
        Label            : 'Name',
        Value            : Name,
        ![@UI.Importance]: #Low

      },
      {
        $Type            : 'UI.DataField',
        Label            : 'Phone',
        Value            : Phone,
        ![@UI.Hidden]       :True,
        ![@UI.Importance]: #High

      },
      {
        $Type            : 'UI.DataField',
        Label            : 'Email',
        Value            : Email,
        ![@UI.Importance]: #High
      //Criticality       : #Critical,
      },
      {
        $Type : 'UI.DataFieldForAnnotation',
        Label : 'Rating',
        Target: '@UI.DataPoint#Rating'
      },
      {
        $Type : 'UI.DataFieldForAction', // button type
        Action: 'travelService.ApproveEmployee', // for display the button
        Label : 'Accept'
      },
      {
        $Type : 'UI.DataFieldForAction',
        Action: 'travelService.RejectEmployee',
        Label : 'Reject'
      }

    // { $Type: 'UI.DataField', Value: Email, Label: 'Order ID' },

    ],
           
    SelectionFields: [
      EmployeeID,
      Name,
      Department
    ]
  },

  //-------------------------------- Object Page ---------------------------//

  //Page Header
  UI                  : {
    HeaderInfo                     : {
      $Type         : 'UI.HeaderInfoType',
      TypeName      : 'TravelDesk',
      TypeNamePlural: 'Employees', // With this we can display the title in the Table and count also
      Title         : {Value: Name} // From the entity column

    },
    //DeleteHidden                   : true,         // We can remove the delete button in ObjectPage

    FieldGroup #Headers            : { // If we want to show the header fields in the Object Page, HeaderFacets
      $Type: 'UI.FieldGroupType',
      Data : [
        {
          $Type            : 'UI.DataField',
          Label            : 'EmployeeID',
          Value            : EmployeeID,
          ![@UI.Importance]: #Low
        },
        {
          $Type            : 'UI.DataField',
          Label            : 'Department',
          Value            : Department,
          ![@UI.Importance]: #Low
        },
        {
          $Type            : 'UI.DataField',
          Label            : 'Designation',
          Value            : Designation,
          ![@UI.Importance]: #Low
        },
        {
          $Type            : 'UI.DataField',
          Label            : 'EmploymentType',
          Value            : EmploymentType,
          ![@UI.Importance]: #Low
        },

      ]


    },



    FieldGroup #EmployeeInformation: {
      $Type: 'UI.FieldGroupType',
      Data : [
        {
          $Type            : 'UI.DataField',
          Label            : 'JoiningDate',
          Value            : JoiningDate,
          ![@UI.Importance]: #Medium
        },
        {
          $Type            : 'UI.DataField',
          Label            : 'ManagerID',
          Value            : ManagerID,
          ![@UI.Importance]: #Medium
        },
        {
          $Type            : 'UI.DataField',
          Label            : 'Location',
          Value            : Location,
          ![@UI.Importance]: #Medium
        },
        {
          $Type            : 'UI.DataField',
          Label            : 'EmploymentType',
          Value            : EmploymentType,
          ![@UI.Importance]: #Medium
        },
        {
          $Type            : 'UI.DataField',
          Label            : 'Salary',
          Value            : Salary,
          ![@UI.Importance]: #Medium
        },
        {
          $Type : 'UI.DataFieldForAnnotation',
          Label : 'Rating',
          Target: '@UI.DataPoint#Rating'
        }
      ]
    },

  //   LineItem #TravelRequestsTable : [
   
  // ]


  },


  // UI.HeaderFacets     : [{
  //   $Type : 'UI.CollectionFacet',
  //   ID    : 'Headers', //From the fieldGroup#Headers
  //   Label : 'HeadersInfo', //From the fieldGroup#Headers
  //   Facets: [{
  //     $Type : 'UI.ReferenceFacet',
  //     // Label: 'Headers',
  //     Target: '@UI.FieldGroup#Headers' //From the fieldGroup#Headers
  //   },
  //     {
  //     $Type  : 'UI.ReferenceFacet',
  //     Target : '@UI.Chart#EmployeeRatingChart' // Reference Chart in HeaderFacets
  //   },
  //   {
  //     $Type  : 'UI.ReferenceFacet',
  //     Target : '@UI.Chart#EmployeeSalaryChart' // Reference Salary Chart in HeaderFacets
  //   }
  //   ]
  // }],


  UI.HeaderFacets : [{
  $Type : 'UI.CollectionFacet',
  ID    : 'Headers', 
  Label : 'Headers Info',
  Facets: [{
    $Type : 'UI.ReferenceFacet',
    Target: '@UI.FieldGroup#Headers'
  }]
},
{
  $Type : 'UI.CollectionFacet', // Ensures horizontal alignment
  Facets: [
    {
      $Type  : 'UI.ReferenceFacet',
      Target : '@UI.Chart#EmployeeRatingChart' // Reference Chart in HeaderFacets
    },
  ],
 
},
{
  $Type : 'UI.CollectionFacet', // Ensures horizontal alignment
  Facets: [
    {
      $Type  : 'UI.ReferenceFacet',
      Target : '@UI.Chart#EmployeeSalaryChart' // Reference Chart in HeaderFacets
    },
  ],
 
}
],


  UI.Facets           : [{
    $Type : 'UI.CollectionFacet',
    ID    : 'EmployeeInformation',
    Label : 'Employee Information',
    Facets: [{
      $Type : 'UI.ReferenceFacet',
      Target: '@UI.FieldGroup#EmployeeInformation'
    }]
  },
{
    $Type : 'UI.CollectionFacet',
    ID    : 'TravelRequests',
    Label : 'Travel Requests',
    Facets: [{
      $Type : 'UI.ReferenceFacet',
      Target: 'to_TravelRequests/@UI.LineItem'
    }]

   },
   {
    $Type : 'UI.CollectionFacet',
    ID    : 'FlightBookings',
    Label : 'FlightBooking',
    Facets: [{
      $Type : 'UI.ReferenceFacet',
      Target: 'to_FlightBookings/@UI.LineItem'
    }]

   },
   {
    $Type : 'UI.CollectionFacet',
    ID    : 'HotelBookings',
    Label : 'HotelBookings',
    Facets: [{
      $Type : 'UI.ReferenceFacet',
      Target: 'to_HotelBookings/@UI.LineItem'
    }]

   },
   {
    $Type : 'UI.CollectionFacet',
    ID    : 'Expenses',
    Label : 'Expenses',
    Facets: [{
      $Type : 'UI.ReferenceFacet',
      Target: 'to_Expenses/@UI.LineItem'
    }]

   }]


);

annotate travel.TravelRequests with @(
  UI: {
    LineItem: [
      {
        $Type : 'UI.DataField',
        Value : RequestID,
        Label : 'Request ID'
      },
      {
        $Type : 'UI.DataField',
        Value : Destination,
        Label : 'Destination'
      },
      {
        $Type : 'UI.DataField',
        Value : TravelDate,
        Label : 'Travel Date'
      },
      {
        $Type : 'UI.DataField',
        Value : ReturnDate,
        Label : 'Return Date'
      },
      {
        $Type : 'UI.DataField',
        Value : Status,
        Label : 'Status',
        Criticality: {
          $edmJson: {
            $If: [
              { $Eq: ['${Status}', 'Approved'] },
              3, // Green
              { $If: [
                { $Eq: ['${Status}', 'Rejected'] },
                1, // Red
                2  // Yellow for pending
              ]}
            ]
          }
        }
      }
    ],
    PresentationVariant: {
      $Type : 'UI.PresentationVariantType',
      SortOrder: [
        {
          $Type : 'Common.SortOrderType',
          Property : TravelDate,
          Descending: true
        }
      ]
    }
  },
    UI    : {                                                      //we need define
  FieldGroup #TravelRequestDetails: {
      $Type: 'UI.FieldGroupType',
      Data : [
        {
          $Type : 'UI.DataField',
          Label : 'Request ID',
          Value : RequestID
        },
        {
          $Type : 'UI.DataField',
          Label : 'Destination',
          Value : Destination
        },
        {
          $Type : 'UI.DataField',
          Label : 'Travel Date',
          Value : TravelDate
        },
        {
          $Type : 'UI.DataField',
          Label : 'Return Date',
          Value : ReturnDate
        },
        {
          $Type : 'UI.DataField',
          Label : 'Status',
          Value : Status
        },
        {
          $Type : 'UI.DataField',
          Label : 'Employee ID',
          Value : EmployeeID
        },
        {
          $Type : 'UI.DataField',
          Label : 'to_Employees',
          Value : to_Employees_EmployeeID             // from the CSV file we can see the correct column path
        }
      ]
    }
    },

    UI.Facets : [{
      $Type : 'UI.CollectionFacet',
      ID    : 'TravelRequestDetails',
      Label : 'Travel Request Details',
      Facets: [{
        $Type : 'UI.ReferenceFacet',
        Target: '@UI.FieldGroup#TravelRequestDetails'
      }]
    }]
);

annotate travel.FlightBookings with @(
  UI: {
    LineItem: [
      {
        $Type : 'UI.DataField',
        Value : RequestID,
        Label : 'Request ID'
      },
      {
        $Type : 'UI.DataField',
        Value : Airline,
        Label : 'Airline'
      },
      {
        $Type : 'UI.DataField',
        Value : FlightNumber,
        Label : 'FlightNumber'
      },
      {
        $Type : 'UI.DataField',
        Value : DepartureTime,
        Label : 'DepartureTime'
      }
    
    ]
  },
    UI    : {                                                      //we need define
  FieldGroup #FlightBookingDetails: {
      $Type: 'UI.FieldGroupType',
      Data : [
       {
        $Type : 'UI.DataField',
        Value : RequestID,
        Label : 'Request ID'
      },
      {
        $Type : 'UI.DataField',
        Value : Airline,
        Label : 'Airline'
      },
      {
        $Type : 'UI.DataField',
        Value : FlightNumber,
        Label : 'FlightNumber'
      },
      {
        $Type : 'UI.DataField',
        Value : DepartureTime,
        Label : 'DepartureTime'
      },
        {
          $Type : 'UI.DataField',
          Label : 'ArrivalTime',
          Value : ArrivalTime
        },
        {
          $Type : 'UI.DataField',
          Label : 'to_Employees',
          Value : to_Employees_EmployeeID             // from the CSV file we can see the correct column path
        }
      ]
    }
    },

    UI.Facets : [{
      $Type : 'UI.CollectionFacet',
      ID    : 'TravelRequestDetails',
      Label : 'Travel Request Details',
      Facets: [{
        $Type : 'UI.ReferenceFacet',
        Target: '@UI.FieldGroup#FlightBookingDetails'
      }]
    }]
);

annotate travel.HotelBookings with @(
  UI: {
    LineItem: [
      {
        $Type : 'UI.DataField',
        Value : RequestID,
        Label : 'Request ID'
      },
      {
        $Type : 'UI.DataField',
        Value : HotelName,
        Label : 'HotelName'
      },
      {
        $Type : 'UI.DataField',
        Value : RoomType,
        Label : 'RoomType'
      }
    
    
    ]
  },
    UI    : {                                                      //we need define
  FieldGroup #HotelBookingDetails: {
      $Type: 'UI.FieldGroupType',
      Data : [
      {
        $Type : 'UI.DataField',
        Value : RequestID,
        Label : 'Request ID'
      },
      {
        $Type : 'UI.DataField',
        Value : HotelName,
        Label : 'HotelName'
      },
      {
        $Type : 'UI.DataField',
        Value : RoomType,
        Label : 'RoomType'
      },
      {
        $Type : 'UI.DataField',
        Value : CheckInDate,
        Label : 'CheckInDate'
      },
        {
          $Type : 'UI.DataField',
          Label : 'CheckOutDate',
          Value : CheckOutDate
        },
        {
          $Type : 'UI.DataField',
          Label : 'to_Employees',
          Value : to_Employees_EmployeeID             // from the CSV file we can see the correct column path
        }
      ]
    }
    },

    UI.Facets : [{
      $Type : 'UI.CollectionFacet',
      ID    : 'HotelBookingDetails',
      Label : 'HotelBookings Details',
      Facets: [{
        $Type : 'UI.ReferenceFacet',
        Target: '@UI.FieldGroup#HotelBookingDetails'
      }]
    }]
);
annotate travel.Expenses with @(
  UI: {
    LineItem: [
      {
        $Type : 'UI.DataField',
        Value : RequestID,
        Label : 'Request ID'
      },
      {
        $Type : 'UI.DataField',
        Value : ExpenseType,
        Label : 'ExpenseType'
      },
      {
        $Type : 'UI.DataField',
        Value : Amount,
        Label : 'Amount'
      }
    
    
    ]
  },
    UI    : {                                                      //we need define
  FieldGroup #ExpensesDetails: {
      $Type: 'UI.FieldGroupType',
      Data : [
     {
        $Type : 'UI.DataField',
        Value : RequestID,
        Label : 'Request ID'
      },
      {
        $Type : 'UI.DataField',
        Value : ExpenseType,
        Label : 'ExpenseType'
      },
      {
        $Type : 'UI.DataField',
        Value : Amount,
        Label : 'Amount'
      },
      {
        $Type : 'UI.DataField',
        Value : Currency,
        Label : 'Currency'
      },
        {
          $Type : 'UI.DataField',
          Label : 'DateIncurred',
          Value : DateIncurred
        },
        {
          $Type : 'UI.DataField',
          Label : 'to_Employees',
          Value : to_Employees_EmployeeID             // from the CSV file we can see the correct column path
        }
      ]
    }
    },

    UI.Facets : [{
      $Type : 'UI.CollectionFacet',
      ID    : 'ExpensesDetails',
      Label : 'Expenses Details',
      Facets: [{
        $Type : 'UI.ReferenceFacet',
        Target: '@UI.FieldGroup#ExpensesDetails'
      }]
    }]
);




