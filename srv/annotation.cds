using travelService as travel from './service';


annotate travel.Employees with @(

  UI.DataPoint #Rating: {
    Value        : Rating,
    TargetValue  : 5, // Assuming a maximum rating of 5
    Visualization: #Rating
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


  },


  UI.HeaderFacets     : [{
    $Type : 'UI.CollectionFacet',
    ID    : 'Headers', //From the fieldGroup#Headers
    Label : 'HeadersInfo', //From the fieldGroup#Headers
    Facets: [{
      $Type : 'UI.ReferenceFacet',
      // Label: 'Headers',
      Target: '@UI.FieldGroup#Headers' //From the fieldGroup#Headers
    }]
  }],
  UI.Facets           : [{
    $Type : 'UI.CollectionFacet',
    ID    : 'EmployeeInformation',
    Label : 'Employee Information',
    Facets: [{
      $Type : 'UI.ReferenceFacet',
      Target: '@UI.FieldGroup#EmployeeInformation'
    }]
  }]


);
