-- Return the count of all sushi images in galleries that have any.
SELECT galleries.name, COUNT(*)
  FROM galleries JOIN images
  ON galleries.id = images.gallery_id
  WHERE images.name ILIKE '%sushi%'
  GROUP BY galleries.id;
