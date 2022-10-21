"use strict";

const AuthFuncs = require('../libAuthChecks/mjolnir');

const CBFuncs = require('./libCB/CB_library');
require('dotenv').config();
console.log('CB_BUCKET:' + process.env.CB_BUCKET);
console.log('CB_SCOPE:' + process.env.CB_SCOPE);
console.log('CB_COLLECTION:' + process.env.CB_COLLECTION);
const USER_LOGIN_CB_COLLECTION = "userlogins"

const CBTable = '\`' + process.env.CB_BUCKET + '\`.\`' + process.env.CB_SCOPE + '\`.\`' + process.env.CB_COLLECTION + '\`';
const userloginCBTable = '\`' + process.env.CB_BUCKET + '\`.\`' + process.env.CB_SCOPE + '\`.\`';

module.exports.cb_getbyadvertiser = async (event) => {
  
  // REAL CODE

  const advertiserID = event.pathParameters.advertiserid;
  console.log('advertiserID:' + advertiserID);

  const queryOffset = event.pathParameters.offset;
  console.log('queryOffset:' + queryOffset);
  const queryLimit = event.pathParameters.limit;
  console.log('queryLimit:' + queryLimit);
 
  const GSI2PK = 'ADVERTISERUSER#' + advertiserID;
  const GSI2SK =  'ADVERTISERUSER#' + advertiserID;
  const options = { parameters: { TYPE: 'AdvertiserUser', GSI2PK: GSI2PK} };

  const qs = `SELECT
    DISTINCT a.userid, b.primaryEmail as email
    FROM  ` + CBTable + ` a INNER JOIN ` + userloginCBTable + ` b 
    ON b.id = a.userid
    AND a.GSI2PK = '` + GSI2PK + `'
    OFFSET ` + queryOffset + ` 
    LIMIT ` + queryLimit + ` `;

  const result = await CBFuncs.lib.genericREAD(options, qs);

  if (result === null) {
    return {
      statusCode: 501,
      headers: { "Content-Type": "text/plain" },
      body: "Couldn't fetch the Advertiser Users.",
    };
  } else {

    if (result.length === 0) {
      return {
        statusCode: 404,
        headers: { "Content-Type": "text/plain" },
        body: "Users with the AdvertiserId specified does not exists.",
      };

    } else {
      return {
        statusCode: 200,
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify( { Items: result } ),
      };
    }
  }
};
