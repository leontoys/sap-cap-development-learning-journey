using EmployeeOdataService as service from '../../srv/service';
using from '../../db/datamodel';

annotate service.Employee with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'firstName',
                Value : firstName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'lastName',
                Value : lastName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'address',
                Value : address,
            },
            {
                $Type : 'UI.DataField',
                Label : 'mobile',
                Value : mobile,
            },
            {
                $Type : 'UI.DataField',
                Label : 'salary',
                Value : salary,
            },
            {
                $Type : 'UI.DataField',
                Label : 'email',
                Value : email,
            },
            {
                $Type : 'UI.DataField',
                Value : familyMembers.address,
                Label : 'address',
            },
            {
                $Type : 'UI.DataField',
                Value : familyMembers.firstName,
                Label : 'firstName',
            },
            {
                $Type : 'UI.DataField',
                Value : familyMembers.lastName,
                Label : 'lastName',
            },
            {
                $Type : 'UI.DataField',
                Value : familyMembers.mobile,
                Label : 'mobile',
            },
            {
                $Type : 'UI.DataField',
                Value : familyMembers.relationship,
                Label : 'relationship',
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Employees',
            ID : 'Employees',
            Target : '@UI.FieldGroup#Employees',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Family',
            ID : 'Family',
            Target : 'familyMembers/@UI.LineItem#Family',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'First Name',
            Value : firstName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Last Name',
            Value : lastName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Address',
            Value : address,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Mobile',
            Value : mobile,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Salary',
            Value : salary,
        },
    ],
    UI.FieldGroup #Employees : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : address,
                Label : 'address',
            },
            {
                $Type : 'UI.DataField',
                Value : email,
                Label : 'email',
            },
            {
                $Type : 'UI.DataField',
                Value : firstName,
                Label : 'firstName',
            },
            {
                $Type : 'UI.DataField',
                Value : ID,
                Label : 'ID',
            },
            {
                $Type : 'UI.DataField',
                Value : lastName,
                Label : 'lastName',
            },
            {
                $Type : 'UI.DataField',
                Value : salary,
                Label : 'salary',
            },
            {
                $Type : 'UI.DataField',
                Value : designation_code,
                Label : 'designation_code',
            },
        ],
    },
    UI.FieldGroup #Family : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    },
);

annotate service.FamilyMember with @(
    UI.LineItem #Family : [
        {
            $Type : 'UI.DataField',
            Value : firstName,
            Label : 'firstName',
        },
        {
            $Type : 'UI.DataField',
            Value : lastName,
            Label : 'lastName',
        },
        {
            $Type : 'UI.DataField',
            Value : relationship,
            Label : 'relationship',
        },
        {
            $Type : 'UI.DataField',
            Value : mobile,
            Label : 'mobile',
        },
    ]
);

annotate service.Employee with {
    designation @(
        Common.ExternalID : designation.name,
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Designations',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : designation_code,
                    ValueListProperty : 'code',
                },
            ],
            Label : 'designation',
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.Employee @(Common.SideEffects #updateSalary : {
    SourceProperties  : ['designation_code'],
    TargetProperties: ['salary']
});