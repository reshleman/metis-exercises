-- Return all images that have don't have any likes or don't have a description.
SELECT name FROM images WHERE likes = 0 OR description IS NULL;
