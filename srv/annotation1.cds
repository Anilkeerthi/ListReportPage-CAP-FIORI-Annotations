using travelService as travel from './service';


annotate travel.TravelRequests with @(
    // Main UI annotation for the list report
    UI: {
        SelectionFields: [Status],
        SelectionVariant #Pending: {
            $Type: 'UI.SelectionVariantType',
            Text: 'Pending',
            SelectOptions: [{
                $Type: 'UI.SelectOptionType',
                PropertyName: Status,
                Ranges: [{
                    $Type: 'UI.SelectionRangeType',
                    Option: #EQ,
                    Sign: #I,
                    Low: 'Pending'
                }]
            }]
        },
        SelectionVariant #Approved: {
            $Type: 'UI.SelectionVariantType',
            Text: 'Approved',
            SelectOptions: [{
                $Type: 'UI.SelectOptionType',
                PropertyName: Status,
                Ranges: [{
                    $Type: 'UI.SelectionRangeType',
                    Option: #EQ,
                    Sign: #I,
                    Low: 'Approved'
                }]
            }]
        },
        SelectionVariant #Rejected: {
            $Type: 'UI.SelectionVariantType',
            Text: 'Rejected',
            SelectOptions: [{
                $Type: 'UI.SelectOptionType',
                PropertyName: Status,
                Ranges: [{
                    $Type: 'UI.SelectionRangeType',
                    Option: #EQ,
                    Sign: #I,
                    Low: 'Rejected'
                }]
            }]
        },
        // Define LineItem annotation for the table columns
        LineItem #Travel: [
            {Value: EmployeeID},
            {Value: Destination},
            {Value: TravelDate},
            {Value: ReturnDate},
            {Value: Status}
        ],
        // Define PresentationVariant for default sorting and grouping
        PresentationVariant #Present: {
            SortOrder: [{
                Property: TravelDate,
                Descending: true
            }],
            Visualizations: ['@UI.LineItem#Travel']
        }
    }
);