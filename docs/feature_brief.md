# Feature brief: Trip ratings

**Product:** Ride Demo (fictional ride-booking service)
**Requested by:** Product
**Target:** API v1

## Problem
Passengers currently have no way to give feedback on a trip, and the operations team cannot see which drivers are performing well.

## What we want
1. After a trip is **completed**, the passenger can rate it with a **score from 1 to 5** and an optional **comment** (max 500 characters).
2. A trip can be rated **only once**.
3. Trips that are not completed (scheduled, in progress, cancelled) **cannot** be rated.
4. The driver endpoint (`GET /api/v1/drivers/:id`) exposes the driver's **average rating** (rounded to one decimal) and the **number of ratings**. A driver with no ratings returns `null` for the average and `0` for the count.

## Proposed API
`POST /api/v1/trips/:trip_id/rating`

Request body:
```json
{ "rating": { "score": 5, "comment": "Smooth trip, on time." } }
```

Responses:
- `201 Created` with the rating as JSON
- `422 Unprocessable Entity` with `{ "errors": [...] }` when the score is out of range, the trip is not completed, or the trip is already rated
- `404 Not Found` when the trip does not exist

## Out of scope
Editing or deleting a rating, driver replies, authentication.

## Acceptance criteria
- [ ] Migration, model, controller, serializer and request specs are in place
- [ ] Duplicate ratings are prevented at the database level as well as in the model
- [ ] The average is calculated in the database, not by loading every rating into Ruby
- [ ] All request specs pass
