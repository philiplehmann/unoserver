import { spawn } from "child_process";
import express from "express";

const PORT = process.env.PORT || "5000";

const unoserver = spawn("unoserver", { stdio: "inherit" });
const app = express();

app.post("/convert", (req, res) => {
  // unoconvert [-h] [--convert-to CONVERT_TO] [--filter FILTER_NAME] [--interface INTERFACE] [--port PORT] infile outfile
  const convertTo = "pdf";
  const unoconvert = spawn("unoconvert", ["--convert-to", convertTo, "-", "-"]);
  req.pipe(unoconvert.stdin);
  unoconvert.stdout.pipe(res);
});

app.listen(Number(PORT), () => {
  console.log("start unoconv server on ", PORT);
});

process.on("exit", () => {
  unoserver.kill();
});
