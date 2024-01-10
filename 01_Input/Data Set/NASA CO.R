# Load the necessary libraries
#install.packages("BiocManager")
#BiocManager::install("rhdf5")
library(rhdf5)
library(raster)
library(ggplot2)

getwd()

# Replace with your HDF5 file path
file_path <- "Data Set/NASA/MOP03JM-202209-L3V95.9.3.he5"

# List the contents of the file
file_contents <- h5ls(file_path)
print(file_contents)

# Read the HDF5 file
# Replace 'dataset_name' with the actual name of your dataset
nasa_data <- h5read("Data Set/NASA/MOP03JM-202209-L3V95.9.3.he5", "dataset_name")
print(nasa_data)

# Convert the data to a raster object
nasa_raster <- raster(nasa_data)

# Plot the raster data using base plot
plot(nasa_raster)

# Or plot the raster data using ggplot2 for more customization
ggplot() +
  geom_raster(data = as.data.frame(nasa_raster, xy = TRUE), aes(x = x, y = y, fill = value)) +
  scale_fill_viridis() +
  coord_fixed() +
  labs(title = "NASA Raster Data Visualization", x = "Longitude", y = "Latitude")
