const AssistantModel = require("../models/assistant.model");

class AssistantDomain {
    //To get all assistant
    async getAllAssistant(req, res) {
        const assistant = await AssistantModel.find().populate("patients", "name -_id");
        res.send(assistant);
    }
    //To get assistant
    async getAssistant(req, res) {
        let id = req.params.AstId;
        const assistant = await AssistantModel.findById(id);
        if (assistant) {
            res.send(assistant);
        } else {
            res.status(404).send("Assistant Not Found");
        }
    }
    //To Insert assistant
    async insertAssistant(req, res) {
        let data = req.body;

        const assistant = new AssistantModel(data);
        try {
            const result = await assistant.save();
            res.send(result);
        } catch (e) {
            res.send(e.message);
        }
    }
    //To delete assistant
    async deleteAssistant(req, res) {
        let id = req.params.AstId;
        const assistant = await AssistantModel.findByIdAndDelete(id);
        if (assistant) {
            res.send("Deleted Successfully");
        } else {
            res.status(404).send("Data Not Found");
        }
    }
    // To update assistant 
    async updateAssistant(req, res) {
        const _id = req.params.id;
        const data = req.body;
        const result = await AssistantModel.findByIdAndUpdate({ _id }, { $set: data }, { new: 1 });
        if (result) { res.send(result); }
        else { res.status(401).json({ message: "assistant not found" }) }
    }

}

module.exports = AssistantDomain;
