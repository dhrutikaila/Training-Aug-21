export interface Istudent {
    firstName :string ,
    middleName:string ,
    lastName : string ,
    dob : string,
    placeOfBirth:string,
    firstLanguage:string
    address :{
        city:string,
        state : string,
        country : string,
        pinCode:string
    },
    FatherDetails:{
        firstName:string,
        middleName:string,
        lastName:string,
        email:string,
        Qualification: string,
        profession:string,
        designation:string,
        phoneNumber:string
    },
    MotherDetails:{
        firstName:string,
        middleName:string,
        lastName:string,
        email:string,
        Qualification: string,
        profession:string,
        designation:string,
        phoneNumber:string
    },
    emergencyContact :[
        relation : string,
        phonenumber : string
    ]
}