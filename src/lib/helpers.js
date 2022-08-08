const bcryp = require('bcryptjs');
const helper = require('./handlebars');

const  helpers = {};

helpers.encrypPass = async (pass) =>{
    const salt = await bcryp.genSalt(10);
    const hash = await bcryp.hash(pass, salt);
    return hash;    
}; 

helpers.matchPass = async(pass, savedPass)=>{
    try {
        return await bcryp.compare(pass, savedPass);
    } catch (error) {
        console.log(error);
    }
};

module.exports = helpers;