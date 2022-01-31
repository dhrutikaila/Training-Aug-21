export interface iStudent{
    FirstName: string;
    MiddleName: string;
    LastName: string;
    Dob: Date;
    PlaceOfBirth: string;
    FirstLanguage: string;
    Address: {
        City: string,
        State: string,
        Country: string,
        Pin: number
    },
    Father: {
        FatherFirstName: string,
        FatherMiddleName: string,
        FatherLastName: string,
        FatherEmail: string,
        FatherEducationQualification: string,
        FatherProfession: string,
        FatherDesignation: string,
        FatherPhone: number
    },
    Mother: {
        MotherFirstName: string,
        MotherMiddleName: string,
        MotherLastName: string,
        MotherEmail: string,
        MotherEducationQualification: string,
        MotherProfession: string,
        MotherDesignation: string,
        MotherPhone: number
    },
    EmergancyContactList: [{
        Relation: string,
        Number: number,
        ReferenceDetails: string,
        ReferenceThrough: string,
        Address: string
    }];
}