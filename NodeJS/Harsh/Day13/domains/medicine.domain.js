const MedicineModel = require("../models/medicine.model");

class MedicineDomain {
    //To get all medicine
    async getAllMedicine(req, res) {
        const medicine = await MedicineModel.find();
        res.send(medicine);
    }
    //To get medicine
    async getMedicine(req, res) {
        let id = req.params.MedId;
        const medicine = await MedicineModel.findById(id);
        if (medicine) {
            res.send(medicine);
        } else {
            res.status(404).send("Medicine Not Found");
        }
    }
    //To Insert medicine
    async insertMedicine(req, res) {
        let data = req.body;

        const medicine = new MedicineModel(data);
        try {
            const result = await medicine.save();
            res.send(result);
        } catch (e) {
            res.send(e.message);
        }
    }
    //To delete a medicine
    async deleteMedicine(req, res) {
        let id = req.params.MedId;
        const medicine = await MedicineModel.findByIdAndDelete(id);
        if (medicine) {
            res.send("Medicine Record Deleted Successfully");
        } else {
            res.status(404).send("Data Not Found");
        }
    }
    // To update a medicine
    async updateMedicine(req, res) {
        const _id = req.params.id;
        const data = req.body;
        const result = await MedicineModel.findByIdAndUpdate({ _id }, { $set: data }, { new: 1 });
        if (result) { res.send(result); }
        else { res.status(401).json({ message: "medicine not found" }) }
    }
}

module.exports = MedicineDomain;
