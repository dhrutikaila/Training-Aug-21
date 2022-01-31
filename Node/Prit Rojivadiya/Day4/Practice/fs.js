// promises


const { unlink } = require("fs/promises");

(async () => {
  try {
    await unlink(`${__dirname}/files/thefile.txt`);
    console.log("successfully deleted /files/thefile");
  } catch (error) {
    console.error("there was an error:", error.message);
  }
})();


const { open } = require("fs/promises");
(async () => {
  let filehandle;
  try {
    filehandle = await open("./files/thefile.txt", "r");
  } finally {
    await filehandle?.close();
  }
})();
