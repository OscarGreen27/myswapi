# Star Wars API

A REST API based on the [Star Wars API (SWAPI)](https://swapi.dev/) built with NestJS and PostgreSQL. Supports full CRUD for all Star Wars entities, JWT authentication, role-based access control, and image uploads to AWS S3.

## Tech Stack

- **Runtime:** Node.js with TypeScript
- **Framework:** NestJS 11
- **Database:** PostgreSQL (`TypeORM`)
- **Authentication:** JWT (`@nestjs/jwt`)
- **Validation:** class-validator + class-transformer
- **Image storage:** AWS S3 (`@aws-sdk/client-s3`)
- **Documentation:** Swagger (`@nestjs/swagger`)
- **Containerization:** Docker

## Getting Started

### Prerequisites

- Node.js 18+
- PostgreSQL
- AWS S3 bucket (for image uploads)
- Docker (optional)

### Installation

```bash
git clone <repo-url>
cd myswapi
npm install

Database Setup

Before starting the application, create an empty PostgreSQL database and restore the SQL backups located in the backup/ directory.

The backups should be restored in the following order:

Order	File	Description
1	backup/1.sw.sql	Creates the Star Wars schemas and imports all SWAPI data
2	backup/2.image.sql	Creates the image schema and image.image table
3	backup/3.user.sql	Creates the user schema and user.user table

Example:

createdb starwars

psql -U postgres -d starwars < backup/1.sw.sql
psql -U postgres -d starwars < backup/2.image.sql
psql -U postgres -d starwars < backup/3.user.sql

Note

>The image and user backups create empty tables only. The application starts with all Star Wars data already imported while user accounts >and uploaded images can be created during normal usage.
```

### Environment Variables

Copy `.example.env` to `.env` and fill in the values:

```bash
cp .example.env .env
```

| Variable              | Description                        | Example              |
|-----------------------|------------------------------------|----------------------|
| `PORT`                | Server port                        | `3000`               |
| `DB_HOST`             | PostgreSQL host                    | `localhost`          |
| `DB_PORT`             | PostgreSQL port                    | `5432`               |
| `DB_USERNAME`         | PostgreSQL username                | `postgres`           |
| `DB_PASSWORD`         | PostgreSQL password                | —                    |
| `DB_NAME`             | PostgreSQL database name           | `starwars`           |
| `JWT_SECRET`          | Secret for signing JWT tokens      | —                    |
| `S3_REGION`           | AWS S3 region                      | `us-east-1`          |
| `S3_BUCKET_NAME`      | AWS S3 bucket name                 | —                    |
| `S3_ACCESS_KEY`       | AWS access key ID                  | —                    |
| `S3_SECRET_ACCESS_KEY`| AWS secret access key              | —                    |
| `SALT`                | bcrypt salt rounds                 | `10`                 |

### Running

```bash
# Development
npm run start:dev

# Production build
npm run build
npm run start:prod
```

### Running with Docker

```bash
docker compose up
```

### API Documentation

After starting the server, Swagger UI is available at:
```
http://localhost:<PORT>/api-docs
```

## Roles

| Role    | Permissions                                      |
|---------|--------------------------------------------------|
| `user`  | Read-only access to all entities and images      |
| `admin` | Full CRUD access to all entities and images      |

New accounts are registered with `user` role by default.

## API Reference

All endpoints (except `auth`) require a JWT token in the `Authorization: Bearer <token>` header.

---

### Auth

#### `POST /auth/login`
Log in and receive a JWT token.

**Request body:**
```json
{
  "userData": {
    "userName": "string",
    "password": "string"
  }
}
```

**Responses:**
| Status | Description |
|--------|-------------|
| `200`  | Returns JWT access token |
| `401`  | Invalid credentials |

---

#### `POST /auth/registration`
Register a new user account.

**Request body:**
```json
{
  "newUserData": {
    "userName": "string",
    "password": "string"
  }
}
```

**Responses:**
| Status | Description |
|--------|-------------|
| `201`  | User registered successfully |
| `409`  | Username already exists |

---

### Entities

All six Star Wars entities (`people`, `films`, `planets`, `species`, `starships`, `vehicles`) share the same CRUD structure:

| Method | Endpoint         | Role          | Description |
|--------|------------------|---------------|-------------|
| `GET`  | `/<entity>`      | user, admin   | Get all records (supports `?page` and `?limit`) |
| `GET`  | `/<entity>/:id`  | user, admin   | Get a single record by ID |
| `POST` | `/<entity>`      | admin only    | Create a new record |
| `PUT`  | `/<entity>/:id`  | admin only    | Update a record by ID |
| `DELETE` | `/<entity>/:id`| admin only    | Delete a record by ID |

**Pagination query params:**
| Param   | Type   | Description |
|---------|--------|-------------|
| `page`  | number | Page number (default: 1) |
| `limit` | number | Records per page (default: 10) |

**Available entities:**

| Entity      | Base URL     |
|-------------|--------------|
| People      | `/people`    |
| Films       | `/film`      |
| Planets     | `/planet`    |
| Species     | `/specie`    |
| Starships   | `/starship`  |
| Vehicles    | `/vehicle`   |

---

### Images

#### `GET /images`
Get all images for a specific entity.

**Roles:** `user`, `admin`

**Query params:**
| Param         | Type   | Description |
|---------------|--------|-------------|
| `id`          | number | Entity ID |
| `entity_type` | string | Entity type (e.g. `people`, `film`) |

**Responses:**
| Status | Description |
|--------|-------------|
| `200`  | Array of image records |
| `401`  | Not authenticated |

---

#### `POST /images/upload`
Upload an image for a specific entity to AWS S3.

**Roles:** `admin` only

**Form data:**
| Field         | Type   | Description |
|---------------|--------|-------------|
| `file`        | file   | Image file |
| `id`          | number | Entity ID |
| `entity_type` | string | Entity type (e.g. `people`, `film`) |

**Responses:**
| Status | Description |
|--------|-------------|
| `201`  | Image uploaded, returns image record |
| `401`  | Not authenticated |
| `403`  | Insufficient permissions |
| `500`  | Failed to upload to S3 |

---

#### `DELETE /images`
Delete an image from AWS S3 and the database.

**Roles:** `admin` only

**Query params:**
| Param | Type   | Description |
|-------|--------|-------------|
| `key` | string | Image key from S3 |

**Responses:**
| Status | Description |
|--------|-------------|
| `200`  | Returns deletion status from DB and S3 |
| `401`  | Not authenticated |
| `403`  | Insufficient permissions |

---

## Error Format

All errors follow the NestJS default format:

```json
{
  "statusCode": 400,
  "message": "Description of the error",
  "error": "Bad Request"
}
```

| Status | Meaning |
|--------|---------|
| `400`  | Bad request |
| `401`  | Not authenticated |
| `403`  | Insufficient permissions |
| `404`  | Resource not found |
| `409`  | Conflict (e.g. username already exists) |
| `500`  | Internal server error |
