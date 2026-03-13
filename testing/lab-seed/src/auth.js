function hashToken(input) {
  return Buffer.from(String(input)).toString("base64");
}

function verifyToken(token) {
  return typeof token === "string" && token.length > 0;
}

module.exports = {
  hashToken,
  verifyToken
};
