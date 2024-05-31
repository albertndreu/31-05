# Βασική εικόνα από το Rocker project
FROM rocker/r-ver:latest

# Εγκατάσταση πακέτων συστήματος που χρειάζονται για το R και το RStudio
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev

# Αντιγραφή της εφαρμογής στο container
COPY . /app

# Ρύθμιση του working directory
WORKDIR /app

# Εγκατάσταση των απαραίτητων R πακέτων
RUN R -e "install.packages(c('shiny', 'dplyr', 'ggplot2'), repos='http://cran.rstudio.com/')"

# Έκθεση του port που χρησιμοποιεί η εφαρμογή
EXPOSE 3838

# Εκκίνηση της εφαρμογής
CMD ["R", "-e", "shiny::runApp('/app')"]
