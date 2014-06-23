-- Return the number of images for each gallery.
SELECT galleries.name, COUNT(*)
  FROM galleries JOIN images
  ON galleries.id = images.gallery_id
  GROUP BY galleries.id;
