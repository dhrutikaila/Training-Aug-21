const PatientModel = require("../models/patient.model");

class PatientDomain {
    //To get all patients
    async getAllPatients(req, res) {
        const patients = await PatientModel.find().populate("department", "name -_id");
        res.send(patients);
    }
    //To get patient
    async getPatient(req, res) {
        let id = req.params.PatId;
        const patient = await PatientModel.findById(id);
        if (patient) {
            res.send(patient);
        } else {
            res.status(404).send("Patient Not Found");
        }
    }
    //To Insert patient
    async insertPatient(req, res) {

        let data = req.body;

        const patient = new PatientModel(data);
        try {
            const result = await patient.save();
            res.send(result);
        } catch (e) {
            res.send(e.message);
        }
    }
    //To delete a patient
    async deletePatient(req, res) {
        let id = req.params.PatId;
        const patient = await PatientModel.findByIdAndDelete(id);
        if (patient) {
            res.send("Deleted Successfully");
        } else {
            res.status(404).send("Data Not Found");
        }
    }
    // To update a patient
    async updatePatient(req, res) {
        const _id = req.params.id;
        const data = req.body;
        const result = await PatientModel.findByIdAndUpdate({ _id }, { $set: data }, { new: 1 });
        if (result) { res.send(result); }
        else { res.status(401).json({ message: "patient not found" }) }
    }
    //To get medicine
    async getPatientMedicine(req, res) {
        let id = req.params.PatId;
        const patient = await PatientModel.findById(id)
            .populate("medicines.medicine", "name -_id")
            .select("medicines -_id");
        if (patient) {
            res.send(patient);
        } else {
            res.status(404).send("Patient Not Found");
        }
    }
}

module.exports = PatientDomain;
