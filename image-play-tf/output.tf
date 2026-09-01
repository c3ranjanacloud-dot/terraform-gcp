output "image_details" {
    value = {
        name = data.google_compute_image.my_image.name
        family = data.google_compute_image.my_image.family
        self_link = data.google_compute_image.my_image.self_link    
    }
}