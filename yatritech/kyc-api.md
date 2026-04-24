# KYC API (Frontend Integration)

Base URL: `https://iot-backend-production-5190.up.railway.app`

API Prefix: `/api/v1`

All endpoints below are fully qualified production endpoints.

## Authentication

Every KYC endpoint requires JWT:

```http
Authorization: Bearer <token>
```

If token is missing/invalid:

```json
{
  "success": false,
  "message": "Unauthorized"
}
```

## Response Contract

Success:

```json
{
  "success": true,
  "message": "...",
  "data": { ... }
}
```

Error:

```json
{
  "success": false,
  "message": "..."
}
```

## 1) Get My KYC

```http
GET https://iot-backend-production-5190.up.railway.app/api/v1/kyc/me
```

Success `200`:

```json
{
  "success": true,
  "message": "KYC profile fetched successfully",
  "data": {
    "kyc": {
      "id": "6807b6f6a0a0b1a5d2d5ad1e",
      "userId": "6807b65da0a0b1a5d2d5ad10",
      "status": "draft",
      "submittedAt": null,
      "reviewedAt": null,
      "rejectionReason": null,
      "completedSteps": {
        "personal": true,
        "citizenship": false,
        "license": false,
        "vehicle": false
      },
      "personal": {
        "fullName": "John Doe",
        "dateOfBirth": "1997-03-05T00:00:00.000Z",
        "gender": "Male",
        "nationality": "Nepali",
        "currentAddress": "Kathmandu, Street 1",
        "mobileNumber": "9800000000",
        "photo": {
          "storageKey": "kyc/6807b65da0a0b1a5d2d5ad10/personal/photo-1745334440107-1f507228fda8c4db.jpg",
          "originalName": "profile.jpg",
          "mimeType": "image/jpeg",
          "size": 103212
        }
      },
      "citizenship": {
        "citizenshipNumber": "",
        "dateOfIssue": null,
        "placeOfIssue": "",
        "frontPhoto": null,
        "backPhoto": null
      },
      "license": {
        "licenseNumber": "",
        "dateOfIssue": null,
        "placeOfIssue": "",
        "photo": null
      },
      "vehicle": {
        "registrationNumber": "",
        "dateOfRegistration": null,
        "brand": "",
        "color": "",
        "vehiclePhoto": null,
        "bluebookPhoto": null
      },
      "createdAt": "2026-04-22T12:10:12.200Z",
      "updatedAt": "2026-04-22T12:15:32.650Z"
    }
  }
}
```

## 2) Save Personal Step

```http
PUT https://iot-backend-production-5190.up.railway.app/api/v1/kyc/personal
Content-Type: multipart/form-data
```

Required fields:
- `fullName`
- `dateOfBirth` (valid date)
- `gender`
- `nationality`
- `currentAddress`
- `mobileNumber`
- `photo` (PNG/JPG, max 1MB)

Success `200` message:
- `Personal KYC step saved successfully`

## 3) Save Citizenship Step

```http
PUT https://iot-backend-production-5190.up.railway.app/api/v1/kyc/citizenship
Content-Type: multipart/form-data
```

Required fields:
- `citizenshipNumber`
- `dateOfIssue` (valid date)
- `placeOfIssue`
- `frontPhoto` (PNG/JPG, max 1MB)
- `backPhoto` (PNG/JPG, max 1MB)

Success `200` message:
- `Citizenship KYC step saved successfully`

## 4) Save License Step

```http
PUT https://iot-backend-production-5190.up.railway.app/api/v1/kyc/license
Content-Type: multipart/form-data
```

Required fields:
- `licenseNumber`
- `dateOfIssue` (valid date)
- `placeOfIssue`
- `photo` (PNG/JPG, max 1MB)

Success `200` message:
- `License KYC step saved successfully`

## 5) Save Vehicle Step

```http
PUT https://iot-backend-production-5190.up.railway.app/api/v1/kyc/vehicle
Content-Type: multipart/form-data
```

Required fields:
- `registrationNumber`
- `dateOfRegistration` (valid date)
- `brand`
- `color`
- `vehiclePhoto` (PNG/JPG, max 1MB)
- `bluebookPhoto` (PNG/JPG, max 1MB)

Success `200` message:
- `Vehicle KYC step saved successfully`

Each step-save returns the full KYC payload in `data.kyc` (same shape as `GET /api/v1/kyc/me`).

## 6) Submit KYC

```http
POST https://iot-backend-production-5190.up.railway.app/api/v1/kyc/submit
```

Success `200`:

```json
{
  "success": true,
  "message": "KYC submitted successfully",
  "data": {
    "kyc": {
      "status": "submitted",
      "submittedAt": "2026-04-23T01:30:00.000Z"
    }
  }
}
```

If steps are incomplete (`400`):

```json
{
  "success": false,
  "message": "Please complete all KYC steps before submitting"
}
```

## 7) Fetch Uploaded KYC File

```http
GET https://iot-backend-production-5190.up.railway.app/api/v1/kyc/files/:step/:field
```

Allowed `step` values:
- `personal`
- `citizenship`
- `license`
- `vehicle`

Allowed `field` values:
- `photo`
- `frontPhoto`
- `backPhoto`
- `vehiclePhoto`
- `bluebookPhoto`

Example:

```http
GET https://iot-backend-production-5190.up.railway.app/api/v1/kyc/files/citizenship/frontPhoto
```

Success returns binary image stream with `Content-Type` and inline filename.

## Common KYC Errors

- `Content-Type must be multipart/form-data` (400)
- `Unexpected file field: <field>` (400)
- `File <field> must be PNG or JPG` (400)
- `File <field> exceeds 1MB limit` (400)
- `<field> is required` (400)
- `<field> file is required` (400)
- `<field> must be a valid date` (400)
- `KYC already submitted and pending review` (409)
- `KYC is already approved and cannot be modified` (409)
- `Requested file not found` (404)
