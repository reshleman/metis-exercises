-- Return the oldest image for each gallery.
SELECT DISTINCT ON (galleries.id) galleries.name, images.name
  FROM galleries JOIN images
  ON galleries.id = images.gallery_id
  ORDER BY galleries.id, images.id ASC;
