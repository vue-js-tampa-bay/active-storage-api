json.id thing.id
json.name thing.name
json.description thing.description
json.image thing.image.attached? ? polymorphic_url(thing.image) : 'Image Not Available'