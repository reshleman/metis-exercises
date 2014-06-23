-- Return the gallery id with the most images.
SELECT galleries.id, COUNT(*) as count
  FROM galleries JOIN images
  ON galleries.id = images.gallery_id
  GROUP BY galleries.id
  ORDER BY count DESC
  LIMIT 1;
