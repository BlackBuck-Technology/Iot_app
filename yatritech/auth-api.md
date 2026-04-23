# Auth API (Frontend Integration)

Base URL: `https://iot-backend-production-5190.up.railway.app`

API Prefix: `/api/v1`

All endpoints below are fully qualified production endpoints.

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

## 1) Register

```http
POST https://iot-backend-production-5190.up.railway.app/api/v1/auth/register
Content-Type: application/json
```

Request body:

```json
{
  "name": "John Doe",
  "email": "john@example.com",
  "password": "secret123"
}
```

Success `201`:

```json
{
  "success": true,
  "message": "Registration successful",
  "data": {
    "user": {
      "id": "6807b65da0a0b1a5d2d5ad10",
      "name": "John Doe",
      "email": "john@example.com",
      "createdAt": "2026-04-22T12:10:12.200Z",
      "updatedAt": "2026-04-22T12:10:12.200Z"
    },
    "token": "<jwt_token>"
  }
}
```

Possible errors:
- `Email already registered` (400)

## 2) Login

```http
POST https://iot-backend-production-5190.up.railway.app/api/v1/auth/login
Content-Type: application/json
```

Request body:

```json
{
  "email": "john@example.com",
  "password": "secret123"
}
```

Success `200`:

```json
{
  "success": true,
  "message": "Login successful",
  "data": {
    "user": {
      "id": "6807b65da0a0b1a5d2d5ad10",
      "name": "John Doe",
      "email": "john@example.com",
      "createdAt": "2026-04-22T12:10:12.200Z",
      "updatedAt": "2026-04-22T12:10:12.200Z"
    },
    "token": "<jwt_token>"
  }
}
```

Possible errors:
- `Invalid email or password` (401)

## 3) Forgot Password

```http
POST https://iot-backend-production-5190.up.railway.app/api/v1/auth/forgot-password
Content-Type: application/json
```

Request body:

```json
{
  "email": "john@example.com"
}
```

Success `200`:

```json
{
  "success": true,
  "message": "If the email exists, a reset link has been sent",
  "data": {
    "emailSent": true
  }
}
```

Notes:
- This returns success even if email does not exist (to prevent user enumeration).

## 4) Update Password

```http
POST https://iot-backend-production-5190.up.railway.app/api/v1/auth/update-password
Content-Type: application/json
```

Request body:

```json
{
  "token": "<reset_token>",
  "password": "newSecret123"
}
```

Success `200`:

```json
{
  "success": true,
  "message": "Password updated successfully",
  "data": {
    "updated": true
  }
}
```

Possible errors:
- `Invalid or expired reset token` (400)

## Common Validation Errors

From request schema validation:
- Missing required fields returns `400`
- Invalid email format returns `400`
- Password shorter than 6 chars returns `400`

Example validation error shape:

```json
{
  "success": false,
  "message": "body/password must NOT have fewer than 6 characters"
}
```
