const BILLER_DATA = [
  {
    "id": "0001",
    "name": "Kenya Power & Lighting Corporation",
    "image": "kplc.png",
    "fields": [
      {"id": "field001", "fieldName": "accountNumber"},
      {"id": "field002", "fieldName": "amount"},
    ]
  },
  {
    "id": "0002",
    "name": "Zuku Fibre",
    "image": "zuku.png",
    "fields": [
      {"id": "field001", "fieldName": "accountNumber"},
      {"id": "field002", "fieldName": "amount"},
    ]
  },
  {
    "id": "0003",
    "name": "Kenya Revenue Authority",
    "image": "kra.png",
    "fields": [
      {"id": "field001", "fieldName": "accountNumber"},
      {"id": "field002", "fieldName": "kraPin"},
      {"id": "field003", "fieldName": "amount"},
    ]
  },
  {
    "id": "0004",
    "name": "DStv",
    "image": "dstv.png",
    "fields": [
      {"id": "field001", "fieldName": "accountNumber"},
      {"id": "field003", "fieldName": "amount"},
    ]
  },
  {
    "id": "0005",
    "name": "GOtv",
    "image": "gotv.png",
    "fields": [
      {"id": "field001", "fieldName": "accountNumber"},
      {"id": "field003", "fieldName": "amount"},
    ]
  },
  {
    "id": "0006",
    "name": "Safaricom Home Fibre",
    "image": "safaricom.png",
    "fields": [
      {"id": "field001", "fieldName": "accountNumber"},
      {"id": "field003", "fieldName": "amount"},
    ]
  }
];

const BENEFICIARY_LIST = [
  {"id": "001", "name": "Antony", "image": "antony.png"},
  {"id": "002", "name": "Bella", "image": "bella.png"},
  {"id": "003", "name": "Sharon", "image": "sharon.png"},
  {"id": "004", "name": "Eddy", "image": "eddy.png"},
  {"id": "005", "name": "Jimmy", "image": "jimmy.png"},
  {"id": "006", "name": "Mary", "image": "mary.png"},
];

const CUSTOMER_BILLER_LIST = [
  {
    "id": "0001",
    "name": "Kenya Power & Lighting Corporation",
    "image": "kplc.png",
    "account": "22170407765",
    "source": "MPesa",
    "amount": "3500",
    "due_date": "25th April",
    "status":"Paid",
  },
  {
    "id": "0002",
    "name": "Zuku Fibre",
    "image": "zuku.png",
    "account": "826603",
    "source": "Wallet",
    "amount": "4199",
    "due_date": "30th April",
    "status":"Due",
  },
  {
    "id": "0003",
    "name": "Kenya Revenue Authority",
    "image": "kra.png",
    "account": "A00J56789",
    "source": "Bank",
    "amount": "1200",
    "due_date": "30th April",
    "status":"Paid",
  },
  {
    "id": "0004",
    "name": "DStv",
    "image": "dstv.png",
    "account": "00567234B",
    "source": "MPesa",
    "amount": "3499",
    "due_date": "28th April",
    "status":"Paid",
  },
  {
    "id": "0005",
    "name": "GOtv",
    "image": "gotv.png",
    "account": "00567234B",
    "source": "Bank",
    "amount": "3499",
    "due_date": "28th April",
    "status":"Due",
  },
];
